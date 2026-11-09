// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEntity {

 int? get id; String? get avatar; GenericFormInput? get name; UsernameFormInput? get username; GenericFormInput? get phoneNumber; GenericFormInput? get dialCode; GenericFormInput? get isoCode; String? get email; bool? get isValidNumber; String? get createdAt;@JsonKey(includeFromJson: false, includeToJson: false) File? get selectedImage;
/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileEntityCopyWith<ProfileEntity> get copyWith => _$ProfileEntityCopyWithImpl<ProfileEntity>(this as ProfileEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProfileEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.avatar, _this.avatar) || other.avatar == _this.avatar)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.username, _this.username) || other.username == _this.username)&&(identical(other.phoneNumber, _this.phoneNumber) || other.phoneNumber == _this.phoneNumber)&&(identical(other.dialCode, _this.dialCode) || other.dialCode == _this.dialCode)&&(identical(other.isoCode, _this.isoCode) || other.isoCode == _this.isoCode)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.isValidNumber, _this.isValidNumber) || other.isValidNumber == _this.isValidNumber)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.selectedImage, _this.selectedImage) || other.selectedImage == _this.selectedImage));
}


@override
int get hashCode {
  final _this = this as ProfileEntity;
  return Object.hash(runtimeType,_this.id,_this.avatar,_this.name,_this.username,_this.phoneNumber,_this.dialCode,_this.isoCode,_this.email,_this.isValidNumber,_this.createdAt,_this.selectedImage);
}

@override
String toString() {
  final _this = this as ProfileEntity;
  return 'ProfileEntity(id: ${_this.id}, avatar: ${_this.avatar}, name: ${_this.name}, username: ${_this.username}, phoneNumber: ${_this.phoneNumber}, dialCode: ${_this.dialCode}, isoCode: ${_this.isoCode}, email: ${_this.email}, isValidNumber: ${_this.isValidNumber}, createdAt: ${_this.createdAt}, selectedImage: ${_this.selectedImage})';
}


}

/// @nodoc
abstract mixin class $ProfileEntityCopyWith<$Res>  {
  factory $ProfileEntityCopyWith(ProfileEntity value, $Res Function(ProfileEntity) _then) = _$ProfileEntityCopyWithImpl;
@useResult
$Res call({
 int? id, String? avatar, GenericFormInput? name, UsernameFormInput? username, GenericFormInput? phoneNumber, GenericFormInput? dialCode, GenericFormInput? isoCode, String? email, bool? isValidNumber, String? createdAt,@JsonKey(includeFromJson: false, includeToJson: false) File? selectedImage
});




}
/// @nodoc
class _$ProfileEntityCopyWithImpl<$Res>
    implements $ProfileEntityCopyWith<$Res> {
  _$ProfileEntityCopyWithImpl(this._self, this._then);

  final ProfileEntity _self;
  final $Res Function(ProfileEntity) _then;

/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? avatar = freezed,Object? name = freezed,Object? username = freezed,Object? phoneNumber = freezed,Object? dialCode = freezed,Object? isoCode = freezed,Object? email = freezed,Object? isValidNumber = freezed,Object? createdAt = freezed,Object? selectedImage = freezed,}) {
  return _then(ProfileEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as UsernameFormInput?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,dialCode: freezed == dialCode ? _self.dialCode : dialCode // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,isoCode: freezed == isoCode ? _self.isoCode : isoCode // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,isValidNumber: freezed == isValidNumber ? _self.isValidNumber : isValidNumber // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,selectedImage: freezed == selectedImage ? _self.selectedImage : selectedImage // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileEntity].
extension ProfileEntityPatterns on ProfileEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProfileEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? avatar,  GenericFormInput? name,  UsernameFormInput? username,  GenericFormInput? phoneNumber,  GenericFormInput? dialCode,  GenericFormInput? isoCode,  String? email,  bool? isValidNumber,  String? createdAt, @JsonKey(includeFromJson: false, includeToJson: false)  File? selectedImage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileEntity() when $default != null:
return $default(_that.id,_that.avatar,_that.name,_that.username,_that.phoneNumber,_that.dialCode,_that.isoCode,_that.email,_that.isValidNumber,_that.createdAt,_that.selectedImage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? avatar,  GenericFormInput? name,  UsernameFormInput? username,  GenericFormInput? phoneNumber,  GenericFormInput? dialCode,  GenericFormInput? isoCode,  String? email,  bool? isValidNumber,  String? createdAt, @JsonKey(includeFromJson: false, includeToJson: false)  File? selectedImage)  $default,) {final _that = this;
switch (_that) {
case _ProfileEntity():
return $default(_that.id,_that.avatar,_that.name,_that.username,_that.phoneNumber,_that.dialCode,_that.isoCode,_that.email,_that.isValidNumber,_that.createdAt,_that.selectedImage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? avatar,  GenericFormInput? name,  UsernameFormInput? username,  GenericFormInput? phoneNumber,  GenericFormInput? dialCode,  GenericFormInput? isoCode,  String? email,  bool? isValidNumber,  String? createdAt, @JsonKey(includeFromJson: false, includeToJson: false)  File? selectedImage)?  $default,) {final _that = this;
switch (_that) {
case _ProfileEntity() when $default != null:
return $default(_that.id,_that.avatar,_that.name,_that.username,_that.phoneNumber,_that.dialCode,_that.isoCode,_that.email,_that.isValidNumber,_that.createdAt,_that.selectedImage);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileEntity extends ProfileEntity {
  const _ProfileEntity({this.id, this.avatar, this.name, this.username, this.phoneNumber, this.dialCode, this.isoCode, this.email, this.isValidNumber, this.createdAt, @JsonKey(includeFromJson: false, includeToJson: false) this.selectedImage}): super._();
  

@override final  int? id;
@override final  String? avatar;
@override final  GenericFormInput? name;
@override final  UsernameFormInput? username;
@override final  GenericFormInput? phoneNumber;
@override final  GenericFormInput? dialCode;
@override final  GenericFormInput? isoCode;
@override final  String? email;
@override final  bool? isValidNumber;
@override final  String? createdAt;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  File? selectedImage;

/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileEntityCopyWith<_ProfileEntity> get copyWith => __$ProfileEntityCopyWithImpl<_ProfileEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.dialCode, dialCode) || other.dialCode == dialCode)&&(identical(other.isoCode, isoCode) || other.isoCode == isoCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.isValidNumber, isValidNumber) || other.isValidNumber == isValidNumber)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.selectedImage, selectedImage) || other.selectedImage == selectedImage));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,avatar,name,username,phoneNumber,dialCode,isoCode,email,isValidNumber,createdAt,selectedImage);
}

@override
String toString() {
    return 'ProfileEntity(id: $id, avatar: $avatar, name: $name, username: $username, phoneNumber: $phoneNumber, dialCode: $dialCode, isoCode: $isoCode, email: $email, isValidNumber: $isValidNumber, createdAt: $createdAt, selectedImage: $selectedImage)';
}


}

/// @nodoc
abstract mixin class _$ProfileEntityCopyWith<$Res> implements $ProfileEntityCopyWith<$Res> {
  factory _$ProfileEntityCopyWith(_ProfileEntity value, $Res Function(_ProfileEntity) _then) = __$ProfileEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? avatar, GenericFormInput? name, UsernameFormInput? username, GenericFormInput? phoneNumber, GenericFormInput? dialCode, GenericFormInput? isoCode, String? email, bool? isValidNumber, String? createdAt,@JsonKey(includeFromJson: false, includeToJson: false) File? selectedImage
});




}
/// @nodoc
class __$ProfileEntityCopyWithImpl<$Res>
    implements _$ProfileEntityCopyWith<$Res> {
  __$ProfileEntityCopyWithImpl(this._self, this._then);

  final _ProfileEntity _self;
  final $Res Function(_ProfileEntity) _then;

/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? avatar = freezed,Object? name = freezed,Object? username = freezed,Object? phoneNumber = freezed,Object? dialCode = freezed,Object? isoCode = freezed,Object? email = freezed,Object? isValidNumber = freezed,Object? createdAt = freezed,Object? selectedImage = freezed,}) {
  return _then(_ProfileEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as UsernameFormInput?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,dialCode: freezed == dialCode ? _self.dialCode : dialCode // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,isoCode: freezed == isoCode ? _self.isoCode : isoCode // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,isValidNumber: freezed == isValidNumber ? _self.isValidNumber : isValidNumber // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,selectedImage: freezed == selectedImage ? _self.selectedImage : selectedImage // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}


}

// dart format on
