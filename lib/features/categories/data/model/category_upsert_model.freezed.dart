// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_upsert_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryUpsertReqModel {

 int? get id; String? get image; String? get name;
/// Create a copy of CategoryUpsertReqModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryUpsertReqModelCopyWith<CategoryUpsertReqModel> get copyWith => _$CategoryUpsertReqModelCopyWithImpl<CategoryUpsertReqModel>(this as CategoryUpsertReqModel, _$identity);

  /// Serializes this CategoryUpsertReqModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CategoryUpsertReqModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryUpsertReqModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.image, _this.image) || other.image == _this.image)&&(identical(other.name, _this.name) || other.name == _this.name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CategoryUpsertReqModel;
  return Object.hash(runtimeType,_this.id,_this.image,_this.name);
}

@override
String toString() {
  final _this = this as CategoryUpsertReqModel;
  return 'CategoryUpsertReqModel(id: ${_this.id}, image: ${_this.image}, name: ${_this.name})';
}


}

/// @nodoc
abstract mixin class $CategoryUpsertReqModelCopyWith<$Res>  {
  factory $CategoryUpsertReqModelCopyWith(CategoryUpsertReqModel value, $Res Function(CategoryUpsertReqModel) _then) = _$CategoryUpsertReqModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? image, String? name
});




}
/// @nodoc
class _$CategoryUpsertReqModelCopyWithImpl<$Res>
    implements $CategoryUpsertReqModelCopyWith<$Res> {
  _$CategoryUpsertReqModelCopyWithImpl(this._self, this._then);

  final CategoryUpsertReqModel _self;
  final $Res Function(CategoryUpsertReqModel) _then;

/// Create a copy of CategoryUpsertReqModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? image = freezed,Object? name = freezed,}) {
  return _then(CategoryUpsertReqModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryUpsertReqModel].
extension CategoryUpsertReqModelPatterns on CategoryUpsertReqModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryUpsertReqModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryUpsertReqModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryUpsertReqModel value)  $default,){
final _that = this;
switch (_that) {
case _CategoryUpsertReqModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryUpsertReqModel value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryUpsertReqModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? image,  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryUpsertReqModel() when $default != null:
return $default(_that.id,_that.image,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? image,  String? name)  $default,) {final _that = this;
switch (_that) {
case _CategoryUpsertReqModel():
return $default(_that.id,_that.image,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? image,  String? name)?  $default,) {final _that = this;
switch (_that) {
case _CategoryUpsertReqModel() when $default != null:
return $default(_that.id,_that.image,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryUpsertReqModel implements CategoryUpsertReqModel {
  const _CategoryUpsertReqModel({this.id, this.image, this.name});
  factory _CategoryUpsertReqModel.fromJson(Map<String, dynamic> json) => _$CategoryUpsertReqModelFromJson(json);

@override final  int? id;
@override final  String? image;
@override final  String? name;

/// Create a copy of CategoryUpsertReqModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryUpsertReqModelCopyWith<_CategoryUpsertReqModel> get copyWith => __$CategoryUpsertReqModelCopyWithImpl<_CategoryUpsertReqModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryUpsertReqModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryUpsertReqModel&&(identical(other.id, id) || other.id == id)&&(identical(other.image, image) || other.image == image)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,image,name);
}

@override
String toString() {
    return 'CategoryUpsertReqModel(id: $id, image: $image, name: $name)';
}


}

/// @nodoc
abstract mixin class _$CategoryUpsertReqModelCopyWith<$Res> implements $CategoryUpsertReqModelCopyWith<$Res> {
  factory _$CategoryUpsertReqModelCopyWith(_CategoryUpsertReqModel value, $Res Function(_CategoryUpsertReqModel) _then) = __$CategoryUpsertReqModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? image, String? name
});




}
/// @nodoc
class __$CategoryUpsertReqModelCopyWithImpl<$Res>
    implements _$CategoryUpsertReqModelCopyWith<$Res> {
  __$CategoryUpsertReqModelCopyWithImpl(this._self, this._then);

  final _CategoryUpsertReqModel _self;
  final $Res Function(_CategoryUpsertReqModel) _then;

/// Create a copy of CategoryUpsertReqModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? image = freezed,Object? name = freezed,}) {
  return _then(_CategoryUpsertReqModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
