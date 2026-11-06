// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Check value)?  check,TResult Function( _authToken value)?  authToken,TResult Function( _SignedOut value)?  signedOut,TResult Function( _EmitAuthenticated value)?  emitAuthenticated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Check() when check != null:
return check(_that);case _authToken() when authToken != null:
return authToken(_that);case _SignedOut() when signedOut != null:
return signedOut(_that);case _EmitAuthenticated() when emitAuthenticated != null:
return emitAuthenticated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Check value)  check,required TResult Function( _authToken value)  authToken,required TResult Function( _SignedOut value)  signedOut,required TResult Function( _EmitAuthenticated value)  emitAuthenticated,}){
final _that = this;
switch (_that) {
case _Check():
return check(_that);case _authToken():
return authToken(_that);case _SignedOut():
return signedOut(_that);case _EmitAuthenticated():
return emitAuthenticated(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Check value)?  check,TResult? Function( _authToken value)?  authToken,TResult? Function( _SignedOut value)?  signedOut,TResult? Function( _EmitAuthenticated value)?  emitAuthenticated,}){
final _that = this;
switch (_that) {
case _Check() when check != null:
return check(_that);case _authToken() when authToken != null:
return authToken(_that);case _SignedOut() when signedOut != null:
return signedOut(_that);case _EmitAuthenticated() when emitAuthenticated != null:
return emitAuthenticated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Completer<void>? onComplete)?  check,TResult Function( Completer<void>? onComplete)?  authToken,TResult Function()?  signedOut,TResult Function()?  emitAuthenticated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Check() when check != null:
return check(_that.onComplete);case _authToken() when authToken != null:
return authToken(_that.onComplete);case _SignedOut() when signedOut != null:
return signedOut();case _EmitAuthenticated() when emitAuthenticated != null:
return emitAuthenticated();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Completer<void>? onComplete)  check,required TResult Function( Completer<void>? onComplete)  authToken,required TResult Function()  signedOut,required TResult Function()  emitAuthenticated,}) {final _that = this;
switch (_that) {
case _Check():
return check(_that.onComplete);case _authToken():
return authToken(_that.onComplete);case _SignedOut():
return signedOut();case _EmitAuthenticated():
return emitAuthenticated();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Completer<void>? onComplete)?  check,TResult? Function( Completer<void>? onComplete)?  authToken,TResult? Function()?  signedOut,TResult? Function()?  emitAuthenticated,}) {final _that = this;
switch (_that) {
case _Check() when check != null:
return check(_that.onComplete);case _authToken() when authToken != null:
return authToken(_that.onComplete);case _SignedOut() when signedOut != null:
return signedOut();case _EmitAuthenticated() when emitAuthenticated != null:
return emitAuthenticated();case _:
  return null;

}
}

}

/// @nodoc


class _Check implements AuthEvent {
  const _Check({this.onComplete});
  

 final  Completer<void>? onComplete;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckCopyWith<_Check> get copyWith => __$CheckCopyWithImpl<_Check>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Check&&(identical(other.onComplete, onComplete) || other.onComplete == onComplete));
}


@override
int get hashCode => Object.hash(runtimeType,onComplete);

@override
String toString() {
  return 'AuthEvent.check(onComplete: $onComplete)';
}


}

/// @nodoc
abstract mixin class _$CheckCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$CheckCopyWith(_Check value, $Res Function(_Check) _then) = __$CheckCopyWithImpl;
@useResult
$Res call({
 Completer<void>? onComplete
});




}
/// @nodoc
class __$CheckCopyWithImpl<$Res>
    implements _$CheckCopyWith<$Res> {
  __$CheckCopyWithImpl(this._self, this._then);

  final _Check _self;
  final $Res Function(_Check) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? onComplete = freezed,}) {
  return _then(_Check(
onComplete: freezed == onComplete ? _self.onComplete : onComplete // ignore: cast_nullable_to_non_nullable
as Completer<void>?,
  ));
}


}

/// @nodoc


class _authToken implements AuthEvent {
  const _authToken({this.onComplete});
  

 final  Completer<void>? onComplete;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$authTokenCopyWith<_authToken> get copyWith => __$authTokenCopyWithImpl<_authToken>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _authToken&&(identical(other.onComplete, onComplete) || other.onComplete == onComplete));
}


@override
int get hashCode => Object.hash(runtimeType,onComplete);

@override
String toString() {
  return 'AuthEvent.authToken(onComplete: $onComplete)';
}


}

/// @nodoc
abstract mixin class _$authTokenCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$authTokenCopyWith(_authToken value, $Res Function(_authToken) _then) = __$authTokenCopyWithImpl;
@useResult
$Res call({
 Completer<void>? onComplete
});




}
/// @nodoc
class __$authTokenCopyWithImpl<$Res>
    implements _$authTokenCopyWith<$Res> {
  __$authTokenCopyWithImpl(this._self, this._then);

  final _authToken _self;
  final $Res Function(_authToken) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? onComplete = freezed,}) {
  return _then(_authToken(
onComplete: freezed == onComplete ? _self.onComplete : onComplete // ignore: cast_nullable_to_non_nullable
as Completer<void>?,
  ));
}


}

/// @nodoc


class _SignedOut implements AuthEvent {
  const _SignedOut();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignedOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.signedOut()';
}


}




/// @nodoc


class _EmitAuthenticated implements AuthEvent {
  const _EmitAuthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmitAuthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.emitAuthenticated()';
}


}




/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _Loading value)?  loading,TResult Function( _Authenticated value)?  authenticated,TResult Function( _Unauthenticated value)?  unauthenticated,TResult Function( _Error value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Loading() when loading != null:
return loading(_that);case _Authenticated() when authenticated != null:
return authenticated(_that);case _Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _Error() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _Loading value)  loading,required TResult Function( _Authenticated value)  authenticated,required TResult Function( _Unauthenticated value)  unauthenticated,required TResult Function( _Error value)  failure,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _Loading():
return loading(_that);case _Authenticated():
return authenticated(_that);case _Unauthenticated():
return unauthenticated(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _Loading value)?  loading,TResult? Function( _Authenticated value)?  authenticated,TResult? Function( _Unauthenticated value)?  unauthenticated,TResult? Function( _Error value)?  failure,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Loading() when loading != null:
return loading(_that);case _Authenticated() when authenticated != null:
return authenticated(_that);case _Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _Error() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function()?  loading,TResult Function()?  authenticated,TResult Function()?  unauthenticated,TResult Function( ErrorInfo apiErrorModel)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _Loading() when loading != null:
return loading();case _Authenticated() when authenticated != null:
return authenticated();case _Unauthenticated() when unauthenticated != null:
return unauthenticated();case _Error() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function()  loading,required TResult Function()  authenticated,required TResult Function()  unauthenticated,required TResult Function( ErrorInfo apiErrorModel)  failure,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _Loading():
return loading();case _Authenticated():
return authenticated();case _Unauthenticated():
return unauthenticated();case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function()?  loading,TResult? Function()?  authenticated,TResult? Function()?  unauthenticated,TResult? Function( ErrorInfo apiErrorModel)?  failure,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _Loading() when loading != null:
return loading();case _Authenticated() when authenticated != null:
return authenticated();case _Unauthenticated() when unauthenticated != null:
return unauthenticated();case _Error() when failure != null:
return failure(_that.apiErrorModel);case _:
  return null;

}
}

}

/// @nodoc


class _Init implements AuthState {
  const _Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.init()';
}


}




/// @nodoc


class _Loading implements AuthState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loading()';
}


}




/// @nodoc


class _Authenticated implements AuthState {
  const _Authenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Authenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.authenticated()';
}


}




/// @nodoc


class _Unauthenticated implements AuthState {
  const _Unauthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.unauthenticated()';
}


}




/// @nodoc


class _Error implements AuthState {
  const _Error(this.apiErrorModel);
  

 final  ErrorInfo apiErrorModel;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'AuthState.failure(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 ErrorInfo apiErrorModel
});


$ErrorInfoCopyWith<$Res> get apiErrorModel;

}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(_Error(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ErrorInfo,
  ));
}

/// Create a copy of AuthState
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
