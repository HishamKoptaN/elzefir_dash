// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_upsert_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductUpsertEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductUpsertEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProductUpsertEvent()';
}


}

/// @nodoc
class $ProductUpsertEventCopyWith<$Res>  {
$ProductUpsertEventCopyWith(ProductUpsertEvent _, $Res Function(ProductUpsertEvent) __);
}


/// Adds pattern-matching-related methods to [ProductUpsertEvent].
extension ProductUpsertEventPatterns on ProductUpsertEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Upsert value)?  upsert,TResult Function( _Reset value)?  reset,TResult Function( _DataChanged value)?  dataChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Upsert() when upsert != null:
return upsert(_that);case _Reset() when reset != null:
return reset(_that);case _DataChanged() when dataChanged != null:
return dataChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Upsert value)  upsert,required TResult Function( _Reset value)  reset,required TResult Function( _DataChanged value)  dataChanged,}){
final _that = this;
switch (_that) {
case _Upsert():
return upsert(_that);case _Reset():
return reset(_that);case _DataChanged():
return dataChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Upsert value)?  upsert,TResult? Function( _Reset value)?  reset,TResult? Function( _DataChanged value)?  dataChanged,}){
final _that = this;
switch (_that) {
case _Upsert() when upsert != null:
return upsert(_that);case _Reset() when reset != null:
return reset(_that);case _DataChanged() when dataChanged != null:
return dataChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  upsert,TResult Function()?  reset,TResult Function( ProductUpsertReqEntity productUpsertReq)?  dataChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Upsert() when upsert != null:
return upsert();case _Reset() when reset != null:
return reset();case _DataChanged() when dataChanged != null:
return dataChanged(_that.productUpsertReq);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  upsert,required TResult Function()  reset,required TResult Function( ProductUpsertReqEntity productUpsertReq)  dataChanged,}) {final _that = this;
switch (_that) {
case _Upsert():
return upsert();case _Reset():
return reset();case _DataChanged():
return dataChanged(_that.productUpsertReq);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  upsert,TResult? Function()?  reset,TResult? Function( ProductUpsertReqEntity productUpsertReq)?  dataChanged,}) {final _that = this;
switch (_that) {
case _Upsert() when upsert != null:
return upsert();case _Reset() when reset != null:
return reset();case _DataChanged() when dataChanged != null:
return dataChanged(_that.productUpsertReq);case _:
  return null;

}
}

}

/// @nodoc


class _Upsert implements ProductUpsertEvent {
  const _Upsert();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Upsert);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProductUpsertEvent.upsert()';
}


}




/// @nodoc


class _Reset implements ProductUpsertEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProductUpsertEvent.reset()';
}


}




/// @nodoc


class _DataChanged implements ProductUpsertEvent {
  const _DataChanged({required this.productUpsertReq});
  

 final  ProductUpsertReqEntity productUpsertReq;

/// Create a copy of ProductUpsertEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataChangedCopyWith<_DataChanged> get copyWith => __$DataChangedCopyWithImpl<_DataChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DataChanged&&(identical(other.productUpsertReq, productUpsertReq) || other.productUpsertReq == productUpsertReq));
}


@override
int get hashCode {
    return Object.hash(runtimeType,productUpsertReq);
}

@override
String toString() {
    return 'ProductUpsertEvent.dataChanged(productUpsertReq: $productUpsertReq)';
}


}

/// @nodoc
abstract mixin class _$DataChangedCopyWith<$Res> implements $ProductUpsertEventCopyWith<$Res> {
  factory _$DataChangedCopyWith(_DataChanged value, $Res Function(_DataChanged) _then) = __$DataChangedCopyWithImpl;
@useResult
$Res call({
 ProductUpsertReqEntity productUpsertReq
});


$ProductUpsertReqEntityCopyWith<$Res> get productUpsertReq;

}
/// @nodoc
class __$DataChangedCopyWithImpl<$Res>
    implements _$DataChangedCopyWith<$Res> {
  __$DataChangedCopyWithImpl(this._self, this._then);

  final _DataChanged _self;
  final $Res Function(_DataChanged) _then;

/// Create a copy of ProductUpsertEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productUpsertReq = null,}) {
  return _then(_DataChanged(
productUpsertReq: null == productUpsertReq ? _self.productUpsertReq : productUpsertReq // ignore: cast_nullable_to_non_nullable
as ProductUpsertReqEntity,
  ));
}

/// Create a copy of ProductUpsertEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductUpsertReqEntityCopyWith<$Res> get productUpsertReq {
  
  return $ProductUpsertReqEntityCopyWith<$Res>(_self.productUpsertReq, (value) {
    return _then(_self.copyWith(productUpsertReq: value));
  });
}
}

/// @nodoc
mixin _$ProductUpsertState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductUpsertState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProductUpsertState()';
}


}

/// @nodoc
class $ProductUpsertStateCopyWith<$Res>  {
$ProductUpsertStateCopyWith(ProductUpsertState _, $Res Function(ProductUpsertState) __);
}


/// Adds pattern-matching-related methods to [ProductUpsertState].
extension ProductUpsertStatePatterns on ProductUpsertState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loaded value)?  loaded,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loaded value)  loaded,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loaded():
return loaded(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _Failure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( ProductUpsertReqEntity? productUpsertReq,  FormzSubmissionStatus formzSubmissionStatus)?  loaded,TResult Function()?  loading,TResult Function()?  success,TResult Function( ErrorInfo apiErrorModel)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loaded() when loaded != null:
return loaded(_that.productUpsertReq,_that.formzSubmissionStatus);case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success();case _Failure() when failure != null:
return failure(_that.apiErrorModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( ProductUpsertReqEntity? productUpsertReq,  FormzSubmissionStatus formzSubmissionStatus)  loaded,required TResult Function()  loading,required TResult Function()  success,required TResult Function( ErrorInfo apiErrorModel)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loaded():
return loaded(_that.productUpsertReq,_that.formzSubmissionStatus);case _Loading():
return loading();case _Success():
return success();case _Failure():
return failure(_that.apiErrorModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( ProductUpsertReqEntity? productUpsertReq,  FormzSubmissionStatus formzSubmissionStatus)?  loaded,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( ErrorInfo apiErrorModel)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loaded() when loaded != null:
return loaded(_that.productUpsertReq,_that.formzSubmissionStatus);case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success();case _Failure() when failure != null:
return failure(_that.apiErrorModel);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ProductUpsertState {
  const _Initial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProductUpsertState.initial()';
}


}




/// @nodoc


class _Loaded implements ProductUpsertState {
  const _Loaded({this.productUpsertReq, required this.formzSubmissionStatus});
  

 final  ProductUpsertReqEntity? productUpsertReq;
 final  FormzSubmissionStatus formzSubmissionStatus;

/// Create a copy of ProductUpsertState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.productUpsertReq, productUpsertReq) || other.productUpsertReq == productUpsertReq)&&(identical(other.formzSubmissionStatus, formzSubmissionStatus) || other.formzSubmissionStatus == formzSubmissionStatus));
}


@override
int get hashCode {
    return Object.hash(runtimeType,productUpsertReq,formzSubmissionStatus);
}

@override
String toString() {
    return 'ProductUpsertState.loaded(productUpsertReq: $productUpsertReq, formzSubmissionStatus: $formzSubmissionStatus)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $ProductUpsertStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 ProductUpsertReqEntity? productUpsertReq, FormzSubmissionStatus formzSubmissionStatus
});


$ProductUpsertReqEntityCopyWith<$Res>? get productUpsertReq;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of ProductUpsertState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productUpsertReq = freezed,Object? formzSubmissionStatus = null,}) {
  return _then(_Loaded(
productUpsertReq: freezed == productUpsertReq ? _self.productUpsertReq : productUpsertReq // ignore: cast_nullable_to_non_nullable
as ProductUpsertReqEntity?,formzSubmissionStatus: null == formzSubmissionStatus ? _self.formzSubmissionStatus : formzSubmissionStatus // ignore: cast_nullable_to_non_nullable
as FormzSubmissionStatus,
  ));
}

/// Create a copy of ProductUpsertState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductUpsertReqEntityCopyWith<$Res>? get productUpsertReq {
    if (_self.productUpsertReq == null) {
    return null;
  }

  return $ProductUpsertReqEntityCopyWith<$Res>(_self.productUpsertReq!, (value) {
    return _then(_self.copyWith(productUpsertReq: value));
  });
}
}

/// @nodoc


class _Loading implements ProductUpsertState {
  const _Loading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProductUpsertState.loading()';
}


}




/// @nodoc


class _Success implements ProductUpsertState {
  const _Success();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProductUpsertState.success()';
}


}




/// @nodoc


class _Failure implements ProductUpsertState {
  const _Failure({required this.apiErrorModel});
  

 final  ErrorInfo apiErrorModel;

/// Create a copy of ProductUpsertState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode {
    return Object.hash(runtimeType,apiErrorModel);
}

@override
String toString() {
    return 'ProductUpsertState.failure(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $ProductUpsertStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 ErrorInfo apiErrorModel
});


$ErrorInfoCopyWith<$Res> get apiErrorModel;

}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of ProductUpsertState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(_Failure(
apiErrorModel: null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ErrorInfo,
  ));
}

/// Create a copy of ProductUpsertState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorInfoCopyWith<$Res> get apiErrorModel {
  
  return $ErrorInfoCopyWith<$Res>(_self.apiErrorModel, (value) {
    return _then(_self.copyWith(apiErrorModel: value));
  });
}
}

// dart format on
