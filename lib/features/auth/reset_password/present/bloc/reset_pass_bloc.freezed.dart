// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_pass_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResetPassEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPassEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ResetPassEvent()';
}


}

/// @nodoc
class $ResetPassEventCopyWith<$Res>  {
$ResetPassEventCopyWith(ResetPassEvent _, $Res Function(ResetPassEvent) __);
}


/// Adds pattern-matching-related methods to [ResetPassEvent].
extension ResetPassEventPatterns on ResetPassEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _DataChanged value)?  dataChanged,TResult Function( _ResetPass value)?  resetPass,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DataChanged() when dataChanged != null:
return dataChanged(_that);case _ResetPass() when resetPass != null:
return resetPass(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _DataChanged value)  dataChanged,required TResult Function( _ResetPass value)  resetPass,}){
final _that = this;
switch (_that) {
case _DataChanged():
return dataChanged(_that);case _ResetPass():
return resetPass(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _DataChanged value)?  dataChanged,TResult? Function( _ResetPass value)?  resetPass,}){
final _that = this;
switch (_that) {
case _DataChanged() when dataChanged != null:
return dataChanged(_that);case _ResetPass() when resetPass != null:
return resetPass(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ResetPassEntity resetPassEntity)?  dataChanged,TResult Function()?  resetPass,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DataChanged() when dataChanged != null:
return dataChanged(_that.resetPassEntity);case _ResetPass() when resetPass != null:
return resetPass();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ResetPassEntity resetPassEntity)  dataChanged,required TResult Function()  resetPass,}) {final _that = this;
switch (_that) {
case _DataChanged():
return dataChanged(_that.resetPassEntity);case _ResetPass():
return resetPass();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ResetPassEntity resetPassEntity)?  dataChanged,TResult? Function()?  resetPass,}) {final _that = this;
switch (_that) {
case _DataChanged() when dataChanged != null:
return dataChanged(_that.resetPassEntity);case _ResetPass() when resetPass != null:
return resetPass();case _:
  return null;

}
}

}

/// @nodoc


class _DataChanged implements ResetPassEvent {
  const _DataChanged({required this.resetPassEntity});
  

 final  ResetPassEntity resetPassEntity;

/// Create a copy of ResetPassEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataChangedCopyWith<_DataChanged> get copyWith => __$DataChangedCopyWithImpl<_DataChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DataChanged&&(identical(other.resetPassEntity, resetPassEntity) || other.resetPassEntity == resetPassEntity));
}


@override
int get hashCode {
    return Object.hash(runtimeType,resetPassEntity);
}

@override
String toString() {
    return 'ResetPassEvent.dataChanged(resetPassEntity: $resetPassEntity)';
}


}

/// @nodoc
abstract mixin class _$DataChangedCopyWith<$Res> implements $ResetPassEventCopyWith<$Res> {
  factory _$DataChangedCopyWith(_DataChanged value, $Res Function(_DataChanged) _then) = __$DataChangedCopyWithImpl;
@useResult
$Res call({
 ResetPassEntity resetPassEntity
});


$ResetPassEntityCopyWith<$Res> get resetPassEntity;

}
/// @nodoc
class __$DataChangedCopyWithImpl<$Res>
    implements _$DataChangedCopyWith<$Res> {
  __$DataChangedCopyWithImpl(this._self, this._then);

  final _DataChanged _self;
  final $Res Function(_DataChanged) _then;

/// Create a copy of ResetPassEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? resetPassEntity = null,}) {
  return _then(_DataChanged(
resetPassEntity: null == resetPassEntity ? _self.resetPassEntity : resetPassEntity // ignore: cast_nullable_to_non_nullable
as ResetPassEntity,
  ));
}

/// Create a copy of ResetPassEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResetPassEntityCopyWith<$Res> get resetPassEntity {
  
  return $ResetPassEntityCopyWith<$Res>(_self.resetPassEntity, (value) {
    return _then(_self.copyWith(resetPassEntity: value));
  });
}
}

/// @nodoc


class _ResetPass implements ResetPassEvent {
  const _ResetPass();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetPass);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ResetPassEvent.resetPass()';
}


}




/// @nodoc
mixin _$ResetPassState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPassState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ResetPassState()';
}


}

/// @nodoc
class $ResetPassStateCopyWith<$Res>  {
$ResetPassStateCopyWith(ResetPassState _, $Res Function(ResetPassState) __);
}


/// Adds pattern-matching-related methods to [ResetPassState].
extension ResetPassStatePatterns on ResetPassState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ResetPassLoading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( ResetPassSuccess value)?  success,TResult Function( ResetPassFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ResetPassLoading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case ResetPassSuccess() when success != null:
return success(_that);case ResetPassFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ResetPassLoading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( ResetPassSuccess value)  success,required TResult Function( ResetPassFailure value)  failure,}){
final _that = this;
switch (_that) {
case ResetPassLoading():
return loading(_that);case _Loaded():
return loaded(_that);case ResetPassSuccess():
return success(_that);case ResetPassFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ResetPassLoading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( ResetPassSuccess value)?  success,TResult? Function( ResetPassFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ResetPassLoading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case ResetPassSuccess() when success != null:
return success(_that);case ResetPassFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( ResetPassEntity resetPassEntity,  FormzSubmissionStatus formzSubmissionStatus)?  loaded,TResult Function()?  success,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ResetPassLoading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.resetPassEntity,_that.formzSubmissionStatus);case ResetPassSuccess() when success != null:
return success();case ResetPassFailure() when failure != null:
return failure(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( ResetPassEntity resetPassEntity,  FormzSubmissionStatus formzSubmissionStatus)  loaded,required TResult Function()  success,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case ResetPassLoading():
return loading();case _Loaded():
return loaded(_that.resetPassEntity,_that.formzSubmissionStatus);case ResetPassSuccess():
return success();case ResetPassFailure():
return failure(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( ResetPassEntity resetPassEntity,  FormzSubmissionStatus formzSubmissionStatus)?  loaded,TResult? Function()?  success,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case ResetPassLoading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.resetPassEntity,_that.formzSubmissionStatus);case ResetPassSuccess() when success != null:
return success();case ResetPassFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class ResetPassLoading implements ResetPassState {
  const ResetPassLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPassLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ResetPassState.loading()';
}


}




/// @nodoc


class _Loaded implements ResetPassState {
  const _Loaded({required this.resetPassEntity, required this.formzSubmissionStatus});
  

 final  ResetPassEntity resetPassEntity;
 final  FormzSubmissionStatus formzSubmissionStatus;

/// Create a copy of ResetPassState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.resetPassEntity, resetPassEntity) || other.resetPassEntity == resetPassEntity)&&(identical(other.formzSubmissionStatus, formzSubmissionStatus) || other.formzSubmissionStatus == formzSubmissionStatus));
}


@override
int get hashCode {
    return Object.hash(runtimeType,resetPassEntity,formzSubmissionStatus);
}

@override
String toString() {
    return 'ResetPassState.loaded(resetPassEntity: $resetPassEntity, formzSubmissionStatus: $formzSubmissionStatus)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $ResetPassStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 ResetPassEntity resetPassEntity, FormzSubmissionStatus formzSubmissionStatus
});


$ResetPassEntityCopyWith<$Res> get resetPassEntity;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of ResetPassState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? resetPassEntity = null,Object? formzSubmissionStatus = null,}) {
  return _then(_Loaded(
resetPassEntity: null == resetPassEntity ? _self.resetPassEntity : resetPassEntity // ignore: cast_nullable_to_non_nullable
as ResetPassEntity,formzSubmissionStatus: null == formzSubmissionStatus ? _self.formzSubmissionStatus : formzSubmissionStatus // ignore: cast_nullable_to_non_nullable
as FormzSubmissionStatus,
  ));
}

/// Create a copy of ResetPassState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResetPassEntityCopyWith<$Res> get resetPassEntity {
  
  return $ResetPassEntityCopyWith<$Res>(_self.resetPassEntity, (value) {
    return _then(_self.copyWith(resetPassEntity: value));
  });
}
}

/// @nodoc


class ResetPassSuccess implements ResetPassState {
  const ResetPassSuccess();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPassSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ResetPassState.success()';
}


}




/// @nodoc


class ResetPassFailure implements ResetPassState {
  const ResetPassFailure(this.error);
  

 final  String error;

/// Create a copy of ResetPassState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPassFailureCopyWith<ResetPassFailure> get copyWith => _$ResetPassFailureCopyWithImpl<ResetPassFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPassFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error);
}

@override
String toString() {
    return 'ResetPassState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $ResetPassFailureCopyWith<$Res> implements $ResetPassStateCopyWith<$Res> {
  factory $ResetPassFailureCopyWith(ResetPassFailure value, $Res Function(ResetPassFailure) _then) = _$ResetPassFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$ResetPassFailureCopyWithImpl<$Res>
    implements $ResetPassFailureCopyWith<$Res> {
  _$ResetPassFailureCopyWithImpl(this._self, this._then);

  final ResetPassFailure _self;
  final $Res Function(ResetPassFailure) _then;

/// Create a copy of ResetPassState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ResetPassFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
