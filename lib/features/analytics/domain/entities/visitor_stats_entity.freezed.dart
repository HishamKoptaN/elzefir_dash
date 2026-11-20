// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visitor_stats_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VisitorStatsEntity {

 int get totalVisits; int get uniqueVisitors; DateTime? get lastVisitAt; Map<String, int> get daily;
/// Create a copy of VisitorStatsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VisitorStatsEntityCopyWith<VisitorStatsEntity> get copyWith => _$VisitorStatsEntityCopyWithImpl<VisitorStatsEntity>(this as VisitorStatsEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as VisitorStatsEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VisitorStatsEntity&&(identical(other.totalVisits, _this.totalVisits) || other.totalVisits == _this.totalVisits)&&(identical(other.uniqueVisitors, _this.uniqueVisitors) || other.uniqueVisitors == _this.uniqueVisitors)&&(identical(other.lastVisitAt, _this.lastVisitAt) || other.lastVisitAt == _this.lastVisitAt)&&const DeepCollectionEquality().equals(other.daily, _this.daily));
}


@override
int get hashCode {
  final _this = this as VisitorStatsEntity;
  return Object.hash(runtimeType,_this.totalVisits,_this.uniqueVisitors,_this.lastVisitAt,const DeepCollectionEquality().hash(_this.daily));
}

@override
String toString() {
  final _this = this as VisitorStatsEntity;
  return 'VisitorStatsEntity(totalVisits: ${_this.totalVisits}, uniqueVisitors: ${_this.uniqueVisitors}, lastVisitAt: ${_this.lastVisitAt}, daily: ${_this.daily})';
}


}

/// @nodoc
abstract mixin class $VisitorStatsEntityCopyWith<$Res>  {
  factory $VisitorStatsEntityCopyWith(VisitorStatsEntity value, $Res Function(VisitorStatsEntity) _then) = _$VisitorStatsEntityCopyWithImpl;
@useResult
$Res call({
 int totalVisits, int uniqueVisitors, DateTime? lastVisitAt, Map<String, int> daily
});




}
/// @nodoc
class _$VisitorStatsEntityCopyWithImpl<$Res>
    implements $VisitorStatsEntityCopyWith<$Res> {
  _$VisitorStatsEntityCopyWithImpl(this._self, this._then);

  final VisitorStatsEntity _self;
  final $Res Function(VisitorStatsEntity) _then;

/// Create a copy of VisitorStatsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalVisits = null,Object? uniqueVisitors = null,Object? lastVisitAt = freezed,Object? daily = null,}) {
  return _then(VisitorStatsEntity(
totalVisits: null == totalVisits ? _self.totalVisits : totalVisits // ignore: cast_nullable_to_non_nullable
as int,uniqueVisitors: null == uniqueVisitors ? _self.uniqueVisitors : uniqueVisitors // ignore: cast_nullable_to_non_nullable
as int,lastVisitAt: freezed == lastVisitAt ? _self.lastVisitAt : lastVisitAt // ignore: cast_nullable_to_non_nullable
as DateTime?,daily: null == daily ? _self.daily : daily // ignore: cast_nullable_to_non_nullable
as Map<String, int>,
  ));
}

}


/// Adds pattern-matching-related methods to [VisitorStatsEntity].
extension VisitorStatsEntityPatterns on VisitorStatsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VisitorStatsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VisitorStatsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VisitorStatsEntity value)  $default,){
final _that = this;
switch (_that) {
case _VisitorStatsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VisitorStatsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _VisitorStatsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalVisits,  int uniqueVisitors,  DateTime? lastVisitAt,  Map<String, int> daily)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VisitorStatsEntity() when $default != null:
return $default(_that.totalVisits,_that.uniqueVisitors,_that.lastVisitAt,_that.daily);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalVisits,  int uniqueVisitors,  DateTime? lastVisitAt,  Map<String, int> daily)  $default,) {final _that = this;
switch (_that) {
case _VisitorStatsEntity():
return $default(_that.totalVisits,_that.uniqueVisitors,_that.lastVisitAt,_that.daily);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalVisits,  int uniqueVisitors,  DateTime? lastVisitAt,  Map<String, int> daily)?  $default,) {final _that = this;
switch (_that) {
case _VisitorStatsEntity() when $default != null:
return $default(_that.totalVisits,_that.uniqueVisitors,_that.lastVisitAt,_that.daily);case _:
  return null;

}
}

}

/// @nodoc


class _VisitorStatsEntity implements VisitorStatsEntity {
  const _VisitorStatsEntity({this.totalVisits = 0, this.uniqueVisitors = 0, this.lastVisitAt,  Map<String, int> daily = const <String, int>{}}): _daily = daily;
  

@override@JsonKey() final  int totalVisits;
@override@JsonKey() final  int uniqueVisitors;
@override final  DateTime? lastVisitAt;
 final  Map<String, int> _daily;
@override@JsonKey() Map<String, int> get daily {
  if (_daily is EqualUnmodifiableMapView) return _daily;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_daily);
}


/// Create a copy of VisitorStatsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VisitorStatsEntityCopyWith<_VisitorStatsEntity> get copyWith => __$VisitorStatsEntityCopyWithImpl<_VisitorStatsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _VisitorStatsEntity&&(identical(other.totalVisits, totalVisits) || other.totalVisits == totalVisits)&&(identical(other.uniqueVisitors, uniqueVisitors) || other.uniqueVisitors == uniqueVisitors)&&(identical(other.lastVisitAt, lastVisitAt) || other.lastVisitAt == lastVisitAt)&&const DeepCollectionEquality().equals(other.daily, _daily));
}


@override
int get hashCode {
    return Object.hash(runtimeType,totalVisits,uniqueVisitors,lastVisitAt,const DeepCollectionEquality().hash(_daily));
}

@override
String toString() {
    return 'VisitorStatsEntity(totalVisits: $totalVisits, uniqueVisitors: $uniqueVisitors, lastVisitAt: $lastVisitAt, daily: $daily)';
}


}

/// @nodoc
abstract mixin class _$VisitorStatsEntityCopyWith<$Res> implements $VisitorStatsEntityCopyWith<$Res> {
  factory _$VisitorStatsEntityCopyWith(_VisitorStatsEntity value, $Res Function(_VisitorStatsEntity) _then) = __$VisitorStatsEntityCopyWithImpl;
@override @useResult
$Res call({
 int totalVisits, int uniqueVisitors, DateTime? lastVisitAt, Map<String, int> daily
});




}
/// @nodoc
class __$VisitorStatsEntityCopyWithImpl<$Res>
    implements _$VisitorStatsEntityCopyWith<$Res> {
  __$VisitorStatsEntityCopyWithImpl(this._self, this._then);

  final _VisitorStatsEntity _self;
  final $Res Function(_VisitorStatsEntity) _then;

/// Create a copy of VisitorStatsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalVisits = null,Object? uniqueVisitors = null,Object? lastVisitAt = freezed,Object? daily = null,}) {
  return _then(_VisitorStatsEntity(
totalVisits: null == totalVisits ? _self.totalVisits : totalVisits // ignore: cast_nullable_to_non_nullable
as int,uniqueVisitors: null == uniqueVisitors ? _self.uniqueVisitors : uniqueVisitors // ignore: cast_nullable_to_non_nullable
as int,lastVisitAt: freezed == lastVisitAt ? _self.lastVisitAt : lastVisitAt // ignore: cast_nullable_to_non_nullable
as DateTime?,daily: null == daily ? _self._daily : daily // ignore: cast_nullable_to_non_nullable
as Map<String, int>,
  ));
}


}

// dart format on
