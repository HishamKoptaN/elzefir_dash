// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_visits_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DailyVisitsEntity {

 String get day; int get visits;
/// Create a copy of DailyVisitsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyVisitsEntityCopyWith<DailyVisitsEntity> get copyWith => _$DailyVisitsEntityCopyWithImpl<DailyVisitsEntity>(this as DailyVisitsEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DailyVisitsEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyVisitsEntity&&(identical(other.day, _this.day) || other.day == _this.day)&&(identical(other.visits, _this.visits) || other.visits == _this.visits));
}


@override
int get hashCode {
  final _this = this as DailyVisitsEntity;
  return Object.hash(runtimeType,_this.day,_this.visits);
}

@override
String toString() {
  final _this = this as DailyVisitsEntity;
  return 'DailyVisitsEntity(day: ${_this.day}, visits: ${_this.visits})';
}


}

/// @nodoc
abstract mixin class $DailyVisitsEntityCopyWith<$Res>  {
  factory $DailyVisitsEntityCopyWith(DailyVisitsEntity value, $Res Function(DailyVisitsEntity) _then) = _$DailyVisitsEntityCopyWithImpl;
@useResult
$Res call({
 String day, int visits
});




}
/// @nodoc
class _$DailyVisitsEntityCopyWithImpl<$Res>
    implements $DailyVisitsEntityCopyWith<$Res> {
  _$DailyVisitsEntityCopyWithImpl(this._self, this._then);

  final DailyVisitsEntity _self;
  final $Res Function(DailyVisitsEntity) _then;

/// Create a copy of DailyVisitsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? day = null,Object? visits = null,}) {
  return _then(DailyVisitsEntity(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,visits: null == visits ? _self.visits : visits // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyVisitsEntity].
extension DailyVisitsEntityPatterns on DailyVisitsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyVisitsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyVisitsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyVisitsEntity value)  $default,){
final _that = this;
switch (_that) {
case _DailyVisitsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyVisitsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DailyVisitsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String day,  int visits)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyVisitsEntity() when $default != null:
return $default(_that.day,_that.visits);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String day,  int visits)  $default,) {final _that = this;
switch (_that) {
case _DailyVisitsEntity():
return $default(_that.day,_that.visits);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String day,  int visits)?  $default,) {final _that = this;
switch (_that) {
case _DailyVisitsEntity() when $default != null:
return $default(_that.day,_that.visits);case _:
  return null;

}
}

}

/// @nodoc


class _DailyVisitsEntity implements DailyVisitsEntity {
  const _DailyVisitsEntity({required this.day, required this.visits});
  

@override final  String day;
@override final  int visits;

/// Create a copy of DailyVisitsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyVisitsEntityCopyWith<_DailyVisitsEntity> get copyWith => __$DailyVisitsEntityCopyWithImpl<_DailyVisitsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyVisitsEntity&&(identical(other.day, day) || other.day == day)&&(identical(other.visits, visits) || other.visits == visits));
}


@override
int get hashCode {
    return Object.hash(runtimeType,day,visits);
}

@override
String toString() {
    return 'DailyVisitsEntity(day: $day, visits: $visits)';
}


}

/// @nodoc
abstract mixin class _$DailyVisitsEntityCopyWith<$Res> implements $DailyVisitsEntityCopyWith<$Res> {
  factory _$DailyVisitsEntityCopyWith(_DailyVisitsEntity value, $Res Function(_DailyVisitsEntity) _then) = __$DailyVisitsEntityCopyWithImpl;
@override @useResult
$Res call({
 String day, int visits
});




}
/// @nodoc
class __$DailyVisitsEntityCopyWithImpl<$Res>
    implements _$DailyVisitsEntityCopyWith<$Res> {
  __$DailyVisitsEntityCopyWithImpl(this._self, this._then);

  final _DailyVisitsEntity _self;
  final $Res Function(_DailyVisitsEntity) _then;

/// Create a copy of DailyVisitsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? day = null,Object? visits = null,}) {
  return _then(_DailyVisitsEntity(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,visits: null == visits ? _self.visits : visits // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
