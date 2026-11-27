import 'package:alzefr_dash/config/envs/prod_env.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('عناوين الإنتاج تشير إلى خادم وموقع فعليين', () {
    final env = ProdEnv();

    for (final url in [env.baseUrl, env.authBaseUrl, env.dashboardUrl]) {
      final uri = Uri.parse(url);
      expect(uri.scheme, 'https');
      expect(uri.host, isNotEmpty);
    }
    expect(Uri.parse(env.baseUrl).path, '/api/admin/');
    expect(Uri.parse(env.dashboardUrl).host, 'elzefir-dash-prod-ab0e1.web.app');
  });
}
