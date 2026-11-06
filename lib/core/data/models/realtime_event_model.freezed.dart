// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'realtime_event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RealtimeEventModel {

@JsonKey(name: "id") int? get id;@JsonKey(name: "order_num") String? get orderNum;@JsonKey(name: "name") String? get name;@JsonKey(name: "status") bool? get status;@JsonKey(name: "total_amount") String? get totalAmount;@JsonKey(name: "country_code") String? get countryCode;@JsonKey(name: "created_at") String? get createdAt;@JsonKey(name: "updated_at") String? get updatedAt;@JsonKey(name: "package") PackageModel? get package;@JsonKey(name: "distribution_country") DistributionCountry? get distributionCountry;@JsonKey(name: "changes") Map<String, dynamic>? get changes;
/// Create a copy of RealtimeEventModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RealtimeEventModelCopyWith<RealtimeEventModel> get copyWith => _$RealtimeEventModelCopyWithImpl<RealtimeEventModel>(this as RealtimeEventModel, _$identity);

  /// Serializes this RealtimeEventModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RealtimeEventModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderNum, orderNum) || other.orderNum == orderNum)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.package, package) || other.package == package)&&(identical(other.distributionCountry, distributionCountry) || other.distributionCountry == distributionCountry)&&const DeepCollectionEquality().equals(other.changes, changes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderNum,name,status,totalAmount,countryCode,createdAt,updatedAt,package,distributionCountry,const DeepCollectionEquality().hash(changes));

@override
String toString() {
  return 'RealtimeEventModel(id: $id, orderNum: $orderNum, name: $name, status: $status, totalAmount: $totalAmount, countryCode: $countryCode, createdAt: $createdAt, updatedAt: $updatedAt, package: $package, distributionCountry: $distributionCountry, changes: $changes)';
}


}

/// @nodoc
abstract mixin class $RealtimeEventModelCopyWith<$Res>  {
  factory $RealtimeEventModelCopyWith(RealtimeEventModel value, $Res Function(RealtimeEventModel) _then) = _$RealtimeEventModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "order_num") String? orderNum,@JsonKey(name: "name") String? name,@JsonKey(name: "status") bool? status,@JsonKey(name: "total_amount") String? totalAmount,@JsonKey(name: "country_code") String? countryCode,@JsonKey(name: "created_at") String? createdAt,@JsonKey(name: "updated_at") String? updatedAt,@JsonKey(name: "package") PackageModel? package,@JsonKey(name: "distribution_country") DistributionCountry? distributionCountry,@JsonKey(name: "changes") Map<String, dynamic>? changes
});


$PackageModelCopyWith<$Res>? get package;$DistributionCountryCopyWith<$Res>? get distributionCountry;

}
/// @nodoc
class _$RealtimeEventModelCopyWithImpl<$Res>
    implements $RealtimeEventModelCopyWith<$Res> {
  _$RealtimeEventModelCopyWithImpl(this._self, this._then);

  final RealtimeEventModel _self;
  final $Res Function(RealtimeEventModel) _then;

/// Create a copy of RealtimeEventModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? orderNum = freezed,Object? name = freezed,Object? status = freezed,Object? totalAmount = freezed,Object? countryCode = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? package = freezed,Object? distributionCountry = freezed,Object? changes = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,orderNum: freezed == orderNum ? _self.orderNum : orderNum // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,totalAmount: freezed == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as String?,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,package: freezed == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as PackageModel?,distributionCountry: freezed == distributionCountry ? _self.distributionCountry : distributionCountry // ignore: cast_nullable_to_non_nullable
as DistributionCountry?,changes: freezed == changes ? _self.changes : changes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of RealtimeEventModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PackageModelCopyWith<$Res>? get package {
    if (_self.package == null) {
    return null;
  }

  return $PackageModelCopyWith<$Res>(_self.package!, (value) {
    return _then(_self.copyWith(package: value));
  });
}/// Create a copy of RealtimeEventModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DistributionCountryCopyWith<$Res>? get distributionCountry {
    if (_self.distributionCountry == null) {
    return null;
  }

  return $DistributionCountryCopyWith<$Res>(_self.distributionCountry!, (value) {
    return _then(_self.copyWith(distributionCountry: value));
  });
}
}


/// Adds pattern-matching-related methods to [RealtimeEventModel].
extension RealtimeEventModelPatterns on RealtimeEventModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RealtimeEventModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RealtimeEventModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RealtimeEventModel value)  $default,){
final _that = this;
switch (_that) {
case _RealtimeEventModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RealtimeEventModel value)?  $default,){
final _that = this;
switch (_that) {
case _RealtimeEventModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "order_num")  String? orderNum, @JsonKey(name: "name")  String? name, @JsonKey(name: "status")  bool? status, @JsonKey(name: "total_amount")  String? totalAmount, @JsonKey(name: "country_code")  String? countryCode, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "updated_at")  String? updatedAt, @JsonKey(name: "package")  PackageModel? package, @JsonKey(name: "distribution_country")  DistributionCountry? distributionCountry, @JsonKey(name: "changes")  Map<String, dynamic>? changes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RealtimeEventModel() when $default != null:
return $default(_that.id,_that.orderNum,_that.name,_that.status,_that.totalAmount,_that.countryCode,_that.createdAt,_that.updatedAt,_that.package,_that.distributionCountry,_that.changes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "order_num")  String? orderNum, @JsonKey(name: "name")  String? name, @JsonKey(name: "status")  bool? status, @JsonKey(name: "total_amount")  String? totalAmount, @JsonKey(name: "country_code")  String? countryCode, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "updated_at")  String? updatedAt, @JsonKey(name: "package")  PackageModel? package, @JsonKey(name: "distribution_country")  DistributionCountry? distributionCountry, @JsonKey(name: "changes")  Map<String, dynamic>? changes)  $default,) {final _that = this;
switch (_that) {
case _RealtimeEventModel():
return $default(_that.id,_that.orderNum,_that.name,_that.status,_that.totalAmount,_that.countryCode,_that.createdAt,_that.updatedAt,_that.package,_that.distributionCountry,_that.changes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "order_num")  String? orderNum, @JsonKey(name: "name")  String? name, @JsonKey(name: "status")  bool? status, @JsonKey(name: "total_amount")  String? totalAmount, @JsonKey(name: "country_code")  String? countryCode, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "updated_at")  String? updatedAt, @JsonKey(name: "package")  PackageModel? package, @JsonKey(name: "distribution_country")  DistributionCountry? distributionCountry, @JsonKey(name: "changes")  Map<String, dynamic>? changes)?  $default,) {final _that = this;
switch (_that) {
case _RealtimeEventModel() when $default != null:
return $default(_that.id,_that.orderNum,_that.name,_that.status,_that.totalAmount,_that.countryCode,_that.createdAt,_that.updatedAt,_that.package,_that.distributionCountry,_that.changes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RealtimeEventModel implements RealtimeEventModel {
  const _RealtimeEventModel({@JsonKey(name: "id") required this.id, @JsonKey(name: "order_num") required this.orderNum, @JsonKey(name: "name") required this.name, @JsonKey(name: "status") required this.status, @JsonKey(name: "total_amount") required this.totalAmount, @JsonKey(name: "country_code") required this.countryCode, @JsonKey(name: "created_at") required this.createdAt, @JsonKey(name: "updated_at") required this.updatedAt, @JsonKey(name: "package") required this.package, @JsonKey(name: "distribution_country") required this.distributionCountry, @JsonKey(name: "changes") required final  Map<String, dynamic>? changes}): _changes = changes;
  factory _RealtimeEventModel.fromJson(Map<String, dynamic> json) => _$RealtimeEventModelFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "order_num") final  String? orderNum;
@override@JsonKey(name: "name") final  String? name;
@override@JsonKey(name: "status") final  bool? status;
@override@JsonKey(name: "total_amount") final  String? totalAmount;
@override@JsonKey(name: "country_code") final  String? countryCode;
@override@JsonKey(name: "created_at") final  String? createdAt;
@override@JsonKey(name: "updated_at") final  String? updatedAt;
@override@JsonKey(name: "package") final  PackageModel? package;
@override@JsonKey(name: "distribution_country") final  DistributionCountry? distributionCountry;
 final  Map<String, dynamic>? _changes;
@override@JsonKey(name: "changes") Map<String, dynamic>? get changes {
  final value = _changes;
  if (value == null) return null;
  if (_changes is EqualUnmodifiableMapView) return _changes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of RealtimeEventModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RealtimeEventModelCopyWith<_RealtimeEventModel> get copyWith => __$RealtimeEventModelCopyWithImpl<_RealtimeEventModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RealtimeEventModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RealtimeEventModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderNum, orderNum) || other.orderNum == orderNum)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.package, package) || other.package == package)&&(identical(other.distributionCountry, distributionCountry) || other.distributionCountry == distributionCountry)&&const DeepCollectionEquality().equals(other._changes, _changes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderNum,name,status,totalAmount,countryCode,createdAt,updatedAt,package,distributionCountry,const DeepCollectionEquality().hash(_changes));

@override
String toString() {
  return 'RealtimeEventModel(id: $id, orderNum: $orderNum, name: $name, status: $status, totalAmount: $totalAmount, countryCode: $countryCode, createdAt: $createdAt, updatedAt: $updatedAt, package: $package, distributionCountry: $distributionCountry, changes: $changes)';
}


}

/// @nodoc
abstract mixin class _$RealtimeEventModelCopyWith<$Res> implements $RealtimeEventModelCopyWith<$Res> {
  factory _$RealtimeEventModelCopyWith(_RealtimeEventModel value, $Res Function(_RealtimeEventModel) _then) = __$RealtimeEventModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "order_num") String? orderNum,@JsonKey(name: "name") String? name,@JsonKey(name: "status") bool? status,@JsonKey(name: "total_amount") String? totalAmount,@JsonKey(name: "country_code") String? countryCode,@JsonKey(name: "created_at") String? createdAt,@JsonKey(name: "updated_at") String? updatedAt,@JsonKey(name: "package") PackageModel? package,@JsonKey(name: "distribution_country") DistributionCountry? distributionCountry,@JsonKey(name: "changes") Map<String, dynamic>? changes
});


@override $PackageModelCopyWith<$Res>? get package;@override $DistributionCountryCopyWith<$Res>? get distributionCountry;

}
/// @nodoc
class __$RealtimeEventModelCopyWithImpl<$Res>
    implements _$RealtimeEventModelCopyWith<$Res> {
  __$RealtimeEventModelCopyWithImpl(this._self, this._then);

  final _RealtimeEventModel _self;
  final $Res Function(_RealtimeEventModel) _then;

/// Create a copy of RealtimeEventModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? orderNum = freezed,Object? name = freezed,Object? status = freezed,Object? totalAmount = freezed,Object? countryCode = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? package = freezed,Object? distributionCountry = freezed,Object? changes = freezed,}) {
  return _then(_RealtimeEventModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,orderNum: freezed == orderNum ? _self.orderNum : orderNum // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,totalAmount: freezed == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as String?,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,package: freezed == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as PackageModel?,distributionCountry: freezed == distributionCountry ? _self.distributionCountry : distributionCountry // ignore: cast_nullable_to_non_nullable
as DistributionCountry?,changes: freezed == changes ? _self._changes : changes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of RealtimeEventModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PackageModelCopyWith<$Res>? get package {
    if (_self.package == null) {
    return null;
  }

  return $PackageModelCopyWith<$Res>(_self.package!, (value) {
    return _then(_self.copyWith(package: value));
  });
}/// Create a copy of RealtimeEventModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DistributionCountryCopyWith<$Res>? get distributionCountry {
    if (_self.distributionCountry == null) {
    return null;
  }

  return $DistributionCountryCopyWith<$Res>(_self.distributionCountry!, (value) {
    return _then(_self.copyWith(distributionCountry: value));
  });
}
}


/// @nodoc
mixin _$PackageModel {

@JsonKey(name: "id") int? get id;@JsonKey(name: "name") String? get name;
/// Create a copy of PackageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackageModelCopyWith<PackageModel> get copyWith => _$PackageModelCopyWithImpl<PackageModel>(this as PackageModel, _$identity);

  /// Serializes this PackageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'PackageModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $PackageModelCopyWith<$Res>  {
  factory $PackageModelCopyWith(PackageModel value, $Res Function(PackageModel) _then) = _$PackageModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "name") String? name
});




}
/// @nodoc
class _$PackageModelCopyWithImpl<$Res>
    implements $PackageModelCopyWith<$Res> {
  _$PackageModelCopyWithImpl(this._self, this._then);

  final PackageModel _self;
  final $Res Function(PackageModel) _then;

/// Create a copy of PackageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PackageModel].
extension PackageModelPatterns on PackageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PackageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PackageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PackageModel value)  $default,){
final _that = this;
switch (_that) {
case _PackageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PackageModel value)?  $default,){
final _that = this;
switch (_that) {
case _PackageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "name")  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PackageModel() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "name")  String? name)  $default,) {final _that = this;
switch (_that) {
case _PackageModel():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "name")  String? name)?  $default,) {final _that = this;
switch (_that) {
case _PackageModel() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PackageModel implements PackageModel {
  const _PackageModel({@JsonKey(name: "id") required this.id, @JsonKey(name: "name") required this.name});
  factory _PackageModel.fromJson(Map<String, dynamic> json) => _$PackageModelFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "name") final  String? name;

/// Create a copy of PackageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackageModelCopyWith<_PackageModel> get copyWith => __$PackageModelCopyWithImpl<_PackageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PackageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'PackageModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$PackageModelCopyWith<$Res> implements $PackageModelCopyWith<$Res> {
  factory _$PackageModelCopyWith(_PackageModel value, $Res Function(_PackageModel) _then) = __$PackageModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "name") String? name
});




}
/// @nodoc
class __$PackageModelCopyWithImpl<$Res>
    implements _$PackageModelCopyWith<$Res> {
  __$PackageModelCopyWithImpl(this._self, this._then);

  final _PackageModel _self;
  final $Res Function(_PackageModel) _then;

/// Create a copy of PackageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_PackageModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DistributionCountry {

@JsonKey(name: "id") int? get id;@JsonKey(name: "name") String? get name;
/// Create a copy of DistributionCountry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DistributionCountryCopyWith<DistributionCountry> get copyWith => _$DistributionCountryCopyWithImpl<DistributionCountry>(this as DistributionCountry, _$identity);

  /// Serializes this DistributionCountry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DistributionCountry&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'DistributionCountry(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $DistributionCountryCopyWith<$Res>  {
  factory $DistributionCountryCopyWith(DistributionCountry value, $Res Function(DistributionCountry) _then) = _$DistributionCountryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "name") String? name
});




}
/// @nodoc
class _$DistributionCountryCopyWithImpl<$Res>
    implements $DistributionCountryCopyWith<$Res> {
  _$DistributionCountryCopyWithImpl(this._self, this._then);

  final DistributionCountry _self;
  final $Res Function(DistributionCountry) _then;

/// Create a copy of DistributionCountry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DistributionCountry].
extension DistributionCountryPatterns on DistributionCountry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DistributionCountry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DistributionCountry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DistributionCountry value)  $default,){
final _that = this;
switch (_that) {
case _DistributionCountry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DistributionCountry value)?  $default,){
final _that = this;
switch (_that) {
case _DistributionCountry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "name")  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DistributionCountry() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "name")  String? name)  $default,) {final _that = this;
switch (_that) {
case _DistributionCountry():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "name")  String? name)?  $default,) {final _that = this;
switch (_that) {
case _DistributionCountry() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DistributionCountry implements DistributionCountry {
  const _DistributionCountry({@JsonKey(name: "id") required this.id, @JsonKey(name: "name") required this.name});
  factory _DistributionCountry.fromJson(Map<String, dynamic> json) => _$DistributionCountryFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "name") final  String? name;

/// Create a copy of DistributionCountry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DistributionCountryCopyWith<_DistributionCountry> get copyWith => __$DistributionCountryCopyWithImpl<_DistributionCountry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DistributionCountryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DistributionCountry&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'DistributionCountry(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$DistributionCountryCopyWith<$Res> implements $DistributionCountryCopyWith<$Res> {
  factory _$DistributionCountryCopyWith(_DistributionCountry value, $Res Function(_DistributionCountry) _then) = __$DistributionCountryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "name") String? name
});




}
/// @nodoc
class __$DistributionCountryCopyWithImpl<$Res>
    implements _$DistributionCountryCopyWith<$Res> {
  __$DistributionCountryCopyWithImpl(this._self, this._then);

  final _DistributionCountry _self;
  final $Res Function(_DistributionCountry) _then;

/// Create a copy of DistributionCountry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_DistributionCountry(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
