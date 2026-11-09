// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_pass_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResetPassEntity {

 PasswordFormInput? get oldPassword; PasswordFormInput? get newPassword; PasswordFormInput? get confirmPassword; bool get obscurePassword;
/// Create a copy of ResetPassEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPassEntityCopyWith<ResetPassEntity> get copyWith => _$ResetPassEntityCopyWithImpl<ResetPassEntity>(this as ResetPassEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ResetPassEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPassEntity&&(identical(other.oldPassword, _this.oldPassword) || other.oldPassword == _this.oldPassword)&&(identical(other.newPassword, _this.newPassword) || other.newPassword == _this.newPassword)&&(identical(other.confirmPassword, _this.confirmPassword) || other.confirmPassword == _this.confirmPassword)&&(identical(other.obscurePassword, _this.obscurePassword) || other.obscurePassword == _this.obscurePassword));
}


@override
int get hashCode {
  final _this = this as ResetPassEntity;
  return Object.hash(runtimeType,_this.oldPassword,_this.newPassword,_this.confirmPassword,_this.obscurePassword);
}

@override
String toString() {
  final _this = this as ResetPassEntity;
  return 'ResetPassEntity(oldPassword: ${_this.oldPassword}, newPassword: ${_this.newPassword}, confirmPassword: ${_this.confirmPassword}, obscurePassword: ${_this.obscurePassword})';
}


}

/// @nodoc
abstract mixin class $ResetPassEntityCopyWith<$Res>  {
  factory $ResetPassEntityCopyWith(ResetPassEntity value, $Res Function(ResetPassEntity) _then) = _$ResetPassEntityCopyWithImpl;
@useResult
$Res call({
 PasswordFormInput? oldPassword, PasswordFormInput? newPassword, PasswordFormInput? confirmPassword, bool obscurePassword
});




}
/// @nodoc
class _$ResetPassEntityCopyWithImpl<$Res>
    implements $ResetPassEntityCopyWith<$Res> {
  _$ResetPassEntityCopyWithImpl(this._self, this._then);

  final ResetPassEntity _self;
  final $Res Function(ResetPassEntity) _then;

/// Create a copy of ResetPassEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? oldPassword = freezed,Object? newPassword = freezed,Object? confirmPassword = freezed,Object? obscurePassword = null,}) {
  return _then(ResetPassEntity(
oldPassword: freezed == oldPassword ? _self.oldPassword : oldPassword // ignore: cast_nullable_to_non_nullable
as PasswordFormInput?,newPassword: freezed == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as PasswordFormInput?,confirmPassword: freezed == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as PasswordFormInput?,obscurePassword: null == obscurePassword ? _self.obscurePassword : obscurePassword // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ResetPassEntity].
extension ResetPassEntityPatterns on ResetPassEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResetPassEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResetPassEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResetPassEntity value)  $default,){
final _that = this;
switch (_that) {
case _ResetPassEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResetPassEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ResetPassEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PasswordFormInput? oldPassword,  PasswordFormInput? newPassword,  PasswordFormInput? confirmPassword,  bool obscurePassword)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResetPassEntity() when $default != null:
return $default(_that.oldPassword,_that.newPassword,_that.confirmPassword,_that.obscurePassword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PasswordFormInput? oldPassword,  PasswordFormInput? newPassword,  PasswordFormInput? confirmPassword,  bool obscurePassword)  $default,) {final _that = this;
switch (_that) {
case _ResetPassEntity():
return $default(_that.oldPassword,_that.newPassword,_that.confirmPassword,_that.obscurePassword);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PasswordFormInput? oldPassword,  PasswordFormInput? newPassword,  PasswordFormInput? confirmPassword,  bool obscurePassword)?  $default,) {final _that = this;
switch (_that) {
case _ResetPassEntity() when $default != null:
return $default(_that.oldPassword,_that.newPassword,_that.confirmPassword,_that.obscurePassword);case _:
  return null;

}
}

}

/// @nodoc


class _ResetPassEntity implements ResetPassEntity {
  const _ResetPassEntity({this.oldPassword, this.newPassword, this.confirmPassword, this.obscurePassword = true});
  

@override final  PasswordFormInput? oldPassword;
@override final  PasswordFormInput? newPassword;
@override final  PasswordFormInput? confirmPassword;
@override@JsonKey() final  bool obscurePassword;

/// Create a copy of ResetPassEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetPassEntityCopyWith<_ResetPassEntity> get copyWith => __$ResetPassEntityCopyWithImpl<_ResetPassEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetPassEntity&&(identical(other.oldPassword, oldPassword) || other.oldPassword == oldPassword)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.obscurePassword, obscurePassword) || other.obscurePassword == obscurePassword));
}


@override
int get hashCode {
    return Object.hash(runtimeType,oldPassword,newPassword,confirmPassword,obscurePassword);
}

@override
String toString() {
    return 'ResetPassEntity(oldPassword: $oldPassword, newPassword: $newPassword, confirmPassword: $confirmPassword, obscurePassword: $obscurePassword)';
}


}

/// @nodoc
abstract mixin class _$ResetPassEntityCopyWith<$Res> implements $ResetPassEntityCopyWith<$Res> {
  factory _$ResetPassEntityCopyWith(_ResetPassEntity value, $Res Function(_ResetPassEntity) _then) = __$ResetPassEntityCopyWithImpl;
@override @useResult
$Res call({
 PasswordFormInput? oldPassword, PasswordFormInput? newPassword, PasswordFormInput? confirmPassword, bool obscurePassword
});




}
/// @nodoc
class __$ResetPassEntityCopyWithImpl<$Res>
    implements _$ResetPassEntityCopyWith<$Res> {
  __$ResetPassEntityCopyWithImpl(this._self, this._then);

  final _ResetPassEntity _self;
  final $Res Function(_ResetPassEntity) _then;

/// Create a copy of ResetPassEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? oldPassword = freezed,Object? newPassword = freezed,Object? confirmPassword = freezed,Object? obscurePassword = null,}) {
  return _then(_ResetPassEntity(
oldPassword: freezed == oldPassword ? _self.oldPassword : oldPassword // ignore: cast_nullable_to_non_nullable
as PasswordFormInput?,newPassword: freezed == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as PasswordFormInput?,confirmPassword: freezed == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as PasswordFormInput?,obscurePassword: null == obscurePassword ? _self.obscurePassword : obscurePassword // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
