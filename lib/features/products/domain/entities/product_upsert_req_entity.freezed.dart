// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_upsert_req_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductUpsertReqEntity {

 int? get id; GenericFormInput? get imageUrl; XFileFormInput? get imageFile; GenericFormInput? get name; GenericFormInput? get title; GenericFormInput? get description; GenericFormInput? get price; GenericFormInput? get categoryId; List<SettlementMethodEntity> get settlementMethods; List<ProductPriceVariantEntity> get priceVariants; bool? get enabled;
/// Create a copy of ProductUpsertReqEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductUpsertReqEntityCopyWith<ProductUpsertReqEntity> get copyWith => _$ProductUpsertReqEntityCopyWithImpl<ProductUpsertReqEntity>(this as ProductUpsertReqEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProductUpsertReqEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductUpsertReqEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.imageFile, _this.imageFile) || other.imageFile == _this.imageFile)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.categoryId, _this.categoryId) || other.categoryId == _this.categoryId)&&const DeepCollectionEquality().equals(other.settlementMethods, _this.settlementMethods)&&const DeepCollectionEquality().equals(other.priceVariants, _this.priceVariants)&&(identical(other.enabled, _this.enabled) || other.enabled == _this.enabled));
}


@override
int get hashCode {
  final _this = this as ProductUpsertReqEntity;
  return Object.hash(runtimeType,_this.id,_this.imageUrl,_this.imageFile,_this.name,_this.title,_this.description,_this.price,_this.categoryId,const DeepCollectionEquality().hash(_this.settlementMethods),const DeepCollectionEquality().hash(_this.priceVariants),_this.enabled);
}

@override
String toString() {
  final _this = this as ProductUpsertReqEntity;
  return 'ProductUpsertReqEntity(id: ${_this.id}, imageUrl: ${_this.imageUrl}, imageFile: ${_this.imageFile}, name: ${_this.name}, title: ${_this.title}, description: ${_this.description}, price: ${_this.price}, categoryId: ${_this.categoryId}, settlementMethods: ${_this.settlementMethods}, priceVariants: ${_this.priceVariants}, enabled: ${_this.enabled})';
}


}

/// @nodoc
abstract mixin class $ProductUpsertReqEntityCopyWith<$Res>  {
  factory $ProductUpsertReqEntityCopyWith(ProductUpsertReqEntity value, $Res Function(ProductUpsertReqEntity) _then) = _$ProductUpsertReqEntityCopyWithImpl;
@useResult
$Res call({
 int? id, GenericFormInput? imageUrl, XFileFormInput? imageFile, GenericFormInput? name, GenericFormInput? title, GenericFormInput? description, GenericFormInput? price, GenericFormInput? categoryId, List<SettlementMethodEntity> settlementMethods, List<ProductPriceVariantEntity> priceVariants, bool? enabled
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? imageUrl = freezed,Object? imageFile = freezed,Object? name = freezed,Object? title = freezed,Object? description = freezed,Object? price = freezed,Object? categoryId = freezed,Object? settlementMethods = null,Object? priceVariants = null,Object? enabled = freezed,}) {
  return _then(ProductUpsertReqEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,imageFile: freezed == imageFile ? _self.imageFile : imageFile // ignore: cast_nullable_to_non_nullable
as XFileFormInput?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,settlementMethods: null == settlementMethods ? _self.settlementMethods : settlementMethods // ignore: cast_nullable_to_non_nullable
as List<SettlementMethodEntity>,priceVariants: null == priceVariants ? _self.priceVariants : priceVariants // ignore: cast_nullable_to_non_nullable
as List<ProductPriceVariantEntity>,enabled: freezed == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  GenericFormInput? imageUrl,  XFileFormInput? imageFile,  GenericFormInput? name,  GenericFormInput? title,  GenericFormInput? description,  GenericFormInput? price,  GenericFormInput? categoryId,  List<SettlementMethodEntity> settlementMethods,  List<ProductPriceVariantEntity> priceVariants,  bool? enabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductUpsertReqEntity() when $default != null:
return $default(_that.id,_that.imageUrl,_that.imageFile,_that.name,_that.title,_that.description,_that.price,_that.categoryId,_that.settlementMethods,_that.priceVariants,_that.enabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  GenericFormInput? imageUrl,  XFileFormInput? imageFile,  GenericFormInput? name,  GenericFormInput? title,  GenericFormInput? description,  GenericFormInput? price,  GenericFormInput? categoryId,  List<SettlementMethodEntity> settlementMethods,  List<ProductPriceVariantEntity> priceVariants,  bool? enabled)  $default,) {final _that = this;
switch (_that) {
case _ProductUpsertReqEntity():
return $default(_that.id,_that.imageUrl,_that.imageFile,_that.name,_that.title,_that.description,_that.price,_that.categoryId,_that.settlementMethods,_that.priceVariants,_that.enabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  GenericFormInput? imageUrl,  XFileFormInput? imageFile,  GenericFormInput? name,  GenericFormInput? title,  GenericFormInput? description,  GenericFormInput? price,  GenericFormInput? categoryId,  List<SettlementMethodEntity> settlementMethods,  List<ProductPriceVariantEntity> priceVariants,  bool? enabled)?  $default,) {final _that = this;
switch (_that) {
case _ProductUpsertReqEntity() when $default != null:
return $default(_that.id,_that.imageUrl,_that.imageFile,_that.name,_that.title,_that.description,_that.price,_that.categoryId,_that.settlementMethods,_that.priceVariants,_that.enabled);case _:
  return null;

}
}

}

/// @nodoc


class _ProductUpsertReqEntity implements ProductUpsertReqEntity {
  const _ProductUpsertReqEntity({this.id, this.imageUrl, this.imageFile, this.name, this.title, this.description, this.price, this.categoryId,  List<SettlementMethodEntity> settlementMethods = const [],  List<ProductPriceVariantEntity> priceVariants = const [], this.enabled}): _settlementMethods = settlementMethods,_priceVariants = priceVariants;
  

@override final  int? id;
@override final  GenericFormInput? imageUrl;
@override final  XFileFormInput? imageFile;
@override final  GenericFormInput? name;
@override final  GenericFormInput? title;
@override final  GenericFormInput? description;
@override final  GenericFormInput? price;
@override final  GenericFormInput? categoryId;
 final  List<SettlementMethodEntity> _settlementMethods;
@override@JsonKey() List<SettlementMethodEntity> get settlementMethods {
  if (_settlementMethods is EqualUnmodifiableListView) return _settlementMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_settlementMethods);
}

 final  List<ProductPriceVariantEntity> _priceVariants;
@override@JsonKey() List<ProductPriceVariantEntity> get priceVariants {
  if (_priceVariants is EqualUnmodifiableListView) return _priceVariants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_priceVariants);
}

@override final  bool? enabled;

/// Create a copy of ProductUpsertReqEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductUpsertReqEntityCopyWith<_ProductUpsertReqEntity> get copyWith => __$ProductUpsertReqEntityCopyWithImpl<_ProductUpsertReqEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductUpsertReqEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.imageFile, imageFile) || other.imageFile == imageFile)&&(identical(other.name, name) || other.name == name)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&const DeepCollectionEquality().equals(other.settlementMethods, _settlementMethods)&&const DeepCollectionEquality().equals(other.priceVariants, _priceVariants)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,imageUrl,imageFile,name,title,description,price,categoryId,const DeepCollectionEquality().hash(_settlementMethods),const DeepCollectionEquality().hash(_priceVariants),enabled);
}

@override
String toString() {
    return 'ProductUpsertReqEntity(id: $id, imageUrl: $imageUrl, imageFile: $imageFile, name: $name, title: $title, description: $description, price: $price, categoryId: $categoryId, settlementMethods: $settlementMethods, priceVariants: $priceVariants, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class _$ProductUpsertReqEntityCopyWith<$Res> implements $ProductUpsertReqEntityCopyWith<$Res> {
  factory _$ProductUpsertReqEntityCopyWith(_ProductUpsertReqEntity value, $Res Function(_ProductUpsertReqEntity) _then) = __$ProductUpsertReqEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, GenericFormInput? imageUrl, XFileFormInput? imageFile, GenericFormInput? name, GenericFormInput? title, GenericFormInput? description, GenericFormInput? price, GenericFormInput? categoryId, List<SettlementMethodEntity> settlementMethods, List<ProductPriceVariantEntity> priceVariants, bool? enabled
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? imageUrl = freezed,Object? imageFile = freezed,Object? name = freezed,Object? title = freezed,Object? description = freezed,Object? price = freezed,Object? categoryId = freezed,Object? settlementMethods = null,Object? priceVariants = null,Object? enabled = freezed,}) {
  return _then(_ProductUpsertReqEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,imageFile: freezed == imageFile ? _self.imageFile : imageFile // ignore: cast_nullable_to_non_nullable
as XFileFormInput?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as GenericFormInput?,settlementMethods: null == settlementMethods ? _self._settlementMethods : settlementMethods // ignore: cast_nullable_to_non_nullable
as List<SettlementMethodEntity>,priceVariants: null == priceVariants ? _self._priceVariants : priceVariants // ignore: cast_nullable_to_non_nullable
as List<ProductPriceVariantEntity>,enabled: freezed == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
