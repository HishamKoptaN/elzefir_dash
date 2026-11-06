import 'package:universal_io/io.dart';

class UpdateProfileReqEntity {
  UpdateProfileReqEntity({
    this.id,
    this.avatar,
    this.avatarPath,
    this.name,
    this.username,
    this.phoneNumber,
    this.dialCode,
    this.isoCode,
  });
  final int? id;
  final File? avatar;
  final String? avatarPath;
  final String? name;
  final String? username;
  final String? phoneNumber;
  final String? dialCode;
  final String? isoCode;

  UpdateProfileReqEntity copyWith({
    int? id,
    String? avatarPath,
    String? name,
    String? username,
    String? phoneNumber,
    String? dialCode,
    String? isoCode,
  }) {
    return UpdateProfileReqEntity(
      id: id ?? this.id,
      avatarPath: avatarPath ?? this.avatarPath,
      name: name ?? this.name,
      username: username ?? this.username,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dialCode: dialCode ?? this.dialCode,
      isoCode: isoCode ?? this.isoCode,
    );
  }
}
