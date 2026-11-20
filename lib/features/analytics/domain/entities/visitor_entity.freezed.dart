// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visitor_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VisitorEntity {

 String get id; int get visits; DateTime? get firstSeenAt; DateTime? get lastSeenAt;
/// Create a copy of VisitorEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VisitorEntityCopyWith<VisitorEntity> get copyWith => _$VisitorEntityCopyWithImpl<VisitorEntity>(this as VisitorEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as VisitorEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VisitorEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.visits, _this.visits) || other.visits == _this.visits)&&(identical(other.firstSeenAt, _this.firstSeenAt) || other.firstSeenAt == _this.firstSeenAt)&&(identical(other.lastSeenAt, _this.lastSeenAt) || other.lastSeenAt == _this.lastSeenAt));
}


@override
int get hashCode {
  final _this = this as VisitorEntity;
  return Object.hash(runtimeType,_this.id,_this.visits,_this.firstSeenAt,_this.lastSeenAt);
}

@override
String toString() {
  final _this = this as VisitorEntity;
  return 'VisitorEntity(id: ${_this.id}, visits: ${_this.visits}, firstSeenAt: ${_this.firstSeenAt}, lastSeenAt: ${_this.lastSeenAt})';
}


}

/// @nodoc
abstract mixin class $VisitorEntityCopyWith<$Res>  {
  factory $VisitorEntityCopyWith(VisitorEntity value, $Res Function(VisitorEntity) _then) = _$VisitorEntityCopyWithImpl;
@useResult
$Res call({
 String id, int visits, DateTime? firstSeenAt, DateTime? lastSeenAt
});




}
/// @nodoc
class _$VisitorEntityCopyWithImpl<$Res>
    implements $VisitorEntityCopyWith<$Res> {
  _$VisitorEntityCopyWithImpl(this._self, this._then);

  final VisitorEntity _self;
  final $Res Function(VisitorEntity) _then;

/// Create a copy of VisitorEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? visits = null,Object? firstSeenAt = freezed,Object? lastSeenAt = freezed,}) {
  return _then(VisitorEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,visits: null == visits ? _self.visits : visits // ignore: cast_nullable_to_non_nullable
as int,firstSeenAt: freezed == firstSeenAt ? _self.firstSeenAt : firstSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastSeenAt: freezed == lastSeenAt ? _self.lastSeenAt : lastSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [VisitorEntity].
extension VisitorEntityPatterns on VisitorEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VisitorEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VisitorEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VisitorEntity value)  $default,){
final _that = this;
switch (_that) {
case _VisitorEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VisitorEntity value)?  $default,){
final _that = this;
switch (_that) {
case _VisitorEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int visits,  DateTime? firstSeenAt,  DateTime? lastSeenAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VisitorEntity() when $default != null:
return $default(_that.id,_that.visits,_that.firstSeenAt,_that.lastSeenAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int visits,  DateTime? firstSeenAt,  DateTime? lastSeenAt)  $default,) {final _that = this;
switch (_that) {
case _VisitorEntity():
return $default(_that.id,_that.visits,_that.firstSeenAt,_that.lastSeenAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int visits,  DateTime? firstSeenAt,  DateTime? lastSeenAt)?  $default,) {final _that = this;
switch (_that) {
case _VisitorEntity() when $default != null:
return $default(_that.id,_that.visits,_that.firstSeenAt,_that.lastSeenAt);case _:
  return null;

}
}

}

/// @nodoc


class _VisitorEntity implements VisitorEntity {
  const _VisitorEntity({required this.id, this.visits = 0, this.firstSeenAt, this.lastSeenAt});
  

@override final  String id;
@override@JsonKey() final  int visits;
@override final  DateTime? firstSeenAt;
@override final  DateTime? lastSeenAt;

/// Create a copy of VisitorEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VisitorEntityCopyWith<_VisitorEntity> get copyWith => __$VisitorEntityCopyWithImpl<_VisitorEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _VisitorEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.visits, visits) || other.visits == visits)&&(identical(other.firstSeenAt, firstSeenAt) || other.firstSeenAt == firstSeenAt)&&(identical(other.lastSeenAt, lastSeenAt) || other.lastSeenAt == lastSeenAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,visits,firstSeenAt,lastSeenAt);
}

@override
String toString() {
    return 'VisitorEntity(id: $id, visits: $visits, firstSeenAt: $firstSeenAt, lastSeenAt: $lastSeenAt)';
}


}

/// @nodoc
abstract mixin class _$VisitorEntityCopyWith<$Res> implements $VisitorEntityCopyWith<$Res> {
  factory _$VisitorEntityCopyWith(_VisitorEntity value, $Res Function(_VisitorEntity) _then) = __$VisitorEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, int visits, DateTime? firstSeenAt, DateTime? lastSeenAt
});




}
/// @nodoc
class __$VisitorEntityCopyWithImpl<$Res>
    implements _$VisitorEntityCopyWith<$Res> {
  __$VisitorEntityCopyWithImpl(this._self, this._then);

  final _VisitorEntity _self;
  final $Res Function(_VisitorEntity) _then;

/// Create a copy of VisitorEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? visits = null,Object? firstSeenAt = freezed,Object? lastSeenAt = freezed,}) {
  return _then(_VisitorEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,visits: null == visits ? _self.visits : visits // ignore: cast_nullable_to_non_nullable
as int,firstSeenAt: freezed == firstSeenAt ? _self.firstSeenAt : firstSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastSeenAt: freezed == lastSeenAt ? _self.lastSeenAt : lastSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
