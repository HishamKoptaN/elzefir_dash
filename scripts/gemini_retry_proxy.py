import json
import re
import time
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from urllib import request, error

UPSTREAM_BASE = "https://generativelanguage.googleapis.com"
LISTEN_HOST = "127.0.0.1"
LISTEN_PORT = 8787
MAX_RETRIES = 6
DEFAULT_WAIT = 42.0

def extract_retry_seconds(body_text: str, retry_after_header: str | None) -> float:
    if retry_after_header:
        try:
            return max(1.0, float(retry_after_header.strip()) + 2.0)
        except ValueError:
            pass
    match = re.search(r"retry\s+in\s+([0-9]+(?:\.[0-9]+)?)s", body_text, re.IGNORECASE)
    if match:
        return max(1.0, float(match.group(1)) + 2.5)
    return DEFAULT_WAIT

class ProxyHandler(BaseHTTPRequestHandler):
    protocol_version = "HTTP/1.1"

    def do_POST(self):
        length = int(self.headers.get("Content-Length", 0))
        payload = self.rfile.read(length)
        target_url = f"{UPSTREAM_BASE}{self.path}"

        for attempt in range(1, MAX_RETRIES + 1):
            req = request.Request(target_url, data=payload, method="POST")
            for k, v in self.headers.items():
                if k.lower() not in ("host", "content-length", "connection"):
                    req.add_header(k, v)

            try:
                with request.urlopen(req, timeout=180) as resp:
                    body = resp.read()
                    self.send_response(resp.status)
                    for k, v in resp.headers.items():
                        if k.lower() not in ("transfer-encoding", "connection", "content-length"):
                            self.send_header(k, v)
                    self.send_header("Content-Length", str(len(body)))
                    self.end_headers()
                    self.wfile.write(body)
                    return

            except error.HTTPError as e:
                err_body = e.read().decode("utf-8", errors="replace")
                if e.code == 429 and attempt < MAX_RETRIES:
                    wait_sec = extract_retry_seconds(err_body, e.headers.get("Retry-After"))
                    print(f"[RetryProxy] 429 hit (attempt {attempt}/{MAX_RETRIES}). Sleeping {wait_sec:.1f}s...", flush=True)
                    time.sleep(wait_sec)
                    continue

                err_bytes = err_body.encode("utf-8")
                self.send_response(e.code)
                self.send_header("Content-Type", "application/json")
                self.send_header("Content-Length", str(len(err_bytes)))
                self.end_headers()
                self.wfile.write(err_bytes)
                return

            except Exception as exc:
                if attempt < MAX_RETRIES:
                    wait_sec = 5.0 * attempt
                    print(f"[RetryProxy] Network error: {exc}. Sleeping {wait_sec:.1f}s...", flush=True)
                    time.sleep(wait_sec)
                    continue
                msg = json.dumps({"error": str(exc)}).encode("utf-8")
                self.send_response(502)
                self.send_header("Content-Type", "application/json")
                self.send_header("Content-Length", str(len(msg)))
                self.end_headers()
                self.wfile.write(msg)
                return

    def log_message(self, format, *args):
        return

if __name__ == "__main__":
    server = ThreadingHTTPServer((LISTEN_HOST, LISTEN_PORT), ProxyHandler)
    print(f"[RetryProxy] Listening on http://{LISTEN_HOST}:{LISTEN_PORT}", flush=True)
    server.serve_forever()
