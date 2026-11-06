// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_res_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeResModel {

@JsonKey(name: 'offer_image') String? get offerImage; List<CategoryModel>? get categories; List<ProductModel>? get products; List<AdditionModel>? get additions;
/// Create a copy of HomeResModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeResModelCopyWith<HomeResModel> get copyWith => _$HomeResModelCopyWithImpl<HomeResModel>(this as HomeResModel, _$identity);

  /// Serializes this HomeResModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeResModel&&(identical(other.offerImage, offerImage) || other.offerImage == offerImage)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.products, products)&&const DeepCollectionEquality().equals(other.additions, additions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,offerImage,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(products),const DeepCollectionEquality().hash(additions));

@override
String toString() {
  return 'HomeResModel(offerImage: $offerImage, categories: $categories, products: $products, additions: $additions)';
}


}

/// @nodoc
abstract mixin class $HomeResModelCopyWith<$Res>  {
  factory $HomeResModelCopyWith(HomeResModel value, $Res Function(HomeResModel) _then) = _$HomeResModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'offer_image') String? offerImage, List<CategoryModel>? categories, List<ProductModel>? products, List<AdditionModel>? additions
});




}
/// @nodoc
class _$HomeResModelCopyWithImpl<$Res>
    implements $HomeResModelCopyWith<$Res> {
  _$HomeResModelCopyWithImpl(this._self, this._then);

  final HomeResModel _self;
  final $Res Function(HomeResModel) _then;

/// Create a copy of HomeResModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? offerImage = freezed,Object? categories = freezed,Object? products = freezed,Object? additions = freezed,}) {
  return _then(_self.copyWith(
offerImage: freezed == offerImage ? _self.offerImage : offerImage // ignore: cast_nullable_to_non_nullable
as String?,categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>?,products: freezed == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>?,additions: freezed == additions ? _self.additions : additions // ignore: cast_nullable_to_non_nullable
as List<AdditionModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeResModel].
extension HomeResModelPatterns on HomeResModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeResModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeResModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeResModel value)  $default,){
final _that = this;
switch (_that) {
case _HomeResModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeResModel value)?  $default,){
final _that = this;
switch (_that) {
case _HomeResModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'offer_image')  String? offerImage,  List<CategoryModel>? categories,  List<ProductModel>? products,  List<AdditionModel>? additions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeResModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'offer_image')  String? offerImage,  List<CategoryModel>? categories,  List<ProductModel>? products,  List<AdditionModel>? additions)  $default,) {final _that = this;
switch (_that) {
case _HomeResModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'offer_image')  String? offerImage,  List<CategoryModel>? categories,  List<ProductModel>? products,  List<AdditionModel>? additions)?  $default,) {final _that = this;
switch (_that) {
case _HomeResModel() when $default != null:
return $default(_that.offerImage,_that.categories,_that.products,_that.additions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeResModel implements HomeResModel {
  const _HomeResModel({@JsonKey(name: 'offer_image') this.offerImage, final  List<CategoryModel>? categories = const [], final  List<ProductModel>? products = const [], final  List<AdditionModel>? additions = const []}): _categories = categories,_products = products,_additions = additions;
  factory _HomeResModel.fromJson(Map<String, dynamic> json) => _$HomeResModelFromJson(json);

@override@JsonKey(name: 'offer_image') final  String? offerImage;
 final  List<CategoryModel>? _categories;
@override@JsonKey() List<CategoryModel>? get categories {
  final value = _categories;
  if (value == null) return null;
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ProductModel>? _products;
@override@JsonKey() List<ProductModel>? get products {
  final value = _products;
  if (value == null) return null;
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<AdditionModel>? _additions;
@override@JsonKey() List<AdditionModel>? get additions {
  final value = _additions;
  if (value == null) return null;
  if (_additions is EqualUnmodifiableListView) return _additions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of HomeResModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeResModelCopyWith<_HomeResModel> get copyWith => __$HomeResModelCopyWithImpl<_HomeResModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeResModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeResModel&&(identical(other.offerImage, offerImage) || other.offerImage == offerImage)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._products, _products)&&const DeepCollectionEquality().equals(other._additions, _additions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,offerImage,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_products),const DeepCollectionEquality().hash(_additions));

@override
String toString() {
  return 'HomeResModel(offerImage: $offerImage, categories: $categories, products: $products, additions: $additions)';
}


}

/// @nodoc
abstract mixin class _$HomeResModelCopyWith<$Res> implements $HomeResModelCopyWith<$Res> {
  factory _$HomeResModelCopyWith(_HomeResModel value, $Res Function(_HomeResModel) _then) = __$HomeResModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'offer_image') String? offerImage, List<CategoryModel>? categories, List<ProductModel>? products, List<AdditionModel>? additions
});




}
/// @nodoc
class __$HomeResModelCopyWithImpl<$Res>
    implements _$HomeResModelCopyWith<$Res> {
  __$HomeResModelCopyWithImpl(this._self, this._then);

  final _HomeResModel _self;
  final $Res Function(_HomeResModel) _then;

/// Create a copy of HomeResModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? offerImage = freezed,Object? categories = freezed,Object? products = freezed,Object? additions = freezed,}) {
  return _then(_HomeResModel(
offerImage: freezed == offerImage ? _self.offerImage : offerImage // ignore: cast_nullable_to_non_nullable
as String?,categories: freezed == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>?,products: freezed == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>?,additions: freezed == additions ? _self._additions : additions // ignore: cast_nullable_to_non_nullable
as List<AdditionModel>?,
  ));
}


}

// dart format on
