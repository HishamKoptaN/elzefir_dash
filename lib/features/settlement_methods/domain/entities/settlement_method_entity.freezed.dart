// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settlement_method_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettlementMethodEntity {

 String get id; String get name; String get title; bool get enabled;
/// Create a copy of SettlementMethodEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettlementMethodEntityCopyWith<SettlementMethodEntity> get copyWith => _$SettlementMethodEntityCopyWithImpl<SettlementMethodEntity>(this as SettlementMethodEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SettlementMethodEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettlementMethodEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.enabled, _this.enabled) || other.enabled == _this.enabled));
}


@override
int get hashCode {
  final _this = this as SettlementMethodEntity;
  return Object.hash(runtimeType,_this.id,_this.name,_this.title,_this.enabled);
}

@override
String toString() {
  final _this = this as SettlementMethodEntity;
  return 'SettlementMethodEntity(id: ${_this.id}, name: ${_this.name}, title: ${_this.title}, enabled: ${_this.enabled})';
}


}

/// @nodoc
abstract mixin class $SettlementMethodEntityCopyWith<$Res>  {
  factory $SettlementMethodEntityCopyWith(SettlementMethodEntity value, $Res Function(SettlementMethodEntity) _then) = _$SettlementMethodEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String title, bool enabled
});




}
/// @nodoc
class _$SettlementMethodEntityCopyWithImpl<$Res>
    implements $SettlementMethodEntityCopyWith<$Res> {
  _$SettlementMethodEntityCopyWithImpl(this._self, this._then);

  final SettlementMethodEntity _self;
  final $Res Function(SettlementMethodEntity) _then;

/// Create a copy of SettlementMethodEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? title = null,Object? enabled = null,}) {
  return _then(SettlementMethodEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SettlementMethodEntity].
extension SettlementMethodEntityPatterns on SettlementMethodEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettlementMethodEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettlementMethodEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettlementMethodEntity value)  $default,){
final _that = this;
switch (_that) {
case _SettlementMethodEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettlementMethodEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SettlementMethodEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String title,  bool enabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettlementMethodEntity() when $default != null:
return $default(_that.id,_that.name,_that.title,_that.enabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String title,  bool enabled)  $default,) {final _that = this;
switch (_that) {
case _SettlementMethodEntity():
return $default(_that.id,_that.name,_that.title,_that.enabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String title,  bool enabled)?  $default,) {final _that = this;
switch (_that) {
case _SettlementMethodEntity() when $default != null:
return $default(_that.id,_that.name,_that.title,_that.enabled);case _:
  return null;

}
}

}

/// @nodoc


class _SettlementMethodEntity implements SettlementMethodEntity {
  const _SettlementMethodEntity({this.id = '', this.name = '', this.title = '', this.enabled = true});
  

@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String title;
@override@JsonKey() final  bool enabled;

/// Create a copy of SettlementMethodEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettlementMethodEntityCopyWith<_SettlementMethodEntity> get copyWith => __$SettlementMethodEntityCopyWithImpl<_SettlementMethodEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettlementMethodEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.title, title) || other.title == title)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,title,enabled);
}

@override
String toString() {
    return 'SettlementMethodEntity(id: $id, name: $name, title: $title, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class _$SettlementMethodEntityCopyWith<$Res> implements $SettlementMethodEntityCopyWith<$Res> {
  factory _$SettlementMethodEntityCopyWith(_SettlementMethodEntity value, $Res Function(_SettlementMethodEntity) _then) = __$SettlementMethodEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String title, bool enabled
});




}
/// @nodoc
class __$SettlementMethodEntityCopyWithImpl<$Res>
    implements _$SettlementMethodEntityCopyWith<$Res> {
  __$SettlementMethodEntityCopyWithImpl(this._self, this._then);

  final _SettlementMethodEntity _self;
  final $Res Function(_SettlementMethodEntity) _then;

/// Create a copy of SettlementMethodEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? title = null,Object? enabled = null,}) {
  return _then(_SettlementMethodEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
