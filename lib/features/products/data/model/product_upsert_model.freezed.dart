// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_upsert_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductUpsertReqModel {

 int? get id; String? get image; String? get name; String? get title; String? get description; num? get price; String? get priceUnit;@JsonKey(name: 'category_id') String? get categoryId;
/// Create a copy of ProductUpsertReqModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductUpsertReqModelCopyWith<ProductUpsertReqModel> get copyWith => _$ProductUpsertReqModelCopyWithImpl<ProductUpsertReqModel>(this as ProductUpsertReqModel, _$identity);

  /// Serializes this ProductUpsertReqModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProductUpsertReqModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductUpsertReqModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.image, _this.image) || other.image == _this.image)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.priceUnit, _this.priceUnit) || other.priceUnit == _this.priceUnit)&&(identical(other.categoryId, _this.categoryId) || other.categoryId == _this.categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProductUpsertReqModel;
  return Object.hash(runtimeType,_this.id,_this.image,_this.name,_this.title,_this.description,_this.price,_this.priceUnit,_this.categoryId);
}

@override
String toString() {
  final _this = this as ProductUpsertReqModel;
  return 'ProductUpsertReqModel(id: ${_this.id}, image: ${_this.image}, name: ${_this.name}, title: ${_this.title}, description: ${_this.description}, price: ${_this.price}, priceUnit: ${_this.priceUnit}, categoryId: ${_this.categoryId})';
}


}

/// @nodoc
abstract mixin class $ProductUpsertReqModelCopyWith<$Res>  {
  factory $ProductUpsertReqModelCopyWith(ProductUpsertReqModel value, $Res Function(ProductUpsertReqModel) _then) = _$ProductUpsertReqModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? image, String? name, String? title, String? description, num? price, String? priceUnit,@JsonKey(name: 'category_id') String? categoryId
});




}
/// @nodoc
class _$ProductUpsertReqModelCopyWithImpl<$Res>
    implements $ProductUpsertReqModelCopyWith<$Res> {
  _$ProductUpsertReqModelCopyWithImpl(this._self, this._then);

  final ProductUpsertReqModel _self;
  final $Res Function(ProductUpsertReqModel) _then;

/// Create a copy of ProductUpsertReqModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? image = freezed,Object? name = freezed,Object? title = freezed,Object? description = freezed,Object? price = freezed,Object? priceUnit = freezed,Object? categoryId = freezed,}) {
  return _then(ProductUpsertReqModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as num?,priceUnit: freezed == priceUnit ? _self.priceUnit : priceUnit // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductUpsertReqModel].
extension ProductUpsertReqModelPatterns on ProductUpsertReqModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductUpsertReqModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductUpsertReqModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductUpsertReqModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductUpsertReqModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductUpsertReqModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductUpsertReqModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? image,  String? name,  String? title,  String? description,  num? price,  String? priceUnit, @JsonKey(name: 'category_id')  String? categoryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductUpsertReqModel() when $default != null:
return $default(_that.id,_that.image,_that.name,_that.title,_that.description,_that.price,_that.priceUnit,_that.categoryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? image,  String? name,  String? title,  String? description,  num? price,  String? priceUnit, @JsonKey(name: 'category_id')  String? categoryId)  $default,) {final _that = this;
switch (_that) {
case _ProductUpsertReqModel():
return $default(_that.id,_that.image,_that.name,_that.title,_that.description,_that.price,_that.priceUnit,_that.categoryId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? image,  String? name,  String? title,  String? description,  num? price,  String? priceUnit, @JsonKey(name: 'category_id')  String? categoryId)?  $default,) {final _that = this;
switch (_that) {
case _ProductUpsertReqModel() when $default != null:
return $default(_that.id,_that.image,_that.name,_that.title,_that.description,_that.price,_that.priceUnit,_that.categoryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductUpsertReqModel implements ProductUpsertReqModel {
  const _ProductUpsertReqModel({this.id, this.image, this.name, this.title, this.description, this.price, this.priceUnit, @JsonKey(name: 'category_id') this.categoryId});
  factory _ProductUpsertReqModel.fromJson(Map<String, dynamic> json) => _$ProductUpsertReqModelFromJson(json);

@override final  int? id;
@override final  String? image;
@override final  String? name;
@override final  String? title;
@override final  String? description;
@override final  num? price;
@override final  String? priceUnit;
@override@JsonKey(name: 'category_id') final  String? categoryId;

/// Create a copy of ProductUpsertReqModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductUpsertReqModelCopyWith<_ProductUpsertReqModel> get copyWith => __$ProductUpsertReqModelCopyWithImpl<_ProductUpsertReqModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductUpsertReqModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductUpsertReqModel&&(identical(other.id, id) || other.id == id)&&(identical(other.image, image) || other.image == image)&&(identical(other.name, name) || other.name == name)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceUnit, priceUnit) || other.priceUnit == priceUnit)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,image,name,title,description,price,priceUnit,categoryId);
}

@override
String toString() {
    return 'ProductUpsertReqModel(id: $id, image: $image, name: $name, title: $title, description: $description, price: $price, priceUnit: $priceUnit, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$ProductUpsertReqModelCopyWith<$Res> implements $ProductUpsertReqModelCopyWith<$Res> {
  factory _$ProductUpsertReqModelCopyWith(_ProductUpsertReqModel value, $Res Function(_ProductUpsertReqModel) _then) = __$ProductUpsertReqModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? image, String? name, String? title, String? description, num? price, String? priceUnit,@JsonKey(name: 'category_id') String? categoryId
});




}
/// @nodoc
class __$ProductUpsertReqModelCopyWithImpl<$Res>
    implements _$ProductUpsertReqModelCopyWith<$Res> {
  __$ProductUpsertReqModelCopyWithImpl(this._self, this._then);

  final _ProductUpsertReqModel _self;
  final $Res Function(_ProductUpsertReqModel) _then;

/// Create a copy of ProductUpsertReqModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? image = freezed,Object? name = freezed,Object? title = freezed,Object? description = freezed,Object? price = freezed,Object? priceUnit = freezed,Object? categoryId = freezed,}) {
  return _then(_ProductUpsertReqModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as num?,priceUnit: freezed == priceUnit ? _self.priceUnit : priceUnit // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
