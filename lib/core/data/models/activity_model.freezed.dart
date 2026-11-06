// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivityModel {

@JsonKey(name: "type") String? get type;@JsonKey(name: "action") String? get action;@JsonKey(name: "id") int? get id;@JsonKey(name: "title") String? get title;@JsonKey(name: "description") String? get description;@JsonKey(name: "data") Map<String, dynamic>? get data;@JsonKey(name: "timestamp") String? get timestamp;@JsonKey(name: "created_at") String? get createdAt;@JsonKey(name: "icon") String? get icon;@JsonKey(name: "color") String? get color;
/// Create a copy of ActivityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityModelCopyWith<ActivityModel> get copyWith => _$ActivityModelCopyWithImpl<ActivityModel>(this as ActivityModel, _$identity);

  /// Serializes this ActivityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityModel&&(identical(other.type, type) || other.type == type)&&(identical(other.action, action) || other.action == action)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,action,id,title,description,const DeepCollectionEquality().hash(data),timestamp,createdAt,icon,color);

@override
String toString() {
  return 'ActivityModel(type: $type, action: $action, id: $id, title: $title, description: $description, data: $data, timestamp: $timestamp, createdAt: $createdAt, icon: $icon, color: $color)';
}


}

/// @nodoc
abstract mixin class $ActivityModelCopyWith<$Res>  {
  factory $ActivityModelCopyWith(ActivityModel value, $Res Function(ActivityModel) _then) = _$ActivityModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "type") String? type,@JsonKey(name: "action") String? action,@JsonKey(name: "id") int? id,@JsonKey(name: "title") String? title,@JsonKey(name: "description") String? description,@JsonKey(name: "data") Map<String, dynamic>? data,@JsonKey(name: "timestamp") String? timestamp,@JsonKey(name: "created_at") String? createdAt,@JsonKey(name: "icon") String? icon,@JsonKey(name: "color") String? color
});




}
/// @nodoc
class _$ActivityModelCopyWithImpl<$Res>
    implements $ActivityModelCopyWith<$Res> {
  _$ActivityModelCopyWithImpl(this._self, this._then);

  final ActivityModel _self;
  final $Res Function(ActivityModel) _then;

/// Create a copy of ActivityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = freezed,Object? action = freezed,Object? id = freezed,Object? title = freezed,Object? description = freezed,Object? data = freezed,Object? timestamp = freezed,Object? createdAt = freezed,Object? icon = freezed,Object? color = freezed,}) {
  return _then(_self.copyWith(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ActivityModel].
extension ActivityModelPatterns on ActivityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivityModel value)  $default,){
final _that = this;
switch (_that) {
case _ActivityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivityModel value)?  $default,){
final _that = this;
switch (_that) {
case _ActivityModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "type")  String? type, @JsonKey(name: "action")  String? action, @JsonKey(name: "id")  int? id, @JsonKey(name: "title")  String? title, @JsonKey(name: "description")  String? description, @JsonKey(name: "data")  Map<String, dynamic>? data, @JsonKey(name: "timestamp")  String? timestamp, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "icon")  String? icon, @JsonKey(name: "color")  String? color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivityModel() when $default != null:
return $default(_that.type,_that.action,_that.id,_that.title,_that.description,_that.data,_that.timestamp,_that.createdAt,_that.icon,_that.color);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "type")  String? type, @JsonKey(name: "action")  String? action, @JsonKey(name: "id")  int? id, @JsonKey(name: "title")  String? title, @JsonKey(name: "description")  String? description, @JsonKey(name: "data")  Map<String, dynamic>? data, @JsonKey(name: "timestamp")  String? timestamp, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "icon")  String? icon, @JsonKey(name: "color")  String? color)  $default,) {final _that = this;
switch (_that) {
case _ActivityModel():
return $default(_that.type,_that.action,_that.id,_that.title,_that.description,_that.data,_that.timestamp,_that.createdAt,_that.icon,_that.color);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "type")  String? type, @JsonKey(name: "action")  String? action, @JsonKey(name: "id")  int? id, @JsonKey(name: "title")  String? title, @JsonKey(name: "description")  String? description, @JsonKey(name: "data")  Map<String, dynamic>? data, @JsonKey(name: "timestamp")  String? timestamp, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "icon")  String? icon, @JsonKey(name: "color")  String? color)?  $default,) {final _that = this;
switch (_that) {
case _ActivityModel() when $default != null:
return $default(_that.type,_that.action,_that.id,_that.title,_that.description,_that.data,_that.timestamp,_that.createdAt,_that.icon,_that.color);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActivityModel implements ActivityModel {
  const _ActivityModel({@JsonKey(name: "type") required this.type, @JsonKey(name: "action") required this.action, @JsonKey(name: "id") required this.id, @JsonKey(name: "title") required this.title, @JsonKey(name: "description") required this.description, @JsonKey(name: "data") required final  Map<String, dynamic>? data, @JsonKey(name: "timestamp") required this.timestamp, @JsonKey(name: "created_at") required this.createdAt, @JsonKey(name: "icon") required this.icon, @JsonKey(name: "color") required this.color}): _data = data;
  factory _ActivityModel.fromJson(Map<String, dynamic> json) => _$ActivityModelFromJson(json);

@override@JsonKey(name: "type") final  String? type;
@override@JsonKey(name: "action") final  String? action;
@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "title") final  String? title;
@override@JsonKey(name: "description") final  String? description;
 final  Map<String, dynamic>? _data;
@override@JsonKey(name: "data") Map<String, dynamic>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: "timestamp") final  String? timestamp;
@override@JsonKey(name: "created_at") final  String? createdAt;
@override@JsonKey(name: "icon") final  String? icon;
@override@JsonKey(name: "color") final  String? color;

/// Create a copy of ActivityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityModelCopyWith<_ActivityModel> get copyWith => __$ActivityModelCopyWithImpl<_ActivityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActivityModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivityModel&&(identical(other.type, type) || other.type == type)&&(identical(other.action, action) || other.action == action)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,action,id,title,description,const DeepCollectionEquality().hash(_data),timestamp,createdAt,icon,color);

@override
String toString() {
  return 'ActivityModel(type: $type, action: $action, id: $id, title: $title, description: $description, data: $data, timestamp: $timestamp, createdAt: $createdAt, icon: $icon, color: $color)';
}


}

/// @nodoc
abstract mixin class _$ActivityModelCopyWith<$Res> implements $ActivityModelCopyWith<$Res> {
  factory _$ActivityModelCopyWith(_ActivityModel value, $Res Function(_ActivityModel) _then) = __$ActivityModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "type") String? type,@JsonKey(name: "action") String? action,@JsonKey(name: "id") int? id,@JsonKey(name: "title") String? title,@JsonKey(name: "description") String? description,@JsonKey(name: "data") Map<String, dynamic>? data,@JsonKey(name: "timestamp") String? timestamp,@JsonKey(name: "created_at") String? createdAt,@JsonKey(name: "icon") String? icon,@JsonKey(name: "color") String? color
});




}
/// @nodoc
class __$ActivityModelCopyWithImpl<$Res>
    implements _$ActivityModelCopyWith<$Res> {
  __$ActivityModelCopyWithImpl(this._self, this._then);

  final _ActivityModel _self;
  final $Res Function(_ActivityModel) _then;

/// Create a copy of ActivityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? action = freezed,Object? id = freezed,Object? title = freezed,Object? description = freezed,Object? data = freezed,Object? timestamp = freezed,Object? createdAt = freezed,Object? icon = freezed,Object? color = freezed,}) {
  return _then(_ActivityModel(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
