// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_res_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileResModel {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'avatar') String? get avatar;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'username') String? get username;@JsonKey(name: 'phone_number') String? get phoneNumber;@JsonKey(name: 'dial_code') String? get dialCode;@JsonKey(name: 'iso_code') String? get isoCode; String? get email;@JsonKey(name: 'created_at') String? get createdAt;
/// Create a copy of ProfileResModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileResModelCopyWith<ProfileResModel> get copyWith => _$ProfileResModelCopyWithImpl<ProfileResModel>(this as ProfileResModel, _$identity);

  /// Serializes this ProfileResModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileResModel&&(identical(other.id, id) || other.id == id)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.dialCode, dialCode) || other.dialCode == dialCode)&&(identical(other.isoCode, isoCode) || other.isoCode == isoCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,avatar,name,username,phoneNumber,dialCode,isoCode,email,createdAt);

@override
String toString() {
  return 'ProfileResModel(id: $id, avatar: $avatar, name: $name, username: $username, phoneNumber: $phoneNumber, dialCode: $dialCode, isoCode: $isoCode, email: $email, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ProfileResModelCopyWith<$Res>  {
  factory $ProfileResModelCopyWith(ProfileResModel value, $Res Function(ProfileResModel) _then) = _$ProfileResModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'avatar') String? avatar,@JsonKey(name: 'name') String? name,@JsonKey(name: 'username') String? username,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'dial_code') String? dialCode,@JsonKey(name: 'iso_code') String? isoCode, String? email,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class _$ProfileResModelCopyWithImpl<$Res>
    implements $ProfileResModelCopyWith<$Res> {
  _$ProfileResModelCopyWithImpl(this._self, this._then);

  final ProfileResModel _self;
  final $Res Function(ProfileResModel) _then;

/// Create a copy of ProfileResModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? avatar = freezed,Object? name = freezed,Object? username = freezed,Object? phoneNumber = freezed,Object? dialCode = freezed,Object? isoCode = freezed,Object? email = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,dialCode: freezed == dialCode ? _self.dialCode : dialCode // ignore: cast_nullable_to_non_nullable
as String?,isoCode: freezed == isoCode ? _self.isoCode : isoCode // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileResModel].
extension ProfileResModelPatterns on ProfileResModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileResModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileResModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileResModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileResModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileResModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileResModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'avatar')  String? avatar, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'username')  String? username, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'dial_code')  String? dialCode, @JsonKey(name: 'iso_code')  String? isoCode,  String? email, @JsonKey(name: 'created_at')  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileResModel() when $default != null:
return $default(_that.id,_that.avatar,_that.name,_that.username,_that.phoneNumber,_that.dialCode,_that.isoCode,_that.email,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'avatar')  String? avatar, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'username')  String? username, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'dial_code')  String? dialCode, @JsonKey(name: 'iso_code')  String? isoCode,  String? email, @JsonKey(name: 'created_at')  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _ProfileResModel():
return $default(_that.id,_that.avatar,_that.name,_that.username,_that.phoneNumber,_that.dialCode,_that.isoCode,_that.email,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'avatar')  String? avatar, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'username')  String? username, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'dial_code')  String? dialCode, @JsonKey(name: 'iso_code')  String? isoCode,  String? email, @JsonKey(name: 'created_at')  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ProfileResModel() when $default != null:
return $default(_that.id,_that.avatar,_that.name,_that.username,_that.phoneNumber,_that.dialCode,_that.isoCode,_that.email,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileResModel implements ProfileResModel {
  const _ProfileResModel({@JsonKey(name: 'id') this.id, @JsonKey(name: 'avatar') this.avatar, @JsonKey(name: 'name') this.name, @JsonKey(name: 'username') this.username, @JsonKey(name: 'phone_number') this.phoneNumber, @JsonKey(name: 'dial_code') this.dialCode, @JsonKey(name: 'iso_code') this.isoCode, this.email, @JsonKey(name: 'created_at') this.createdAt});
  factory _ProfileResModel.fromJson(Map<String, dynamic> json) => _$ProfileResModelFromJson(json);

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'avatar') final  String? avatar;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'username') final  String? username;
@override@JsonKey(name: 'phone_number') final  String? phoneNumber;
@override@JsonKey(name: 'dial_code') final  String? dialCode;
@override@JsonKey(name: 'iso_code') final  String? isoCode;
@override final  String? email;
@override@JsonKey(name: 'created_at') final  String? createdAt;

/// Create a copy of ProfileResModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileResModelCopyWith<_ProfileResModel> get copyWith => __$ProfileResModelCopyWithImpl<_ProfileResModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileResModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileResModel&&(identical(other.id, id) || other.id == id)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.dialCode, dialCode) || other.dialCode == dialCode)&&(identical(other.isoCode, isoCode) || other.isoCode == isoCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,avatar,name,username,phoneNumber,dialCode,isoCode,email,createdAt);

@override
String toString() {
  return 'ProfileResModel(id: $id, avatar: $avatar, name: $name, username: $username, phoneNumber: $phoneNumber, dialCode: $dialCode, isoCode: $isoCode, email: $email, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ProfileResModelCopyWith<$Res> implements $ProfileResModelCopyWith<$Res> {
  factory _$ProfileResModelCopyWith(_ProfileResModel value, $Res Function(_ProfileResModel) _then) = __$ProfileResModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'avatar') String? avatar,@JsonKey(name: 'name') String? name,@JsonKey(name: 'username') String? username,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'dial_code') String? dialCode,@JsonKey(name: 'iso_code') String? isoCode, String? email,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class __$ProfileResModelCopyWithImpl<$Res>
    implements _$ProfileResModelCopyWith<$Res> {
  __$ProfileResModelCopyWithImpl(this._self, this._then);

  final _ProfileResModel _self;
  final $Res Function(_ProfileResModel) _then;

/// Create a copy of ProfileResModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? avatar = freezed,Object? name = freezed,Object? username = freezed,Object? phoneNumber = freezed,Object? dialCode = freezed,Object? isoCode = freezed,Object? email = freezed,Object? createdAt = freezed,}) {
  return _then(_ProfileResModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,dialCode: freezed == dialCode ? _self.dialCode : dialCode // ignore: cast_nullable_to_non_nullable
as String?,isoCode: freezed == isoCode ? _self.isoCode : isoCode // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
