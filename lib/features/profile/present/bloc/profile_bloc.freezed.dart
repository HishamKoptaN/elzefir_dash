// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent()';
}


}

/// @nodoc
class $ProfileEventCopyWith<$Res>  {
$ProfileEventCopyWith(ProfileEvent _, $Res Function(ProfileEvent) __);
}


/// Adds pattern-matching-related methods to [ProfileEvent].
extension ProfileEventPatterns on ProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetProfile value)?  getProfile,TResult Function( _DataChanged value)?  dataChanged,TResult Function( _UpdateProfile value)?  updateProfile,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetProfile() when getProfile != null:
return getProfile(_that);case _DataChanged() when dataChanged != null:
return dataChanged(_that);case _UpdateProfile() when updateProfile != null:
return updateProfile(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetProfile value)  getProfile,required TResult Function( _DataChanged value)  dataChanged,required TResult Function( _UpdateProfile value)  updateProfile,}){
final _that = this;
switch (_that) {
case _GetProfile():
return getProfile(_that);case _DataChanged():
return dataChanged(_that);case _UpdateProfile():
return updateProfile(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetProfile value)?  getProfile,TResult? Function( _DataChanged value)?  dataChanged,TResult? Function( _UpdateProfile value)?  updateProfile,}){
final _that = this;
switch (_that) {
case _GetProfile() when getProfile != null:
return getProfile(_that);case _DataChanged() when dataChanged != null:
return dataChanged(_that);case _UpdateProfile() when updateProfile != null:
return updateProfile(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getProfile,TResult Function( ProfileEntity? updatedProfile)?  dataChanged,TResult Function()?  updateProfile,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetProfile() when getProfile != null:
return getProfile();case _DataChanged() when dataChanged != null:
return dataChanged(_that.updatedProfile);case _UpdateProfile() when updateProfile != null:
return updateProfile();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getProfile,required TResult Function( ProfileEntity? updatedProfile)  dataChanged,required TResult Function()  updateProfile,}) {final _that = this;
switch (_that) {
case _GetProfile():
return getProfile();case _DataChanged():
return dataChanged(_that.updatedProfile);case _UpdateProfile():
return updateProfile();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getProfile,TResult? Function( ProfileEntity? updatedProfile)?  dataChanged,TResult? Function()?  updateProfile,}) {final _that = this;
switch (_that) {
case _GetProfile() when getProfile != null:
return getProfile();case _DataChanged() when dataChanged != null:
return dataChanged(_that.updatedProfile);case _UpdateProfile() when updateProfile != null:
return updateProfile();case _:
  return null;

}
}

}

/// @nodoc


class _GetProfile implements ProfileEvent {
  const _GetProfile();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetProfile);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.getProfile()';
}


}




/// @nodoc


class _DataChanged implements ProfileEvent {
  const _DataChanged({required this.updatedProfile});
  

 final  ProfileEntity? updatedProfile;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataChangedCopyWith<_DataChanged> get copyWith => __$DataChangedCopyWithImpl<_DataChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DataChanged&&(identical(other.updatedProfile, updatedProfile) || other.updatedProfile == updatedProfile));
}


@override
int get hashCode => Object.hash(runtimeType,updatedProfile);

@override
String toString() {
  return 'ProfileEvent.dataChanged(updatedProfile: $updatedProfile)';
}


}

/// @nodoc
abstract mixin class _$DataChangedCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory _$DataChangedCopyWith(_DataChanged value, $Res Function(_DataChanged) _then) = __$DataChangedCopyWithImpl;
@useResult
$Res call({
 ProfileEntity? updatedProfile
});


$ProfileEntityCopyWith<$Res>? get updatedProfile;

}
/// @nodoc
class __$DataChangedCopyWithImpl<$Res>
    implements _$DataChangedCopyWith<$Res> {
  __$DataChangedCopyWithImpl(this._self, this._then);

  final _DataChanged _self;
  final $Res Function(_DataChanged) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? updatedProfile = freezed,}) {
  return _then(_DataChanged(
updatedProfile: freezed == updatedProfile ? _self.updatedProfile : updatedProfile // ignore: cast_nullable_to_non_nullable
as ProfileEntity?,
  ));
}

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileEntityCopyWith<$Res>? get updatedProfile {
    if (_self.updatedProfile == null) {
    return null;
  }

  return $ProfileEntityCopyWith<$Res>(_self.updatedProfile!, (value) {
    return _then(_self.copyWith(updatedProfile: value));
  });
}
}

/// @nodoc


class _UpdateProfile implements ProfileEvent {
  const _UpdateProfile();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProfile);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.updateProfile()';
}


}




/// @nodoc
mixin _$ProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState()';
}


}

/// @nodoc
class $ProfileStateCopyWith<$Res>  {
$ProfileStateCopyWith(ProfileState _, $Res Function(ProfileState) __);
}


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _ProfileLoading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Success value)?  success,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _ProfileLoading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Success() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _ProfileLoading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Success value)  success,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _ProfileLoading():
return loading(_that);case _Loaded():
return loaded(_that);case _Success():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _ProfileLoading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Success value)?  success,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _ProfileLoading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Success() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function()?  loading,TResult Function( ProfileEntity profile,  ProfileEntity? updatedProfile,  FormzSubmissionStatus formzSubmissionStatus,  bool isLoading)?  loaded,TResult Function()?  success,TResult Function( ErrorInfo apiErrorModel)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _ProfileLoading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.profile,_that.updatedProfile,_that.formzSubmissionStatus,_that.isLoading);case _Success() when success != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function()  loading,required TResult Function( ProfileEntity profile,  ProfileEntity? updatedProfile,  FormzSubmissionStatus formzSubmissionStatus,  bool isLoading)  loaded,required TResult Function()  success,required TResult Function( ErrorInfo apiErrorModel)  failure,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _ProfileLoading():
return loading();case _Loaded():
return loaded(_that.profile,_that.updatedProfile,_that.formzSubmissionStatus,_that.isLoading);case _Success():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function()?  loading,TResult? Function( ProfileEntity profile,  ProfileEntity? updatedProfile,  FormzSubmissionStatus formzSubmissionStatus,  bool isLoading)?  loaded,TResult? Function()?  success,TResult? Function( ErrorInfo apiErrorModel)?  failure,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _ProfileLoading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.profile,_that.updatedProfile,_that.formzSubmissionStatus,_that.isLoading);case _Success() when success != null:
return success();case _Failure() when failure != null:
return failure(_that.apiErrorModel);case _:
  return null;

}
}

}

/// @nodoc


class _Init implements ProfileState {
  const _Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.init()';
}


}




/// @nodoc


class _ProfileLoading implements ProfileState {
  const _ProfileLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.loading()';
}


}




/// @nodoc


class _Loaded implements ProfileState {
  const _Loaded({required this.profile, required this.updatedProfile, this.formzSubmissionStatus = FormzSubmissionStatus.initial, this.isLoading = false});
  

 final  ProfileEntity profile;
 final  ProfileEntity? updatedProfile;
@JsonKey() final  FormzSubmissionStatus formzSubmissionStatus;
@JsonKey() final  bool isLoading;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.updatedProfile, updatedProfile) || other.updatedProfile == updatedProfile)&&(identical(other.formzSubmissionStatus, formzSubmissionStatus) || other.formzSubmissionStatus == formzSubmissionStatus)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,profile,updatedProfile,formzSubmissionStatus,isLoading);

@override
String toString() {
  return 'ProfileState.loaded(profile: $profile, updatedProfile: $updatedProfile, formzSubmissionStatus: $formzSubmissionStatus, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 ProfileEntity profile, ProfileEntity? updatedProfile, FormzSubmissionStatus formzSubmissionStatus, bool isLoading
});


$ProfileEntityCopyWith<$Res> get profile;$ProfileEntityCopyWith<$Res>? get updatedProfile;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = null,Object? updatedProfile = freezed,Object? formzSubmissionStatus = null,Object? isLoading = null,}) {
  return _then(_Loaded(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ProfileEntity,updatedProfile: freezed == updatedProfile ? _self.updatedProfile : updatedProfile // ignore: cast_nullable_to_non_nullable
as ProfileEntity?,formzSubmissionStatus: null == formzSubmissionStatus ? _self.formzSubmissionStatus : formzSubmissionStatus // ignore: cast_nullable_to_non_nullable
as FormzSubmissionStatus,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileEntityCopyWith<$Res> get profile {
  
  return $ProfileEntityCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileEntityCopyWith<$Res>? get updatedProfile {
    if (_self.updatedProfile == null) {
    return null;
  }

  return $ProfileEntityCopyWith<$Res>(_self.updatedProfile!, (value) {
    return _then(_self.copyWith(updatedProfile: value));
  });
}
}

/// @nodoc


class _Success implements ProfileState {
  const _Success();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.success()';
}


}




/// @nodoc


class _Failure implements ProfileState {
  const _Failure({required this.apiErrorModel});
  

 final  ErrorInfo apiErrorModel;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'ProfileState.failure(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
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

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(_Failure(
apiErrorModel: null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ErrorInfo,
  ));
}

/// Create a copy of ProfileState
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
