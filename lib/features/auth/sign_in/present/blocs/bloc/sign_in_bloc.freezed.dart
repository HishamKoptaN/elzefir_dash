// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignInEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SignInEvent()';
}


}

/// @nodoc
class $SignInEventCopyWith<$Res>  {
$SignInEventCopyWith(SignInEvent _, $Res Function(SignInEvent) __);
}


/// Adds pattern-matching-related methods to [SignInEvent].
extension SignInEventPatterns on SignInEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _DataChanged value)?  dataChanged,TResult Function( _SignIn value)?  signIn,TResult Function( _Verify value)?  verify,TResult Function( _SignInWithPhoneNumber value)?  signInWithPhoneNumber,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DataChanged() when dataChanged != null:
return dataChanged(_that);case _SignIn() when signIn != null:
return signIn(_that);case _Verify() when verify != null:
return verify(_that);case _SignInWithPhoneNumber() when signInWithPhoneNumber != null:
return signInWithPhoneNumber(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _DataChanged value)  dataChanged,required TResult Function( _SignIn value)  signIn,required TResult Function( _Verify value)  verify,required TResult Function( _SignInWithPhoneNumber value)  signInWithPhoneNumber,}){
final _that = this;
switch (_that) {
case _DataChanged():
return dataChanged(_that);case _SignIn():
return signIn(_that);case _Verify():
return verify(_that);case _SignInWithPhoneNumber():
return signInWithPhoneNumber(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _DataChanged value)?  dataChanged,TResult? Function( _SignIn value)?  signIn,TResult? Function( _Verify value)?  verify,TResult? Function( _SignInWithPhoneNumber value)?  signInWithPhoneNumber,}){
final _that = this;
switch (_that) {
case _DataChanged() when dataChanged != null:
return dataChanged(_that);case _SignIn() when signIn != null:
return signIn(_that);case _Verify() when verify != null:
return verify(_that);case _SignInWithPhoneNumber() when signInWithPhoneNumber != null:
return signInWithPhoneNumber(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( SignInReqEntity signIn)?  dataChanged,TResult Function()?  signIn,TResult Function()?  verify,TResult Function()?  signInWithPhoneNumber,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DataChanged() when dataChanged != null:
return dataChanged(_that.signIn);case _SignIn() when signIn != null:
return signIn();case _Verify() when verify != null:
return verify();case _SignInWithPhoneNumber() when signInWithPhoneNumber != null:
return signInWithPhoneNumber();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( SignInReqEntity signIn)  dataChanged,required TResult Function()  signIn,required TResult Function()  verify,required TResult Function()  signInWithPhoneNumber,}) {final _that = this;
switch (_that) {
case _DataChanged():
return dataChanged(_that.signIn);case _SignIn():
return signIn();case _Verify():
return verify();case _SignInWithPhoneNumber():
return signInWithPhoneNumber();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( SignInReqEntity signIn)?  dataChanged,TResult? Function()?  signIn,TResult? Function()?  verify,TResult? Function()?  signInWithPhoneNumber,}) {final _that = this;
switch (_that) {
case _DataChanged() when dataChanged != null:
return dataChanged(_that.signIn);case _SignIn() when signIn != null:
return signIn();case _Verify() when verify != null:
return verify();case _SignInWithPhoneNumber() when signInWithPhoneNumber != null:
return signInWithPhoneNumber();case _:
  return null;

}
}

}

/// @nodoc


class _DataChanged implements SignInEvent {
  const _DataChanged({required this.signIn});
  

 final  SignInReqEntity signIn;

/// Create a copy of SignInEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataChangedCopyWith<_DataChanged> get copyWith => __$DataChangedCopyWithImpl<_DataChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DataChanged&&(identical(other.signIn, signIn) || other.signIn == signIn));
}


@override
int get hashCode {
    return Object.hash(runtimeType,signIn);
}

@override
String toString() {
    return 'SignInEvent.dataChanged(signIn: $signIn)';
}


}

/// @nodoc
abstract mixin class _$DataChangedCopyWith<$Res> implements $SignInEventCopyWith<$Res> {
  factory _$DataChangedCopyWith(_DataChanged value, $Res Function(_DataChanged) _then) = __$DataChangedCopyWithImpl;
@useResult
$Res call({
 SignInReqEntity signIn
});


$SignInReqEntityCopyWith<$Res> get signIn;

}
/// @nodoc
class __$DataChangedCopyWithImpl<$Res>
    implements _$DataChangedCopyWith<$Res> {
  __$DataChangedCopyWithImpl(this._self, this._then);

  final _DataChanged _self;
  final $Res Function(_DataChanged) _then;

/// Create a copy of SignInEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? signIn = null,}) {
  return _then(_DataChanged(
signIn: null == signIn ? _self.signIn : signIn // ignore: cast_nullable_to_non_nullable
as SignInReqEntity,
  ));
}

/// Create a copy of SignInEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SignInReqEntityCopyWith<$Res> get signIn {
  
  return $SignInReqEntityCopyWith<$Res>(_self.signIn, (value) {
    return _then(_self.copyWith(signIn: value));
  });
}
}

/// @nodoc


class _SignIn implements SignInEvent {
  const _SignIn();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignIn);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SignInEvent.signIn()';
}


}




/// @nodoc


class _Verify implements SignInEvent {
  const _Verify();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Verify);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SignInEvent.verify()';
}


}




/// @nodoc


class _SignInWithPhoneNumber implements SignInEvent {
  const _SignInWithPhoneNumber();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignInWithPhoneNumber);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SignInEvent.signInWithPhoneNumber()';
}


}




/// @nodoc
mixin _$SignInState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SignInState()';
}


}

/// @nodoc
class $SignInStateCopyWith<$Res>  {
$SignInStateCopyWith(SignInState _, $Res Function(SignInState) __);
}


/// Adds pattern-matching-related methods to [SignInState].
extension SignInStatePatterns on SignInState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Success value)?  success,TResult Function( _Failure value)?  failure,TResult Function( _Unauthenticated value)?  unauthenticated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Success value)  success,required TResult Function( _Failure value)  failure,required TResult Function( _Unauthenticated value)  unauthenticated,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Success():
return success(_that);case _Failure():
return failure(_that);case _Unauthenticated():
return unauthenticated(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Success value)?  success,TResult? Function( _Failure value)?  failure,TResult? Function( _Unauthenticated value)?  unauthenticated,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( SignInReqEntity signIn,  FormzSubmissionStatus formzSubmissionStatus)?  loaded,TResult Function()?  success,TResult Function( ErrorInfo apiError)?  failure,TResult Function()?  unauthenticated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.signIn,_that.formzSubmissionStatus);case _Success() when success != null:
return success();case _Failure() when failure != null:
return failure(_that.apiError);case _Unauthenticated() when unauthenticated != null:
return unauthenticated();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( SignInReqEntity signIn,  FormzSubmissionStatus formzSubmissionStatus)  loaded,required TResult Function()  success,required TResult Function( ErrorInfo apiError)  failure,required TResult Function()  unauthenticated,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.signIn,_that.formzSubmissionStatus);case _Success():
return success();case _Failure():
return failure(_that.apiError);case _Unauthenticated():
return unauthenticated();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( SignInReqEntity signIn,  FormzSubmissionStatus formzSubmissionStatus)?  loaded,TResult? Function()?  success,TResult? Function( ErrorInfo apiError)?  failure,TResult? Function()?  unauthenticated,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.signIn,_that.formzSubmissionStatus);case _Success() when success != null:
return success();case _Failure() when failure != null:
return failure(_that.apiError);case _Unauthenticated() when unauthenticated != null:
return unauthenticated();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SignInState {
  const _Initial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SignInState.initial()';
}


}




/// @nodoc


class _Loading implements SignInState {
  const _Loading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SignInState.loading()';
}


}




/// @nodoc


class _Loaded implements SignInState {
  const _Loaded({required this.signIn, required this.formzSubmissionStatus});
  

 final  SignInReqEntity signIn;
 final  FormzSubmissionStatus formzSubmissionStatus;

/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.signIn, signIn) || other.signIn == signIn)&&(identical(other.formzSubmissionStatus, formzSubmissionStatus) || other.formzSubmissionStatus == formzSubmissionStatus));
}


@override
int get hashCode {
    return Object.hash(runtimeType,signIn,formzSubmissionStatus);
}

@override
String toString() {
    return 'SignInState.loaded(signIn: $signIn, formzSubmissionStatus: $formzSubmissionStatus)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $SignInStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 SignInReqEntity signIn, FormzSubmissionStatus formzSubmissionStatus
});


$SignInReqEntityCopyWith<$Res> get signIn;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? signIn = null,Object? formzSubmissionStatus = null,}) {
  return _then(_Loaded(
signIn: null == signIn ? _self.signIn : signIn // ignore: cast_nullable_to_non_nullable
as SignInReqEntity,formzSubmissionStatus: null == formzSubmissionStatus ? _self.formzSubmissionStatus : formzSubmissionStatus // ignore: cast_nullable_to_non_nullable
as FormzSubmissionStatus,
  ));
}

/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SignInReqEntityCopyWith<$Res> get signIn {
  
  return $SignInReqEntityCopyWith<$Res>(_self.signIn, (value) {
    return _then(_self.copyWith(signIn: value));
  });
}
}

/// @nodoc


class _Success implements SignInState {
  const _Success();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SignInState.success()';
}


}




/// @nodoc


class _Failure implements SignInState {
  const _Failure({required this.apiError});
  

 final  ErrorInfo apiError;

/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.apiError, apiError) || other.apiError == apiError));
}


@override
int get hashCode {
    return Object.hash(runtimeType,apiError);
}

@override
String toString() {
    return 'SignInState.failure(apiError: $apiError)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $SignInStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 ErrorInfo apiError
});


$ErrorInfoCopyWith<$Res> get apiError;

}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiError = null,}) {
  return _then(_Failure(
apiError: null == apiError ? _self.apiError : apiError // ignore: cast_nullable_to_non_nullable
as ErrorInfo,
  ));
}

/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorInfoCopyWith<$Res> get apiError {
  
  return $ErrorInfoCopyWith<$Res>(_self.apiError, (value) {
    return _then(_self.copyWith(apiError: value));
  });
}
}

/// @nodoc


class _Unauthenticated implements SignInState {
  const _Unauthenticated();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SignInState.unauthenticated()';
}


}




// dart format on
