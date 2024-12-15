// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_notification_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetNotificationResponse _$GetNotificationResponseFromJson(
    Map<String, dynamic> json) {
  return _GetNotificationResponse.fromJson(json);
}

/// @nodoc
mixin _$GetNotificationResponse {
  String get message => throw _privateConstructorUsedError;
  List<NotificationModel> get data => throw _privateConstructorUsedError;

  /// Serializes this GetNotificationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetNotificationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetNotificationResponseCopyWith<GetNotificationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetNotificationResponseCopyWith<$Res> {
  factory $GetNotificationResponseCopyWith(GetNotificationResponse value,
          $Res Function(GetNotificationResponse) then) =
      _$GetNotificationResponseCopyWithImpl<$Res, GetNotificationResponse>;
  @useResult
  $Res call({String message, List<NotificationModel> data});
}

/// @nodoc
class _$GetNotificationResponseCopyWithImpl<$Res,
        $Val extends GetNotificationResponse>
    implements $GetNotificationResponseCopyWith<$Res> {
  _$GetNotificationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetNotificationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetNotificationResponseImplCopyWith<$Res>
    implements $GetNotificationResponseCopyWith<$Res> {
  factory _$$GetNotificationResponseImplCopyWith(
          _$GetNotificationResponseImpl value,
          $Res Function(_$GetNotificationResponseImpl) then) =
      __$$GetNotificationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, List<NotificationModel> data});
}

/// @nodoc
class __$$GetNotificationResponseImplCopyWithImpl<$Res>
    extends _$GetNotificationResponseCopyWithImpl<$Res,
        _$GetNotificationResponseImpl>
    implements _$$GetNotificationResponseImplCopyWith<$Res> {
  __$$GetNotificationResponseImplCopyWithImpl(
      _$GetNotificationResponseImpl _value,
      $Res Function(_$GetNotificationResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetNotificationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$GetNotificationResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetNotificationResponseImpl implements _GetNotificationResponse {
  _$GetNotificationResponseImpl(
      {required this.message, required final List<NotificationModel> data})
      : _data = data;

  factory _$GetNotificationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetNotificationResponseImplFromJson(json);

  @override
  final String message;
  final List<NotificationModel> _data;
  @override
  List<NotificationModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'GetNotificationResponse(message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNotificationResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_data));

  /// Create a copy of GetNotificationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetNotificationResponseImplCopyWith<_$GetNotificationResponseImpl>
      get copyWith => __$$GetNotificationResponseImplCopyWithImpl<
          _$GetNotificationResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetNotificationResponseImplToJson(
      this,
    );
  }
}

abstract class _GetNotificationResponse implements GetNotificationResponse {
  factory _GetNotificationResponse(
          {required final String message,
          required final List<NotificationModel> data}) =
      _$GetNotificationResponseImpl;

  factory _GetNotificationResponse.fromJson(Map<String, dynamic> json) =
      _$GetNotificationResponseImpl.fromJson;

  @override
  String get message;
  @override
  List<NotificationModel> get data;

  /// Create a copy of GetNotificationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetNotificationResponseImplCopyWith<_$GetNotificationResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
