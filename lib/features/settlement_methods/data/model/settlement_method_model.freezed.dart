// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settlement_method_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettlementMethodModel {

 String? get id; String? get name; String? get title; bool? get enabled;
/// Create a copy of SettlementMethodModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettlementMethodModelCopyWith<SettlementMethodModel> get copyWith => _$SettlementMethodModelCopyWithImpl<SettlementMethodModel>(this as SettlementMethodModel, _$identity);

  /// Serializes this SettlementMethodModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SettlementMethodModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettlementMethodModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.enabled, _this.enabled) || other.enabled == _this.enabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SettlementMethodModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.title,_this.enabled);
}

@override
String toString() {
  final _this = this as SettlementMethodModel;
  return 'SettlementMethodModel(id: ${_this.id}, name: ${_this.name}, title: ${_this.title}, enabled: ${_this.enabled})';
}


}

/// @nodoc
abstract mixin class $SettlementMethodModelCopyWith<$Res>  {
  factory $SettlementMethodModelCopyWith(SettlementMethodModel value, $Res Function(SettlementMethodModel) _then) = _$SettlementMethodModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? name, String? title, bool? enabled
});




}
/// @nodoc
class _$SettlementMethodModelCopyWithImpl<$Res>
    implements $SettlementMethodModelCopyWith<$Res> {
  _$SettlementMethodModelCopyWithImpl(this._self, this._then);

  final SettlementMethodModel _self;
  final $Res Function(SettlementMethodModel) _then;

/// Create a copy of SettlementMethodModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? title = freezed,Object? enabled = freezed,}) {
  return _then(SettlementMethodModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,enabled: freezed == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [SettlementMethodModel].
extension SettlementMethodModelPatterns on SettlementMethodModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettlementMethodModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettlementMethodModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettlementMethodModel value)  $default,){
final _that = this;
switch (_that) {
case _SettlementMethodModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettlementMethodModel value)?  $default,){
final _that = this;
switch (_that) {
case _SettlementMethodModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? name,  String? title,  bool? enabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettlementMethodModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? name,  String? title,  bool? enabled)  $default,) {final _that = this;
switch (_that) {
case _SettlementMethodModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? name,  String? title,  bool? enabled)?  $default,) {final _that = this;
switch (_that) {
case _SettlementMethodModel() when $default != null:
return $default(_that.id,_that.name,_that.title,_that.enabled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SettlementMethodModel implements SettlementMethodModel {
  const _SettlementMethodModel({this.id, this.name, this.title, this.enabled});
  factory _SettlementMethodModel.fromJson(Map<String, dynamic> json) => _$SettlementMethodModelFromJson(json);

@override final  String? id;
@override final  String? name;
@override final  String? title;
@override final  bool? enabled;

/// Create a copy of SettlementMethodModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettlementMethodModelCopyWith<_SettlementMethodModel> get copyWith => __$SettlementMethodModelCopyWithImpl<_SettlementMethodModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SettlementMethodModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettlementMethodModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.title, title) || other.title == title)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,title,enabled);
}

@override
String toString() {
    return 'SettlementMethodModel(id: $id, name: $name, title: $title, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class _$SettlementMethodModelCopyWith<$Res> implements $SettlementMethodModelCopyWith<$Res> {
  factory _$SettlementMethodModelCopyWith(_SettlementMethodModel value, $Res Function(_SettlementMethodModel) _then) = __$SettlementMethodModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name, String? title, bool? enabled
});




}
/// @nodoc
class __$SettlementMethodModelCopyWithImpl<$Res>
    implements _$SettlementMethodModelCopyWith<$Res> {
  __$SettlementMethodModelCopyWithImpl(this._self, this._then);

  final _SettlementMethodModel _self;
  final $Res Function(_SettlementMethodModel) _then;

/// Create a copy of SettlementMethodModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? title = freezed,Object? enabled = freezed,}) {
  return _then(_SettlementMethodModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,enabled: freezed == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
