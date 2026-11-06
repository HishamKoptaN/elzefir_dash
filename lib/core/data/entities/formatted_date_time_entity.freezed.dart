// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'formatted_date_time_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FormattedDateTimeEntity {

 String? get formattedDate; String? get formattedTime; String? get relativeTime; String? get fullDateTime; DateTime? get dateTime;
/// Create a copy of FormattedDateTimeEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormattedDateTimeEntityCopyWith<FormattedDateTimeEntity> get copyWith => _$FormattedDateTimeEntityCopyWithImpl<FormattedDateTimeEntity>(this as FormattedDateTimeEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormattedDateTimeEntity&&(identical(other.formattedDate, formattedDate) || other.formattedDate == formattedDate)&&(identical(other.formattedTime, formattedTime) || other.formattedTime == formattedTime)&&(identical(other.relativeTime, relativeTime) || other.relativeTime == relativeTime)&&(identical(other.fullDateTime, fullDateTime) || other.fullDateTime == fullDateTime)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime));
}


@override
int get hashCode => Object.hash(runtimeType,formattedDate,formattedTime,relativeTime,fullDateTime,dateTime);

@override
String toString() {
  return 'FormattedDateTimeEntity(formattedDate: $formattedDate, formattedTime: $formattedTime, relativeTime: $relativeTime, fullDateTime: $fullDateTime, dateTime: $dateTime)';
}


}

/// @nodoc
abstract mixin class $FormattedDateTimeEntityCopyWith<$Res>  {
  factory $FormattedDateTimeEntityCopyWith(FormattedDateTimeEntity value, $Res Function(FormattedDateTimeEntity) _then) = _$FormattedDateTimeEntityCopyWithImpl;
@useResult
$Res call({
 String? formattedDate, String? formattedTime, String? relativeTime, String? fullDateTime, DateTime? dateTime
});




}
/// @nodoc
class _$FormattedDateTimeEntityCopyWithImpl<$Res>
    implements $FormattedDateTimeEntityCopyWith<$Res> {
  _$FormattedDateTimeEntityCopyWithImpl(this._self, this._then);

  final FormattedDateTimeEntity _self;
  final $Res Function(FormattedDateTimeEntity) _then;

/// Create a copy of FormattedDateTimeEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? formattedDate = freezed,Object? formattedTime = freezed,Object? relativeTime = freezed,Object? fullDateTime = freezed,Object? dateTime = freezed,}) {
  return _then(_self.copyWith(
formattedDate: freezed == formattedDate ? _self.formattedDate : formattedDate // ignore: cast_nullable_to_non_nullable
as String?,formattedTime: freezed == formattedTime ? _self.formattedTime : formattedTime // ignore: cast_nullable_to_non_nullable
as String?,relativeTime: freezed == relativeTime ? _self.relativeTime : relativeTime // ignore: cast_nullable_to_non_nullable
as String?,fullDateTime: freezed == fullDateTime ? _self.fullDateTime : fullDateTime // ignore: cast_nullable_to_non_nullable
as String?,dateTime: freezed == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [FormattedDateTimeEntity].
extension FormattedDateTimeEntityPatterns on FormattedDateTimeEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FormattedDateTimeEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FormattedDateTimeEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FormattedDateTimeEntity value)  $default,){
final _that = this;
switch (_that) {
case _FormattedDateTimeEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FormattedDateTimeEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FormattedDateTimeEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? formattedDate,  String? formattedTime,  String? relativeTime,  String? fullDateTime,  DateTime? dateTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FormattedDateTimeEntity() when $default != null:
return $default(_that.formattedDate,_that.formattedTime,_that.relativeTime,_that.fullDateTime,_that.dateTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? formattedDate,  String? formattedTime,  String? relativeTime,  String? fullDateTime,  DateTime? dateTime)  $default,) {final _that = this;
switch (_that) {
case _FormattedDateTimeEntity():
return $default(_that.formattedDate,_that.formattedTime,_that.relativeTime,_that.fullDateTime,_that.dateTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? formattedDate,  String? formattedTime,  String? relativeTime,  String? fullDateTime,  DateTime? dateTime)?  $default,) {final _that = this;
switch (_that) {
case _FormattedDateTimeEntity() when $default != null:
return $default(_that.formattedDate,_that.formattedTime,_that.relativeTime,_that.fullDateTime,_that.dateTime);case _:
  return null;

}
}

}

/// @nodoc


class _FormattedDateTimeEntity implements FormattedDateTimeEntity {
  const _FormattedDateTimeEntity({this.formattedDate, this.formattedTime, this.relativeTime, this.fullDateTime, this.dateTime});
  

@override final  String? formattedDate;
@override final  String? formattedTime;
@override final  String? relativeTime;
@override final  String? fullDateTime;
@override final  DateTime? dateTime;

/// Create a copy of FormattedDateTimeEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormattedDateTimeEntityCopyWith<_FormattedDateTimeEntity> get copyWith => __$FormattedDateTimeEntityCopyWithImpl<_FormattedDateTimeEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormattedDateTimeEntity&&(identical(other.formattedDate, formattedDate) || other.formattedDate == formattedDate)&&(identical(other.formattedTime, formattedTime) || other.formattedTime == formattedTime)&&(identical(other.relativeTime, relativeTime) || other.relativeTime == relativeTime)&&(identical(other.fullDateTime, fullDateTime) || other.fullDateTime == fullDateTime)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime));
}


@override
int get hashCode => Object.hash(runtimeType,formattedDate,formattedTime,relativeTime,fullDateTime,dateTime);

@override
String toString() {
  return 'FormattedDateTimeEntity(formattedDate: $formattedDate, formattedTime: $formattedTime, relativeTime: $relativeTime, fullDateTime: $fullDateTime, dateTime: $dateTime)';
}


}

/// @nodoc
abstract mixin class _$FormattedDateTimeEntityCopyWith<$Res> implements $FormattedDateTimeEntityCopyWith<$Res> {
  factory _$FormattedDateTimeEntityCopyWith(_FormattedDateTimeEntity value, $Res Function(_FormattedDateTimeEntity) _then) = __$FormattedDateTimeEntityCopyWithImpl;
@override @useResult
$Res call({
 String? formattedDate, String? formattedTime, String? relativeTime, String? fullDateTime, DateTime? dateTime
});




}
/// @nodoc
class __$FormattedDateTimeEntityCopyWithImpl<$Res>
    implements _$FormattedDateTimeEntityCopyWith<$Res> {
  __$FormattedDateTimeEntityCopyWithImpl(this._self, this._then);

  final _FormattedDateTimeEntity _self;
  final $Res Function(_FormattedDateTimeEntity) _then;

/// Create a copy of FormattedDateTimeEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? formattedDate = freezed,Object? formattedTime = freezed,Object? relativeTime = freezed,Object? fullDateTime = freezed,Object? dateTime = freezed,}) {
  return _then(_FormattedDateTimeEntity(
formattedDate: freezed == formattedDate ? _self.formattedDate : formattedDate // ignore: cast_nullable_to_non_nullable
as String?,formattedTime: freezed == formattedTime ? _self.formattedTime : formattedTime // ignore: cast_nullable_to_non_nullable
as String?,relativeTime: freezed == relativeTime ? _self.relativeTime : relativeTime // ignore: cast_nullable_to_non_nullable
as String?,fullDateTime: freezed == fullDateTime ? _self.fullDateTime : fullDateTime // ignore: cast_nullable_to_non_nullable
as String?,dateTime: freezed == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
