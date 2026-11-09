// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presigned_url_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PresignedUrlModel implements DiagnosticableTreeMixin {

@JsonKey(name: 'upload_url') String? get uploadUrl;@JsonKey(name: 'file_path') String? get filePath;@JsonKey(name: 'content_type') String? get contentType;/// Unix seconds after which [uploadUrl] stops accepting the file.
@JsonKey(name: 'expires_at') int? get expiresAt;/// Signature the upload endpoint expects for [filePath].
 String? get token;
/// Create a copy of PresignedUrlModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresignedUrlModelCopyWith<PresignedUrlModel> get copyWith => _$PresignedUrlModelCopyWithImpl<PresignedUrlModel>(this as PresignedUrlModel, _$identity);

  /// Serializes this PresignedUrlModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as PresignedUrlModel;
  properties
    ..add(DiagnosticsProperty('type', 'PresignedUrlModel'))
    ..add(DiagnosticsProperty('uploadUrl', _this.uploadUrl))..add(DiagnosticsProperty('filePath', _this.filePath))..add(DiagnosticsProperty('contentType', _this.contentType))..add(DiagnosticsProperty('expiresAt', _this.expiresAt))..add(DiagnosticsProperty('token', _this.token));
}

@override
bool operator ==(Object other) {
  final _this = this as PresignedUrlModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresignedUrlModel&&(identical(other.uploadUrl, _this.uploadUrl) || other.uploadUrl == _this.uploadUrl)&&(identical(other.filePath, _this.filePath) || other.filePath == _this.filePath)&&(identical(other.contentType, _this.contentType) || other.contentType == _this.contentType)&&(identical(other.expiresAt, _this.expiresAt) || other.expiresAt == _this.expiresAt)&&(identical(other.token, _this.token) || other.token == _this.token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PresignedUrlModel;
  return Object.hash(runtimeType,_this.uploadUrl,_this.filePath,_this.contentType,_this.expiresAt,_this.token);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as PresignedUrlModel;
  return 'PresignedUrlModel(uploadUrl: ${_this.uploadUrl}, filePath: ${_this.filePath}, contentType: ${_this.contentType}, expiresAt: ${_this.expiresAt}, token: ${_this.token})';
}


}

/// @nodoc
abstract mixin class $PresignedUrlModelCopyWith<$Res>  {
  factory $PresignedUrlModelCopyWith(PresignedUrlModel value, $Res Function(PresignedUrlModel) _then) = _$PresignedUrlModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'upload_url') String? uploadUrl,@JsonKey(name: 'file_path') String? filePath,@JsonKey(name: 'content_type') String? contentType,@JsonKey(name: 'expires_at') int? expiresAt, String? token
});




}
/// @nodoc
class _$PresignedUrlModelCopyWithImpl<$Res>
    implements $PresignedUrlModelCopyWith<$Res> {
  _$PresignedUrlModelCopyWithImpl(this._self, this._then);

  final PresignedUrlModel _self;
  final $Res Function(PresignedUrlModel) _then;

/// Create a copy of PresignedUrlModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uploadUrl = freezed,Object? filePath = freezed,Object? contentType = freezed,Object? expiresAt = freezed,Object? token = freezed,}) {
  return _then(PresignedUrlModel(
uploadUrl: freezed == uploadUrl ? _self.uploadUrl : uploadUrl // ignore: cast_nullable_to_non_nullable
as String?,filePath: freezed == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String?,contentType: freezed == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as int?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PresignedUrlModel].
extension PresignedUrlModelPatterns on PresignedUrlModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PresignedUrlModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PresignedUrlModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PresignedUrlModel value)  $default,){
final _that = this;
switch (_that) {
case _PresignedUrlModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PresignedUrlModel value)?  $default,){
final _that = this;
switch (_that) {
case _PresignedUrlModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'upload_url')  String? uploadUrl, @JsonKey(name: 'file_path')  String? filePath, @JsonKey(name: 'content_type')  String? contentType, @JsonKey(name: 'expires_at')  int? expiresAt,  String? token)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PresignedUrlModel() when $default != null:
return $default(_that.uploadUrl,_that.filePath,_that.contentType,_that.expiresAt,_that.token);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'upload_url')  String? uploadUrl, @JsonKey(name: 'file_path')  String? filePath, @JsonKey(name: 'content_type')  String? contentType, @JsonKey(name: 'expires_at')  int? expiresAt,  String? token)  $default,) {final _that = this;
switch (_that) {
case _PresignedUrlModel():
return $default(_that.uploadUrl,_that.filePath,_that.contentType,_that.expiresAt,_that.token);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'upload_url')  String? uploadUrl, @JsonKey(name: 'file_path')  String? filePath, @JsonKey(name: 'content_type')  String? contentType, @JsonKey(name: 'expires_at')  int? expiresAt,  String? token)?  $default,) {final _that = this;
switch (_that) {
case _PresignedUrlModel() when $default != null:
return $default(_that.uploadUrl,_that.filePath,_that.contentType,_that.expiresAt,_that.token);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PresignedUrlModel with DiagnosticableTreeMixin implements PresignedUrlModel {
  const _PresignedUrlModel({@JsonKey(name: 'upload_url') this.uploadUrl, @JsonKey(name: 'file_path') this.filePath, @JsonKey(name: 'content_type') this.contentType, @JsonKey(name: 'expires_at') this.expiresAt, this.token});
  factory _PresignedUrlModel.fromJson(Map<String, dynamic> json) => _$PresignedUrlModelFromJson(json);

@override@JsonKey(name: 'upload_url') final  String? uploadUrl;
@override@JsonKey(name: 'file_path') final  String? filePath;
@override@JsonKey(name: 'content_type') final  String? contentType;
/// Unix seconds after which [uploadUrl] stops accepting the file.
@override@JsonKey(name: 'expires_at') final  int? expiresAt;
/// Signature the upload endpoint expects for [filePath].
@override final  String? token;

/// Create a copy of PresignedUrlModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PresignedUrlModelCopyWith<_PresignedUrlModel> get copyWith => __$PresignedUrlModelCopyWithImpl<_PresignedUrlModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PresignedUrlModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'PresignedUrlModel'))
    ..add(DiagnosticsProperty('uploadUrl', uploadUrl))..add(DiagnosticsProperty('filePath', filePath))..add(DiagnosticsProperty('contentType', contentType))..add(DiagnosticsProperty('expiresAt', expiresAt))..add(DiagnosticsProperty('token', token));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PresignedUrlModel&&(identical(other.uploadUrl, uploadUrl) || other.uploadUrl == uploadUrl)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,uploadUrl,filePath,contentType,expiresAt,token);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'PresignedUrlModel(uploadUrl: $uploadUrl, filePath: $filePath, contentType: $contentType, expiresAt: $expiresAt, token: $token)';
}


}

/// @nodoc
abstract mixin class _$PresignedUrlModelCopyWith<$Res> implements $PresignedUrlModelCopyWith<$Res> {
  factory _$PresignedUrlModelCopyWith(_PresignedUrlModel value, $Res Function(_PresignedUrlModel) _then) = __$PresignedUrlModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'upload_url') String? uploadUrl,@JsonKey(name: 'file_path') String? filePath,@JsonKey(name: 'content_type') String? contentType,@JsonKey(name: 'expires_at') int? expiresAt, String? token
});




}
/// @nodoc
class __$PresignedUrlModelCopyWithImpl<$Res>
    implements _$PresignedUrlModelCopyWith<$Res> {
  __$PresignedUrlModelCopyWithImpl(this._self, this._then);

  final _PresignedUrlModel _self;
  final $Res Function(_PresignedUrlModel) _then;

/// Create a copy of PresignedUrlModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uploadUrl = freezed,Object? filePath = freezed,Object? contentType = freezed,Object? expiresAt = freezed,Object? token = freezed,}) {
  return _then(_PresignedUrlModel(
uploadUrl: freezed == uploadUrl ? _self.uploadUrl : uploadUrl // ignore: cast_nullable_to_non_nullable
as String?,filePath: freezed == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String?,contentType: freezed == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as int?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
