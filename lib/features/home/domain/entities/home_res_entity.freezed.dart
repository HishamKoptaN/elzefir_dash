// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_res_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeResEntity {

 String? get offerImage; List<CategoryEntity> get categories; List<ProductEntity> get products; List<AdditionEntity> get additions;
/// Create a copy of HomeResEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeResEntityCopyWith<HomeResEntity> get copyWith => _$HomeResEntityCopyWithImpl<HomeResEntity>(this as HomeResEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeResEntity&&(identical(other.offerImage, offerImage) || other.offerImage == offerImage)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.products, products)&&const DeepCollectionEquality().equals(other.additions, additions));
}


@override
int get hashCode => Object.hash(runtimeType,offerImage,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(products),const DeepCollectionEquality().hash(additions));

@override
String toString() {
  return 'HomeResEntity(offerImage: $offerImage, categories: $categories, products: $products, additions: $additions)';
}


}

/// @nodoc
abstract mixin class $HomeResEntityCopyWith<$Res>  {
  factory $HomeResEntityCopyWith(HomeResEntity value, $Res Function(HomeResEntity) _then) = _$HomeResEntityCopyWithImpl;
@useResult
$Res call({
 String? offerImage, List<CategoryEntity> categories, List<ProductEntity> products, List<AdditionEntity> additions
});




}
/// @nodoc
class _$HomeResEntityCopyWithImpl<$Res>
    implements $HomeResEntityCopyWith<$Res> {
  _$HomeResEntityCopyWithImpl(this._self, this._then);

  final HomeResEntity _self;
  final $Res Function(HomeResEntity) _then;

/// Create a copy of HomeResEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? offerImage = freezed,Object? categories = null,Object? products = null,Object? additions = null,}) {
  return _then(_self.copyWith(
offerImage: freezed == offerImage ? _self.offerImage : offerImage // ignore: cast_nullable_to_non_nullable
as String?,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductEntity>,additions: null == additions ? _self.additions : additions // ignore: cast_nullable_to_non_nullable
as List<AdditionEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeResEntity].
extension HomeResEntityPatterns on HomeResEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeResEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeResEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeResEntity value)  $default,){
final _that = this;
switch (_that) {
case _HomeResEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeResEntity value)?  $default,){
final _that = this;
switch (_that) {
case _HomeResEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? offerImage,  List<CategoryEntity> categories,  List<ProductEntity> products,  List<AdditionEntity> additions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeResEntity() when $default != null:
return $default(_that.offerImage,_that.categories,_that.products,_that.additions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? offerImage,  List<CategoryEntity> categories,  List<ProductEntity> products,  List<AdditionEntity> additions)  $default,) {final _that = this;
switch (_that) {
case _HomeResEntity():
return $default(_that.offerImage,_that.categories,_that.products,_that.additions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? offerImage,  List<CategoryEntity> categories,  List<ProductEntity> products,  List<AdditionEntity> additions)?  $default,) {final _that = this;
switch (_that) {
case _HomeResEntity() when $default != null:
return $default(_that.offerImage,_that.categories,_that.products,_that.additions);case _:
  return null;

}
}

}

/// @nodoc


class _HomeResEntity implements HomeResEntity {
  const _HomeResEntity({this.offerImage, final  List<CategoryEntity> categories = const [], final  List<ProductEntity> products = const [], final  List<AdditionEntity> additions = const []}): _categories = categories,_products = products,_additions = additions;
  

@override final  String? offerImage;
 final  List<CategoryEntity> _categories;
@override@JsonKey() List<CategoryEntity> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<ProductEntity> _products;
@override@JsonKey() List<ProductEntity> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

 final  List<AdditionEntity> _additions;
@override@JsonKey() List<AdditionEntity> get additions {
  if (_additions is EqualUnmodifiableListView) return _additions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_additions);
}


/// Create a copy of HomeResEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeResEntityCopyWith<_HomeResEntity> get copyWith => __$HomeResEntityCopyWithImpl<_HomeResEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeResEntity&&(identical(other.offerImage, offerImage) || other.offerImage == offerImage)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._products, _products)&&const DeepCollectionEquality().equals(other._additions, _additions));
}


@override
int get hashCode => Object.hash(runtimeType,offerImage,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_products),const DeepCollectionEquality().hash(_additions));

@override
String toString() {
  return 'HomeResEntity(offerImage: $offerImage, categories: $categories, products: $products, additions: $additions)';
}


}

/// @nodoc
abstract mixin class _$HomeResEntityCopyWith<$Res> implements $HomeResEntityCopyWith<$Res> {
  factory _$HomeResEntityCopyWith(_HomeResEntity value, $Res Function(_HomeResEntity) _then) = __$HomeResEntityCopyWithImpl;
@override @useResult
$Res call({
 String? offerImage, List<CategoryEntity> categories, List<ProductEntity> products, List<AdditionEntity> additions
});




}
/// @nodoc
class __$HomeResEntityCopyWithImpl<$Res>
    implements _$HomeResEntityCopyWith<$Res> {
  __$HomeResEntityCopyWithImpl(this._self, this._then);

  final _HomeResEntity _self;
  final $Res Function(_HomeResEntity) _then;

/// Create a copy of HomeResEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? offerImage = freezed,Object? categories = null,Object? products = null,Object? additions = null,}) {
  return _then(_HomeResEntity(
offerImage: freezed == offerImage ? _self.offerImage : offerImage // ignore: cast_nullable_to_non_nullable
as String?,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductEntity>,additions: null == additions ? _self._additions : additions // ignore: cast_nullable_to_non_nullable
as List<AdditionEntity>,
  ));
}


}

// dart format on
