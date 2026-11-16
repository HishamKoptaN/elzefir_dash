// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_price_variant_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductPriceVariantEntity {

 String get settlementMethodId; String get price;
/// Create a copy of ProductPriceVariantEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductPriceVariantEntityCopyWith<ProductPriceVariantEntity> get copyWith => _$ProductPriceVariantEntityCopyWithImpl<ProductPriceVariantEntity>(this as ProductPriceVariantEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProductPriceVariantEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductPriceVariantEntity&&(identical(other.settlementMethodId, _this.settlementMethodId) || other.settlementMethodId == _this.settlementMethodId)&&(identical(other.price, _this.price) || other.price == _this.price));
}


@override
int get hashCode {
  final _this = this as ProductPriceVariantEntity;
  return Object.hash(runtimeType,_this.settlementMethodId,_this.price);
}

@override
String toString() {
  final _this = this as ProductPriceVariantEntity;
  return 'ProductPriceVariantEntity(settlementMethodId: ${_this.settlementMethodId}, price: ${_this.price})';
}


}

/// @nodoc
abstract mixin class $ProductPriceVariantEntityCopyWith<$Res>  {
  factory $ProductPriceVariantEntityCopyWith(ProductPriceVariantEntity value, $Res Function(ProductPriceVariantEntity) _then) = _$ProductPriceVariantEntityCopyWithImpl;
@useResult
$Res call({
 String settlementMethodId, String price
});




}
/// @nodoc
class _$ProductPriceVariantEntityCopyWithImpl<$Res>
    implements $ProductPriceVariantEntityCopyWith<$Res> {
  _$ProductPriceVariantEntityCopyWithImpl(this._self, this._then);

  final ProductPriceVariantEntity _self;
  final $Res Function(ProductPriceVariantEntity) _then;

/// Create a copy of ProductPriceVariantEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? settlementMethodId = null,Object? price = null,}) {
  return _then(ProductPriceVariantEntity(
settlementMethodId: null == settlementMethodId ? _self.settlementMethodId : settlementMethodId // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductPriceVariantEntity].
extension ProductPriceVariantEntityPatterns on ProductPriceVariantEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductPriceVariantEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductPriceVariantEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductPriceVariantEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProductPriceVariantEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductPriceVariantEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProductPriceVariantEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String settlementMethodId,  String price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductPriceVariantEntity() when $default != null:
return $default(_that.settlementMethodId,_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String settlementMethodId,  String price)  $default,) {final _that = this;
switch (_that) {
case _ProductPriceVariantEntity():
return $default(_that.settlementMethodId,_that.price);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String settlementMethodId,  String price)?  $default,) {final _that = this;
switch (_that) {
case _ProductPriceVariantEntity() when $default != null:
return $default(_that.settlementMethodId,_that.price);case _:
  return null;

}
}

}

/// @nodoc


class _ProductPriceVariantEntity implements ProductPriceVariantEntity {
  const _ProductPriceVariantEntity({required this.settlementMethodId, required this.price});
  

@override final  String settlementMethodId;
@override final  String price;

/// Create a copy of ProductPriceVariantEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductPriceVariantEntityCopyWith<_ProductPriceVariantEntity> get copyWith => __$ProductPriceVariantEntityCopyWithImpl<_ProductPriceVariantEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductPriceVariantEntity&&(identical(other.settlementMethodId, settlementMethodId) || other.settlementMethodId == settlementMethodId)&&(identical(other.price, price) || other.price == price));
}


@override
int get hashCode {
    return Object.hash(runtimeType,settlementMethodId,price);
}

@override
String toString() {
    return 'ProductPriceVariantEntity(settlementMethodId: $settlementMethodId, price: $price)';
}


}

/// @nodoc
abstract mixin class _$ProductPriceVariantEntityCopyWith<$Res> implements $ProductPriceVariantEntityCopyWith<$Res> {
  factory _$ProductPriceVariantEntityCopyWith(_ProductPriceVariantEntity value, $Res Function(_ProductPriceVariantEntity) _then) = __$ProductPriceVariantEntityCopyWithImpl;
@override @useResult
$Res call({
 String settlementMethodId, String price
});




}
/// @nodoc
class __$ProductPriceVariantEntityCopyWithImpl<$Res>
    implements _$ProductPriceVariantEntityCopyWith<$Res> {
  __$ProductPriceVariantEntityCopyWithImpl(this._self, this._then);

  final _ProductPriceVariantEntity _self;
  final $Res Function(_ProductPriceVariantEntity) _then;

/// Create a copy of ProductPriceVariantEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? settlementMethodId = null,Object? price = null,}) {
  return _then(_ProductPriceVariantEntity(
settlementMethodId: null == settlementMethodId ? _self.settlementMethodId : settlementMethodId // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
