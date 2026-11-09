// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
User _$UserFromJson(
  Map<String, dynamic> json
) {
    return _UserModel.fromJson(
      json
    );
}

/// @nodoc
mixin _$User {

@JsonKey(name: "id", defaultValue: -1) int? get id;@JsonKey(name: "avatar", defaultValue: "") String? get avatar;@JsonKey(name: "name", defaultValue: "") String? get name;@JsonKey(name: "email") String? get email;@JsonKey(name: "phone", defaultValue: "") String? get phone;@JsonKey(name: "online_offline", defaultValue: "") String? get onlineOffline;@JsonKey(name: "status", defaultValue: false) bool? get status;@JsonKey(name: "created_at") DateTime? get createdAt;@JsonKey(name: "updated_at") DateTime? get updatedAt;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as User;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.avatar, _this.avatar) || other.avatar == _this.avatar)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.onlineOffline, _this.onlineOffline) || other.onlineOffline == _this.onlineOffline)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as User;
  return Object.hash(runtimeType,_this.id,_this.avatar,_this.name,_this.email,_this.phone,_this.onlineOffline,_this.status,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as User;
  return 'User(id: ${_this.id}, avatar: ${_this.avatar}, name: ${_this.name}, email: ${_this.email}, phone: ${_this.phone}, onlineOffline: ${_this.onlineOffline}, status: ${_this.status}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id", defaultValue: -1) int? id,@JsonKey(name: "avatar", defaultValue: "") String? avatar,@JsonKey(name: "name", defaultValue: "") String? name,@JsonKey(name: "email") String? email,@JsonKey(name: "phone", defaultValue: "") String? phone,@JsonKey(name: "online_offline", defaultValue: "") String? onlineOffline,@JsonKey(name: "status", defaultValue: false) bool? status,@JsonKey(name: "created_at") DateTime? createdAt,@JsonKey(name: "updated_at") DateTime? updatedAt
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? avatar = freezed,Object? name = freezed,Object? email = freezed,Object? phone = freezed,Object? onlineOffline = freezed,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(User(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,onlineOffline: freezed == onlineOffline ? _self.onlineOffline : onlineOffline // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id", defaultValue: -1)  int? id, @JsonKey(name: "avatar", defaultValue: "")  String? avatar, @JsonKey(name: "name", defaultValue: "")  String? name, @JsonKey(name: "email")  String? email, @JsonKey(name: "phone", defaultValue: "")  String? phone, @JsonKey(name: "online_offline", defaultValue: "")  String? onlineOffline, @JsonKey(name: "status", defaultValue: false)  bool? status, @JsonKey(name: "created_at")  DateTime? createdAt, @JsonKey(name: "updated_at")  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.avatar,_that.name,_that.email,_that.phone,_that.onlineOffline,_that.status,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id", defaultValue: -1)  int? id, @JsonKey(name: "avatar", defaultValue: "")  String? avatar, @JsonKey(name: "name", defaultValue: "")  String? name, @JsonKey(name: "email")  String? email, @JsonKey(name: "phone", defaultValue: "")  String? phone, @JsonKey(name: "online_offline", defaultValue: "")  String? onlineOffline, @JsonKey(name: "status", defaultValue: false)  bool? status, @JsonKey(name: "created_at")  DateTime? createdAt, @JsonKey(name: "updated_at")  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.id,_that.avatar,_that.name,_that.email,_that.phone,_that.onlineOffline,_that.status,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id", defaultValue: -1)  int? id, @JsonKey(name: "avatar", defaultValue: "")  String? avatar, @JsonKey(name: "name", defaultValue: "")  String? name, @JsonKey(name: "email")  String? email, @JsonKey(name: "phone", defaultValue: "")  String? phone, @JsonKey(name: "online_offline", defaultValue: "")  String? onlineOffline, @JsonKey(name: "status", defaultValue: false)  bool? status, @JsonKey(name: "created_at")  DateTime? createdAt, @JsonKey(name: "updated_at")  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.avatar,_that.name,_that.email,_that.phone,_that.onlineOffline,_that.status,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModel implements User {
  const _UserModel({@JsonKey(name: "id", defaultValue: -1) this.id, @JsonKey(name: "avatar", defaultValue: "") this.avatar, @JsonKey(name: "name", defaultValue: "") this.name, @JsonKey(name: "email") this.email, @JsonKey(name: "phone", defaultValue: "") this.phone, @JsonKey(name: "online_offline", defaultValue: "") this.onlineOffline, @JsonKey(name: "status", defaultValue: false) this.status, @JsonKey(name: "created_at") this.createdAt, @JsonKey(name: "updated_at") this.updatedAt});
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override@JsonKey(name: "id", defaultValue: -1) final  int? id;
@override@JsonKey(name: "avatar", defaultValue: "") final  String? avatar;
@override@JsonKey(name: "name", defaultValue: "") final  String? name;
@override@JsonKey(name: "email") final  String? email;
@override@JsonKey(name: "phone", defaultValue: "") final  String? phone;
@override@JsonKey(name: "online_offline", defaultValue: "") final  String? onlineOffline;
@override@JsonKey(name: "status", defaultValue: false) final  bool? status;
@override@JsonKey(name: "created_at") final  DateTime? createdAt;
@override@JsonKey(name: "updated_at") final  DateTime? updatedAt;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.onlineOffline, onlineOffline) || other.onlineOffline == onlineOffline)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,avatar,name,email,phone,onlineOffline,status,createdAt,updatedAt);
}

@override
String toString() {
    return 'User(id: $id, avatar: $avatar, name: $name, email: $email, phone: $phone, onlineOffline: $onlineOffline, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id", defaultValue: -1) int? id,@JsonKey(name: "avatar", defaultValue: "") String? avatar,@JsonKey(name: "name", defaultValue: "") String? name,@JsonKey(name: "email") String? email,@JsonKey(name: "phone", defaultValue: "") String? phone,@JsonKey(name: "online_offline", defaultValue: "") String? onlineOffline,@JsonKey(name: "status", defaultValue: false) bool? status,@JsonKey(name: "created_at") DateTime? createdAt,@JsonKey(name: "updated_at") DateTime? updatedAt
});




}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? avatar = freezed,Object? name = freezed,Object? email = freezed,Object? phone = freezed,Object? onlineOffline = freezed,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_UserModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,onlineOffline: freezed == onlineOffline ? _self.onlineOffline : onlineOffline // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
