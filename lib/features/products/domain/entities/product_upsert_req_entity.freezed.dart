// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_upsert_req_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductUpsertReqEntity {

 int? get id; GenericFormInput? get imageUrl; XFileFormInput? get imageFile; GenericFormInput? get name; GenericFormInput? get title; GenericFormInput? get description; GenericFormInput? get price; GenericFormInput? get categoryId; bool? get enabled;
/// Create a copy of ProductUpsertReqEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductUpsertReqEntityCopyWith<ProductUpsertReqEntity> get copyWith => _$ProductUpsertReqEntityCopyWithImpl<ProductUpsertReqEntity>(this as ProductUpsertReqEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductUpsertReqEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.imageFile, imageFile) || other.imageFile == imageFile)&&(identical(other.name, name) || other.name == name)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}


@override
int get hashCode => Object.hash(runtimeType,id,imageUrl,imageFile,name,title,description,price,categoryId,enabled);

@override
String toString() {
  return 'ProductUpsertReqEntity(id: $id, imageUrl: $imageUrl, imageFile: $imageFile, name: $name, title: $title, description: $description, price: $price, categoryId: $categoryId, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class $ProductUpsertReqEntityCopyWith<$Res>  {
  factory $ProductUpsertReqEntityCopyWith(ProductUpsertReqEntity value, $Res Function(ProductUpsertReqEntity) _then) = _$ProductUpsertReqEntityCopyWithImpl;
@useResult
$Res call({
 int? id, GenericFormInput? imageUrl, XFileFormInput? imageFile, GenericFormInput? name, GenericFormInput? title, GenericFormInput? description, GenericFormInput? price, GenericFormInput? categoryId, bool? enabled
});




}
/// @nodoc
class _$ProductUpsertReqEntityCopyWithImpl<$Res>
    implements $ProductUpsertReqEntityCopyWith<$Res> {
  _$ProductUpsertReqEntityCopyWithImpl(this._self, this._then);

  final ProductUpsertReqEntity _self;
  final $Res Function(ProductUpsertReqEntity) _then;

/// Create a copy of ProductUpsertReqEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? imageUrl = freezed,Object? imageFile = freezed,Object? name = freezed,Object? title = freezed,Object? description = freezed,Object? price = freezed,Object? categoryId = freezed,Object? enabled = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,imageFile: freezed == imageFile ? _self.imageFile : imageFile // ignore: cast_nullable_to_non_nullable
as XFileFormInput?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,enabled: freezed == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductUpsertReqEntity].
extension ProductUpsertReqEntityPatterns on ProductUpsertReqEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductUpsertReqEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductUpsertReqEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductUpsertReqEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProductUpsertReqEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductUpsertReqEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProductUpsertReqEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  GenericFormInput? imageUrl,  XFileFormInput? imageFile,  GenericFormInput? name,  GenericFormInput? title,  GenericFormInput? description,  GenericFormInput? price,  GenericFormInput? categoryId,  bool? enabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductUpsertReqEntity() when $default != null:
return $default(_that.id,_that.imageUrl,_that.imageFile,_that.name,_that.title,_that.description,_that.price,_that.categoryId,_that.enabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  GenericFormInput? imageUrl,  XFileFormInput? imageFile,  GenericFormInput? name,  GenericFormInput? title,  GenericFormInput? description,  GenericFormInput? price,  GenericFormInput? categoryId,  bool? enabled)  $default,) {final _that = this;
switch (_that) {
case _ProductUpsertReqEntity():
return $default(_that.id,_that.imageUrl,_that.imageFile,_that.name,_that.title,_that.description,_that.price,_that.categoryId,_that.enabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  GenericFormInput? imageUrl,  XFileFormInput? imageFile,  GenericFormInput? name,  GenericFormInput? title,  GenericFormInput? description,  GenericFormInput? price,  GenericFormInput? categoryId,  bool? enabled)?  $default,) {final _that = this;
switch (_that) {
case _ProductUpsertReqEntity() when $default != null:
return $default(_that.id,_that.imageUrl,_that.imageFile,_that.name,_that.title,_that.description,_that.price,_that.categoryId,_that.enabled);case _:
  return null;

}
}

}

/// @nodoc


class _ProductUpsertReqEntity implements ProductUpsertReqEntity {
  const _ProductUpsertReqEntity({this.id, this.imageUrl, this.imageFile, this.name, this.title, this.description, this.price, this.categoryId, this.enabled});
  

@override final  int? id;
@override final  GenericFormInput? imageUrl;
@override final  XFileFormInput? imageFile;
@override final  GenericFormInput? name;
@override final  GenericFormInput? title;
@override final  GenericFormInput? description;
@override final  GenericFormInput? price;
@override final  GenericFormInput? categoryId;
@override final  bool? enabled;

/// Create a copy of ProductUpsertReqEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductUpsertReqEntityCopyWith<_ProductUpsertReqEntity> get copyWith => __$ProductUpsertReqEntityCopyWithImpl<_ProductUpsertReqEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductUpsertReqEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.imageFile, imageFile) || other.imageFile == imageFile)&&(identical(other.name, name) || other.name == name)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}


@override
int get hashCode => Object.hash(runtimeType,id,imageUrl,imageFile,name,title,description,price,categoryId,enabled);

@override
String toString() {
  return 'ProductUpsertReqEntity(id: $id, imageUrl: $imageUrl, imageFile: $imageFile, name: $name, title: $title, description: $description, price: $price, categoryId: $categoryId, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class _$ProductUpsertReqEntityCopyWith<$Res> implements $ProductUpsertReqEntityCopyWith<$Res> {
  factory _$ProductUpsertReqEntityCopyWith(_ProductUpsertReqEntity value, $Res Function(_ProductUpsertReqEntity) _then) = __$ProductUpsertReqEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, GenericFormInput? imageUrl, XFileFormInput? imageFile, GenericFormInput? name, GenericFormInput? title, GenericFormInput? description, GenericFormInput? price, GenericFormInput? categoryId, bool? enabled
});




}
/// @nodoc
class __$ProductUpsertReqEntityCopyWithImpl<$Res>
    implements _$ProductUpsertReqEntityCopyWith<$Res> {
  __$ProductUpsertReqEntityCopyWithImpl(this._self, this._then);

  final _ProductUpsertReqEntity _self;
  final $Res Function(_ProductUpsertReqEntity) _then;

/// Create a copy of ProductUpsertReqEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? imageUrl = freezed,Object? imageFile = freezed,Object? name = freezed,Object? title = freezed,Object? description = freezed,Object? price = freezed,Object? categoryId = freezed,Object? enabled = freezed,}) {
  return _then(_ProductUpsertReqEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,imageFile: freezed == imageFile ? _self.imageFile : imageFile // ignore: cast_nullable_to_non_nullable
as XFileFormInput?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,enabled: freezed == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
