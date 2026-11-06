class PresignedUrlEntity {
  final String? uploadUrl;
  final String? filePath;
  final String? contentType;
  final int? expiresAt;
  final String? token;

  PresignedUrlEntity({
    this.uploadUrl,
    this.filePath,
    this.contentType,
    this.expiresAt,
    this.token,
  });

  PresignedUrlEntity copyWith({
    String? uploadUrl,
    String? filePath,
    String? contentType,
    int? expiresAt,
    String? token,
  }) {
    return PresignedUrlEntity(
      uploadUrl: uploadUrl ?? this.uploadUrl,
      filePath: filePath ?? this.filePath,
      contentType: contentType ?? this.contentType,
      expiresAt: expiresAt ?? this.expiresAt,
      token: token ?? this.token,
    );
  }
}
