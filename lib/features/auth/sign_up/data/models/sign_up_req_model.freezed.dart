// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_req_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignUpReqModel {

 String get name; String get username;@JsonKey(name: 'phone_number') String? get phoneNumber;@JsonKey(name: 'dial_code') String? get dialCode;@JsonKey(name: 'iso_code') String? get isoCode;@JsonKey(name: 'id_token') String get idToken;@JsonKey(name: 'fcm_token') String? get fcmToken; DeviceModel? get device;
/// Create a copy of SignUpReqModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpReqModelCopyWith<SignUpReqModel> get copyWith => _$SignUpReqModelCopyWithImpl<SignUpReqModel>(this as SignUpReqModel, _$identity);

  /// Serializes this SignUpReqModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpReqModel&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.dialCode, dialCode) || other.dialCode == dialCode)&&(identical(other.isoCode, isoCode) || other.isoCode == isoCode)&&(identical(other.idToken, idToken) || other.idToken == idToken)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.device, device) || other.device == device));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,username,phoneNumber,dialCode,isoCode,idToken,fcmToken,device);

@override
String toString() {
  return 'SignUpReqModel(name: $name, username: $username, phoneNumber: $phoneNumber, dialCode: $dialCode, isoCode: $isoCode, idToken: $idToken, fcmToken: $fcmToken, device: $device)';
}


}

/// @nodoc
abstract mixin class $SignUpReqModelCopyWith<$Res>  {
  factory $SignUpReqModelCopyWith(SignUpReqModel value, $Res Function(SignUpReqModel) _then) = _$SignUpReqModelCopyWithImpl;
@useResult
$Res call({
 String name, String username,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'dial_code') String? dialCode,@JsonKey(name: 'iso_code') String? isoCode,@JsonKey(name: 'id_token') String idToken,@JsonKey(name: 'fcm_token') String? fcmToken, DeviceModel? device
});


$DeviceModelCopyWith<$Res>? get device;

}
/// @nodoc
class _$SignUpReqModelCopyWithImpl<$Res>
    implements $SignUpReqModelCopyWith<$Res> {
  _$SignUpReqModelCopyWithImpl(this._self, this._then);

  final SignUpReqModel _self;
  final $Res Function(SignUpReqModel) _then;

/// Create a copy of SignUpReqModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? username = null,Object? phoneNumber = freezed,Object? dialCode = freezed,Object? isoCode = freezed,Object? idToken = null,Object? fcmToken = freezed,Object? device = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,dialCode: freezed == dialCode ? _self.dialCode : dialCode // ignore: cast_nullable_to_non_nullable
as String?,isoCode: freezed == isoCode ? _self.isoCode : isoCode // ignore: cast_nullable_to_non_nullable
as String?,idToken: null == idToken ? _self.idToken : idToken // ignore: cast_nullable_to_non_nullable
as String,fcmToken: freezed == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String?,device: freezed == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as DeviceModel?,
  ));
}
/// Create a copy of SignUpReqModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceModelCopyWith<$Res>? get device {
    if (_self.device == null) {
    return null;
  }

  return $DeviceModelCopyWith<$Res>(_self.device!, (value) {
    return _then(_self.copyWith(device: value));
  });
}
}


/// Adds pattern-matching-related methods to [SignUpReqModel].
extension SignUpReqModelPatterns on SignUpReqModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignUpReqModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignUpReqModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignUpReqModel value)  $default,){
final _that = this;
switch (_that) {
case _SignUpReqModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignUpReqModel value)?  $default,){
final _that = this;
switch (_that) {
case _SignUpReqModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String username, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'dial_code')  String? dialCode, @JsonKey(name: 'iso_code')  String? isoCode, @JsonKey(name: 'id_token')  String idToken, @JsonKey(name: 'fcm_token')  String? fcmToken,  DeviceModel? device)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignUpReqModel() when $default != null:
return $default(_that.name,_that.username,_that.phoneNumber,_that.dialCode,_that.isoCode,_that.idToken,_that.fcmToken,_that.device);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String username, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'dial_code')  String? dialCode, @JsonKey(name: 'iso_code')  String? isoCode, @JsonKey(name: 'id_token')  String idToken, @JsonKey(name: 'fcm_token')  String? fcmToken,  DeviceModel? device)  $default,) {final _that = this;
switch (_that) {
case _SignUpReqModel():
return $default(_that.name,_that.username,_that.phoneNumber,_that.dialCode,_that.isoCode,_that.idToken,_that.fcmToken,_that.device);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String username, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'dial_code')  String? dialCode, @JsonKey(name: 'iso_code')  String? isoCode, @JsonKey(name: 'id_token')  String idToken, @JsonKey(name: 'fcm_token')  String? fcmToken,  DeviceModel? device)?  $default,) {final _that = this;
switch (_that) {
case _SignUpReqModel() when $default != null:
return $default(_that.name,_that.username,_that.phoneNumber,_that.dialCode,_that.isoCode,_that.idToken,_that.fcmToken,_that.device);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SignUpReqModel implements SignUpReqModel {
  const _SignUpReqModel({required this.name, required this.username, @JsonKey(name: 'phone_number') this.phoneNumber, @JsonKey(name: 'dial_code') this.dialCode, @JsonKey(name: 'iso_code') this.isoCode, @JsonKey(name: 'id_token') required this.idToken, @JsonKey(name: 'fcm_token') this.fcmToken, this.device});
  factory _SignUpReqModel.fromJson(Map<String, dynamic> json) => _$SignUpReqModelFromJson(json);

@override final  String name;
@override final  String username;
@override@JsonKey(name: 'phone_number') final  String? phoneNumber;
@override@JsonKey(name: 'dial_code') final  String? dialCode;
@override@JsonKey(name: 'iso_code') final  String? isoCode;
@override@JsonKey(name: 'id_token') final  String idToken;
@override@JsonKey(name: 'fcm_token') final  String? fcmToken;
@override final  DeviceModel? device;

/// Create a copy of SignUpReqModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignUpReqModelCopyWith<_SignUpReqModel> get copyWith => __$SignUpReqModelCopyWithImpl<_SignUpReqModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignUpReqModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignUpReqModel&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.dialCode, dialCode) || other.dialCode == dialCode)&&(identical(other.isoCode, isoCode) || other.isoCode == isoCode)&&(identical(other.idToken, idToken) || other.idToken == idToken)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.device, device) || other.device == device));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,username,phoneNumber,dialCode,isoCode,idToken,fcmToken,device);

@override
String toString() {
  return 'SignUpReqModel(name: $name, username: $username, phoneNumber: $phoneNumber, dialCode: $dialCode, isoCode: $isoCode, idToken: $idToken, fcmToken: $fcmToken, device: $device)';
}


}

/// @nodoc
abstract mixin class _$SignUpReqModelCopyWith<$Res> implements $SignUpReqModelCopyWith<$Res> {
  factory _$SignUpReqModelCopyWith(_SignUpReqModel value, $Res Function(_SignUpReqModel) _then) = __$SignUpReqModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String username,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'dial_code') String? dialCode,@JsonKey(name: 'iso_code') String? isoCode,@JsonKey(name: 'id_token') String idToken,@JsonKey(name: 'fcm_token') String? fcmToken, DeviceModel? device
});


@override $DeviceModelCopyWith<$Res>? get device;

}
/// @nodoc
class __$SignUpReqModelCopyWithImpl<$Res>
    implements _$SignUpReqModelCopyWith<$Res> {
  __$SignUpReqModelCopyWithImpl(this._self, this._then);

  final _SignUpReqModel _self;
  final $Res Function(_SignUpReqModel) _then;

/// Create a copy of SignUpReqModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? username = null,Object? phoneNumber = freezed,Object? dialCode = freezed,Object? isoCode = freezed,Object? idToken = null,Object? fcmToken = freezed,Object? device = freezed,}) {
  return _then(_SignUpReqModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,dialCode: freezed == dialCode ? _self.dialCode : dialCode // ignore: cast_nullable_to_non_nullable
as String?,isoCode: freezed == isoCode ? _self.isoCode : isoCode // ignore: cast_nullable_to_non_nullable
as String?,idToken: null == idToken ? _self.idToken : idToken // ignore: cast_nullable_to_non_nullable
as String,fcmToken: freezed == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String?,device: freezed == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as DeviceModel?,
  ));
}

/// Create a copy of SignUpReqModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceModelCopyWith<$Res>? get device {
    if (_self.device == null) {
    return null;
  }

  return $DeviceModelCopyWith<$Res>(_self.device!, (value) {
    return _then(_self.copyWith(device: value));
  });
}
}

// dart format on
