import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    @JsonKey(name: "id", defaultValue: -1) int? id,
    @JsonKey(name: "avatar", defaultValue: "") String? avatar,
    @JsonKey(name: "name", defaultValue: "") String? name,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone", defaultValue: "") String? phone,
    @JsonKey(name: "online_offline", defaultValue: "") String? onlineOffline,
    @JsonKey(name: "status", defaultValue: false) bool? status,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
  }) = _UserModel;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
