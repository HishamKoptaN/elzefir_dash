// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationsResEntity {

 List<NotificationEntity> get notifications; MetaEntity? get meta;
/// Create a copy of NotificationsResEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsResEntityCopyWith<NotificationsResEntity> get copyWith => _$NotificationsResEntityCopyWithImpl<NotificationsResEntity>(this as NotificationsResEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsResEntity&&const DeepCollectionEquality().equals(other.notifications, notifications)&&(identical(other.meta, meta) || other.meta == meta));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(notifications),meta);

@override
String toString() {
  return 'NotificationsResEntity(notifications: $notifications, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $NotificationsResEntityCopyWith<$Res>  {
  factory $NotificationsResEntityCopyWith(NotificationsResEntity value, $Res Function(NotificationsResEntity) _then) = _$NotificationsResEntityCopyWithImpl;
@useResult
$Res call({
 List<NotificationEntity> notifications, MetaEntity? meta
});




}
/// @nodoc
class _$NotificationsResEntityCopyWithImpl<$Res>
    implements $NotificationsResEntityCopyWith<$Res> {
  _$NotificationsResEntityCopyWithImpl(this._self, this._then);

  final NotificationsResEntity _self;
  final $Res Function(NotificationsResEntity) _then;

/// Create a copy of NotificationsResEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? notifications = null,Object? meta = freezed,}) {
  return _then(_self.copyWith(
notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<NotificationEntity>,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as MetaEntity?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationsResEntity].
extension NotificationsResEntityPatterns on NotificationsResEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationsResEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationsResEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationsResEntity value)  $default,){
final _that = this;
switch (_that) {
case _NotificationsResEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationsResEntity value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationsResEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<NotificationEntity> notifications,  MetaEntity? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationsResEntity() when $default != null:
return $default(_that.notifications,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<NotificationEntity> notifications,  MetaEntity? meta)  $default,) {final _that = this;
switch (_that) {
case _NotificationsResEntity():
return $default(_that.notifications,_that.meta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<NotificationEntity> notifications,  MetaEntity? meta)?  $default,) {final _that = this;
switch (_that) {
case _NotificationsResEntity() when $default != null:
return $default(_that.notifications,_that.meta);case _:
  return null;

}
}

}

/// @nodoc


class _NotificationsResEntity implements NotificationsResEntity {
  const _NotificationsResEntity({final  List<NotificationEntity> notifications = const [], this.meta}): _notifications = notifications;
  

 final  List<NotificationEntity> _notifications;
@override@JsonKey() List<NotificationEntity> get notifications {
  if (_notifications is EqualUnmodifiableListView) return _notifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notifications);
}

@override final  MetaEntity? meta;

/// Create a copy of NotificationsResEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationsResEntityCopyWith<_NotificationsResEntity> get copyWith => __$NotificationsResEntityCopyWithImpl<_NotificationsResEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationsResEntity&&const DeepCollectionEquality().equals(other._notifications, _notifications)&&(identical(other.meta, meta) || other.meta == meta));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notifications),meta);

@override
String toString() {
  return 'NotificationsResEntity(notifications: $notifications, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$NotificationsResEntityCopyWith<$Res> implements $NotificationsResEntityCopyWith<$Res> {
  factory _$NotificationsResEntityCopyWith(_NotificationsResEntity value, $Res Function(_NotificationsResEntity) _then) = __$NotificationsResEntityCopyWithImpl;
@override @useResult
$Res call({
 List<NotificationEntity> notifications, MetaEntity? meta
});




}
/// @nodoc
class __$NotificationsResEntityCopyWithImpl<$Res>
    implements _$NotificationsResEntityCopyWith<$Res> {
  __$NotificationsResEntityCopyWithImpl(this._self, this._then);

  final _NotificationsResEntity _self;
  final $Res Function(_NotificationsResEntity) _then;

/// Create a copy of NotificationsResEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notifications = null,Object? meta = freezed,}) {
  return _then(_NotificationsResEntity(
notifications: null == notifications ? _self._notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<NotificationEntity>,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as MetaEntity?,
  ));
}


}

/// @nodoc
mixin _$NotificationEntity {

 String get id; String get title; String get body; Map<String, dynamic> get data; String get targetUrl; String get createdAt; String get imageUrl; bool get read; NotificationType get type;
/// Create a copy of NotificationEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationEntityCopyWith<NotificationEntity> get copyWith => _$NotificationEntityCopyWithImpl<NotificationEntity>(this as NotificationEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.targetUrl, targetUrl) || other.targetUrl == targetUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.read, read) || other.read == read)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,body,const DeepCollectionEquality().hash(data),targetUrl,createdAt,imageUrl,read,type);

@override
String toString() {
  return 'NotificationEntity(id: $id, title: $title, body: $body, data: $data, targetUrl: $targetUrl, createdAt: $createdAt, imageUrl: $imageUrl, read: $read, type: $type)';
}


}

/// @nodoc
abstract mixin class $NotificationEntityCopyWith<$Res>  {
  factory $NotificationEntityCopyWith(NotificationEntity value, $Res Function(NotificationEntity) _then) = _$NotificationEntityCopyWithImpl;
@useResult
$Res call({
 String id, String title, String body, Map<String, dynamic> data, String targetUrl, String createdAt, String imageUrl, bool read, NotificationType type
});




}
/// @nodoc
class _$NotificationEntityCopyWithImpl<$Res>
    implements $NotificationEntityCopyWith<$Res> {
  _$NotificationEntityCopyWithImpl(this._self, this._then);

  final NotificationEntity _self;
  final $Res Function(NotificationEntity) _then;

/// Create a copy of NotificationEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? body = null,Object? data = null,Object? targetUrl = null,Object? createdAt = null,Object? imageUrl = null,Object? read = null,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,targetUrl: null == targetUrl ? _self.targetUrl : targetUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,read: null == read ? _self.read : read // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NotificationType,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationEntity].
extension NotificationEntityPatterns on NotificationEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationEntity value)  $default,){
final _that = this;
switch (_that) {
case _NotificationEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationEntity value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String body,  Map<String, dynamic> data,  String targetUrl,  String createdAt,  String imageUrl,  bool read,  NotificationType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationEntity() when $default != null:
return $default(_that.id,_that.title,_that.body,_that.data,_that.targetUrl,_that.createdAt,_that.imageUrl,_that.read,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String body,  Map<String, dynamic> data,  String targetUrl,  String createdAt,  String imageUrl,  bool read,  NotificationType type)  $default,) {final _that = this;
switch (_that) {
case _NotificationEntity():
return $default(_that.id,_that.title,_that.body,_that.data,_that.targetUrl,_that.createdAt,_that.imageUrl,_that.read,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String body,  Map<String, dynamic> data,  String targetUrl,  String createdAt,  String imageUrl,  bool read,  NotificationType type)?  $default,) {final _that = this;
switch (_that) {
case _NotificationEntity() when $default != null:
return $default(_that.id,_that.title,_that.body,_that.data,_that.targetUrl,_that.createdAt,_that.imageUrl,_that.read,_that.type);case _:
  return null;

}
}

}

/// @nodoc


class _NotificationEntity implements NotificationEntity {
  const _NotificationEntity({required this.id, this.title = '', this.body = '', final  Map<String, dynamic> data = const <String, dynamic>{}, this.targetUrl = '', this.createdAt = '', this.imageUrl = '', this.read = false, this.type = NotificationType.info}): _data = data;
  

@override final  String id;
@override@JsonKey() final  String title;
@override@JsonKey() final  String body;
 final  Map<String, dynamic> _data;
@override@JsonKey() Map<String, dynamic> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}

@override@JsonKey() final  String targetUrl;
@override@JsonKey() final  String createdAt;
@override@JsonKey() final  String imageUrl;
@override@JsonKey() final  bool read;
@override@JsonKey() final  NotificationType type;

/// Create a copy of NotificationEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationEntityCopyWith<_NotificationEntity> get copyWith => __$NotificationEntityCopyWithImpl<_NotificationEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.targetUrl, targetUrl) || other.targetUrl == targetUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.read, read) || other.read == read)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,body,const DeepCollectionEquality().hash(_data),targetUrl,createdAt,imageUrl,read,type);

@override
String toString() {
  return 'NotificationEntity(id: $id, title: $title, body: $body, data: $data, targetUrl: $targetUrl, createdAt: $createdAt, imageUrl: $imageUrl, read: $read, type: $type)';
}


}

/// @nodoc
abstract mixin class _$NotificationEntityCopyWith<$Res> implements $NotificationEntityCopyWith<$Res> {
  factory _$NotificationEntityCopyWith(_NotificationEntity value, $Res Function(_NotificationEntity) _then) = __$NotificationEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String body, Map<String, dynamic> data, String targetUrl, String createdAt, String imageUrl, bool read, NotificationType type
});




}
/// @nodoc
class __$NotificationEntityCopyWithImpl<$Res>
    implements _$NotificationEntityCopyWith<$Res> {
  __$NotificationEntityCopyWithImpl(this._self, this._then);

  final _NotificationEntity _self;
  final $Res Function(_NotificationEntity) _then;

/// Create a copy of NotificationEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? body = null,Object? data = null,Object? targetUrl = null,Object? createdAt = null,Object? imageUrl = null,Object? read = null,Object? type = null,}) {
  return _then(_NotificationEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,targetUrl: null == targetUrl ? _self.targetUrl : targetUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,read: null == read ? _self.read : read // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NotificationType,
  ));
}


}

// dart format on
