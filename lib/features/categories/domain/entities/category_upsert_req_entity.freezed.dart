// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_upsert_req_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryUpsertReqEntity {

 int? get id; GenericFormInput? get imageUrl; XFileFormInput? get imageFile; GenericFormInput? get name; bool? get enabled;
/// Create a copy of CategoryUpsertReqEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryUpsertReqEntityCopyWith<CategoryUpsertReqEntity> get copyWith => _$CategoryUpsertReqEntityCopyWithImpl<CategoryUpsertReqEntity>(this as CategoryUpsertReqEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryUpsertReqEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.imageFile, imageFile) || other.imageFile == imageFile)&&(identical(other.name, name) || other.name == name)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}


@override
int get hashCode => Object.hash(runtimeType,id,imageUrl,imageFile,name,enabled);

@override
String toString() {
  return 'CategoryUpsertReqEntity(id: $id, imageUrl: $imageUrl, imageFile: $imageFile, name: $name, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class $CategoryUpsertReqEntityCopyWith<$Res>  {
  factory $CategoryUpsertReqEntityCopyWith(CategoryUpsertReqEntity value, $Res Function(CategoryUpsertReqEntity) _then) = _$CategoryUpsertReqEntityCopyWithImpl;
@useResult
$Res call({
 int? id, GenericFormInput? imageUrl, XFileFormInput? imageFile, GenericFormInput? name, bool? enabled
});




}
/// @nodoc
class _$CategoryUpsertReqEntityCopyWithImpl<$Res>
    implements $CategoryUpsertReqEntityCopyWith<$Res> {
  _$CategoryUpsertReqEntityCopyWithImpl(this._self, this._then);

  final CategoryUpsertReqEntity _self;
  final $Res Function(CategoryUpsertReqEntity) _then;

/// Create a copy of CategoryUpsertReqEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? imageUrl = freezed,Object? imageFile = freezed,Object? name = freezed,Object? enabled = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,imageFile: freezed == imageFile ? _self.imageFile : imageFile // ignore: cast_nullable_to_non_nullable
as XFileFormInput?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,enabled: freezed == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryUpsertReqEntity].
extension CategoryUpsertReqEntityPatterns on CategoryUpsertReqEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryUpsertReqEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryUpsertReqEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryUpsertReqEntity value)  $default,){
final _that = this;
switch (_that) {
case _CategoryUpsertReqEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryUpsertReqEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryUpsertReqEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  GenericFormInput? imageUrl,  XFileFormInput? imageFile,  GenericFormInput? name,  bool? enabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryUpsertReqEntity() when $default != null:
return $default(_that.id,_that.imageUrl,_that.imageFile,_that.name,_that.enabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  GenericFormInput? imageUrl,  XFileFormInput? imageFile,  GenericFormInput? name,  bool? enabled)  $default,) {final _that = this;
switch (_that) {
case _CategoryUpsertReqEntity():
return $default(_that.id,_that.imageUrl,_that.imageFile,_that.name,_that.enabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  GenericFormInput? imageUrl,  XFileFormInput? imageFile,  GenericFormInput? name,  bool? enabled)?  $default,) {final _that = this;
switch (_that) {
case _CategoryUpsertReqEntity() when $default != null:
return $default(_that.id,_that.imageUrl,_that.imageFile,_that.name,_that.enabled);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryUpsertReqEntity implements CategoryUpsertReqEntity {
  const _CategoryUpsertReqEntity({this.id, this.imageUrl, this.imageFile, this.name, this.enabled});
  

@override final  int? id;
@override final  GenericFormInput? imageUrl;
@override final  XFileFormInput? imageFile;
@override final  GenericFormInput? name;
@override final  bool? enabled;

/// Create a copy of CategoryUpsertReqEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryUpsertReqEntityCopyWith<_CategoryUpsertReqEntity> get copyWith => __$CategoryUpsertReqEntityCopyWithImpl<_CategoryUpsertReqEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryUpsertReqEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.imageFile, imageFile) || other.imageFile == imageFile)&&(identical(other.name, name) || other.name == name)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}


@override
int get hashCode => Object.hash(runtimeType,id,imageUrl,imageFile,name,enabled);

@override
String toString() {
  return 'CategoryUpsertReqEntity(id: $id, imageUrl: $imageUrl, imageFile: $imageFile, name: $name, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class _$CategoryUpsertReqEntityCopyWith<$Res> implements $CategoryUpsertReqEntityCopyWith<$Res> {
  factory _$CategoryUpsertReqEntityCopyWith(_CategoryUpsertReqEntity value, $Res Function(_CategoryUpsertReqEntity) _then) = __$CategoryUpsertReqEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, GenericFormInput? imageUrl, XFileFormInput? imageFile, GenericFormInput? name, bool? enabled
});




}
/// @nodoc
class __$CategoryUpsertReqEntityCopyWithImpl<$Res>
    implements _$CategoryUpsertReqEntityCopyWith<$Res> {
  __$CategoryUpsertReqEntityCopyWithImpl(this._self, this._then);

  final _CategoryUpsertReqEntity _self;
  final $Res Function(_CategoryUpsertReqEntity) _then;

/// Create a copy of CategoryUpsertReqEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? imageUrl = freezed,Object? imageFile = freezed,Object? name = freezed,Object? enabled = freezed,}) {
  return _then(_CategoryUpsertReqEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,imageFile: freezed == imageFile ? _self.imageFile : imageFile // ignore: cast_nullable_to_non_nullable
as XFileFormInput?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,enabled: freezed == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
