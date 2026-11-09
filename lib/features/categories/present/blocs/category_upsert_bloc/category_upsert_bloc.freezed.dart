// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_upsert_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryUpsertEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryUpsertEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CategoryUpsertEvent()';
}


}

/// @nodoc
class $CategoryUpsertEventCopyWith<$Res>  {
$CategoryUpsertEventCopyWith(CategoryUpsertEvent _, $Res Function(CategoryUpsertEvent) __);
}


/// Adds pattern-matching-related methods to [CategoryUpsertEvent].
extension CategoryUpsertEventPatterns on CategoryUpsertEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Upsert value)?  upsert,TResult Function( _DataChanged value)?  dataChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Upsert() when upsert != null:
return upsert(_that);case _DataChanged() when dataChanged != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Upsert value)  upsert,required TResult Function( _DataChanged value)  dataChanged,}){
final _that = this;
switch (_that) {
case _Upsert():
return upsert(_that);case _DataChanged():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Upsert value)?  upsert,TResult? Function( _DataChanged value)?  dataChanged,}){
final _that = this;
switch (_that) {
case _Upsert() when upsert != null:
return upsert(_that);case _DataChanged() when dataChanged != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  upsert,TResult Function( CategoryUpsertReqEntity categoryUpsertReq)?  dataChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Upsert() when upsert != null:
return upsert();case _DataChanged() when dataChanged != null:
return dataChanged(_that.categoryUpsertReq);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  upsert,required TResult Function( CategoryUpsertReqEntity categoryUpsertReq)  dataChanged,}) {final _that = this;
switch (_that) {
case _Upsert():
return upsert();case _DataChanged():
return dataChanged(_that.categoryUpsertReq);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  upsert,TResult? Function( CategoryUpsertReqEntity categoryUpsertReq)?  dataChanged,}) {final _that = this;
switch (_that) {
case _Upsert() when upsert != null:
return upsert();case _DataChanged() when dataChanged != null:
return dataChanged(_that.categoryUpsertReq);case _:
  return null;

}
}

}

/// @nodoc


class _Upsert implements CategoryUpsertEvent {
  const _Upsert();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Upsert);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CategoryUpsertEvent.upsert()';
}


}




/// @nodoc


class _DataChanged implements CategoryUpsertEvent {
  const _DataChanged({required this.categoryUpsertReq});
  

 final  CategoryUpsertReqEntity categoryUpsertReq;

/// Create a copy of CategoryUpsertEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataChangedCopyWith<_DataChanged> get copyWith => __$DataChangedCopyWithImpl<_DataChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DataChanged&&(identical(other.categoryUpsertReq, categoryUpsertReq) || other.categoryUpsertReq == categoryUpsertReq));
}


@override
int get hashCode {
    return Object.hash(runtimeType,categoryUpsertReq);
}

@override
String toString() {
    return 'CategoryUpsertEvent.dataChanged(categoryUpsertReq: $categoryUpsertReq)';
}


}

/// @nodoc
abstract mixin class _$DataChangedCopyWith<$Res> implements $CategoryUpsertEventCopyWith<$Res> {
  factory _$DataChangedCopyWith(_DataChanged value, $Res Function(_DataChanged) _then) = __$DataChangedCopyWithImpl;
@useResult
$Res call({
 CategoryUpsertReqEntity categoryUpsertReq
});


$CategoryUpsertReqEntityCopyWith<$Res> get categoryUpsertReq;

}
/// @nodoc
class __$DataChangedCopyWithImpl<$Res>
    implements _$DataChangedCopyWith<$Res> {
  __$DataChangedCopyWithImpl(this._self, this._then);

  final _DataChanged _self;
  final $Res Function(_DataChanged) _then;

/// Create a copy of CategoryUpsertEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryUpsertReq = null,}) {
  return _then(_DataChanged(
categoryUpsertReq: null == categoryUpsertReq ? _self.categoryUpsertReq : categoryUpsertReq // ignore: cast_nullable_to_non_nullable
as CategoryUpsertReqEntity,
  ));
}

/// Create a copy of CategoryUpsertEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryUpsertReqEntityCopyWith<$Res> get categoryUpsertReq {
  
  return $CategoryUpsertReqEntityCopyWith<$Res>(_self.categoryUpsertReq, (value) {
    return _then(_self.copyWith(categoryUpsertReq: value));
  });
}
}

/// @nodoc
mixin _$CategoryUpsertState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryUpsertState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CategoryUpsertState()';
}


}

/// @nodoc
class $CategoryUpsertStateCopyWith<$Res>  {
$CategoryUpsertStateCopyWith(CategoryUpsertState _, $Res Function(CategoryUpsertState) __);
}


/// Adds pattern-matching-related methods to [CategoryUpsertState].
extension CategoryUpsertStatePatterns on CategoryUpsertState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( CategoryUpsertReqEntity? categoryUpsertReq,  FormzSubmissionStatus formzSubmissionStatus)?  loaded,TResult Function()?  loading,TResult Function()?  success,TResult Function( ErrorInfo apiErrorModel)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loaded() when loaded != null:
return loaded(_that.categoryUpsertReq,_that.formzSubmissionStatus);case _Loading() when loading != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( CategoryUpsertReqEntity? categoryUpsertReq,  FormzSubmissionStatus formzSubmissionStatus)  loaded,required TResult Function()  loading,required TResult Function()  success,required TResult Function( ErrorInfo apiErrorModel)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loaded():
return loaded(_that.categoryUpsertReq,_that.formzSubmissionStatus);case _Loading():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( CategoryUpsertReqEntity? categoryUpsertReq,  FormzSubmissionStatus formzSubmissionStatus)?  loaded,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( ErrorInfo apiErrorModel)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loaded() when loaded != null:
return loaded(_that.categoryUpsertReq,_that.formzSubmissionStatus);case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success();case _Failure() when failure != null:
return failure(_that.apiErrorModel);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CategoryUpsertState {
  const _Initial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CategoryUpsertState.initial()';
}


}




/// @nodoc


class _Loaded implements CategoryUpsertState {
  const _Loaded({this.categoryUpsertReq, required this.formzSubmissionStatus});
  

 final  CategoryUpsertReqEntity? categoryUpsertReq;
 final  FormzSubmissionStatus formzSubmissionStatus;

/// Create a copy of CategoryUpsertState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.categoryUpsertReq, categoryUpsertReq) || other.categoryUpsertReq == categoryUpsertReq)&&(identical(other.formzSubmissionStatus, formzSubmissionStatus) || other.formzSubmissionStatus == formzSubmissionStatus));
}


@override
int get hashCode {
    return Object.hash(runtimeType,categoryUpsertReq,formzSubmissionStatus);
}

@override
String toString() {
    return 'CategoryUpsertState.loaded(categoryUpsertReq: $categoryUpsertReq, formzSubmissionStatus: $formzSubmissionStatus)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $CategoryUpsertStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 CategoryUpsertReqEntity? categoryUpsertReq, FormzSubmissionStatus formzSubmissionStatus
});


$CategoryUpsertReqEntityCopyWith<$Res>? get categoryUpsertReq;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of CategoryUpsertState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryUpsertReq = freezed,Object? formzSubmissionStatus = null,}) {
  return _then(_Loaded(
categoryUpsertReq: freezed == categoryUpsertReq ? _self.categoryUpsertReq : categoryUpsertReq // ignore: cast_nullable_to_non_nullable
as CategoryUpsertReqEntity?,formzSubmissionStatus: null == formzSubmissionStatus ? _self.formzSubmissionStatus : formzSubmissionStatus // ignore: cast_nullable_to_non_nullable
as FormzSubmissionStatus,
  ));
}

/// Create a copy of CategoryUpsertState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryUpsertReqEntityCopyWith<$Res>? get categoryUpsertReq {
    if (_self.categoryUpsertReq == null) {
    return null;
  }

  return $CategoryUpsertReqEntityCopyWith<$Res>(_self.categoryUpsertReq!, (value) {
    return _then(_self.copyWith(categoryUpsertReq: value));
  });
}
}

/// @nodoc


class _Loading implements CategoryUpsertState {
  const _Loading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CategoryUpsertState.loading()';
}


}




/// @nodoc


class _Success implements CategoryUpsertState {
  const _Success();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CategoryUpsertState.success()';
}


}




/// @nodoc


class _Failure implements CategoryUpsertState {
  const _Failure({required this.apiErrorModel});
  

 final  ErrorInfo apiErrorModel;

/// Create a copy of CategoryUpsertState
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
    return 'CategoryUpsertState.failure(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $CategoryUpsertStateCopyWith<$Res> {
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

/// Create a copy of CategoryUpsertState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(_Failure(
apiErrorModel: null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ErrorInfo,
  ));
}

/// Create a copy of CategoryUpsertState
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
