// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_cars_reponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetCarsResponse _$GetCarsResponseFromJson(Map<String, dynamic> json) {
  return _GetCarsResponse.fromJson(json);
}

/// @nodoc
mixin _$GetCarsResponse {
  String get message => throw _privateConstructorUsedError;
  CarNumberList get data => throw _privateConstructorUsedError;

  /// Serializes this GetCarsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetCarsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetCarsResponseCopyWith<GetCarsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCarsResponseCopyWith<$Res> {
  factory $GetCarsResponseCopyWith(
          GetCarsResponse value, $Res Function(GetCarsResponse) then) =
      _$GetCarsResponseCopyWithImpl<$Res, GetCarsResponse>;
  @useResult
  $Res call({String message, CarNumberList data});

  $CarNumberListCopyWith<$Res> get data;
}

/// @nodoc
class _$GetCarsResponseCopyWithImpl<$Res, $Val extends GetCarsResponse>
    implements $GetCarsResponseCopyWith<$Res> {
  _$GetCarsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetCarsResponse
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
              as CarNumberList,
    ) as $Val);
  }

  /// Create a copy of GetCarsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CarNumberListCopyWith<$Res> get data {
    return $CarNumberListCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetCarsResponseImplCopyWith<$Res>
    implements $GetCarsResponseCopyWith<$Res> {
  factory _$$GetCarsResponseImplCopyWith(_$GetCarsResponseImpl value,
          $Res Function(_$GetCarsResponseImpl) then) =
      __$$GetCarsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, CarNumberList data});

  @override
  $CarNumberListCopyWith<$Res> get data;
}

/// @nodoc
class __$$GetCarsResponseImplCopyWithImpl<$Res>
    extends _$GetCarsResponseCopyWithImpl<$Res, _$GetCarsResponseImpl>
    implements _$$GetCarsResponseImplCopyWith<$Res> {
  __$$GetCarsResponseImplCopyWithImpl(
      _$GetCarsResponseImpl _value, $Res Function(_$GetCarsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetCarsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$GetCarsResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CarNumberList,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetCarsResponseImpl implements _GetCarsResponse {
  _$GetCarsResponseImpl({required this.message, required this.data});

  factory _$GetCarsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetCarsResponseImplFromJson(json);

  @override
  final String message;
  @override
  final CarNumberList data;

  @override
  String toString() {
    return 'GetCarsResponse(message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCarsResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, data);

  /// Create a copy of GetCarsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCarsResponseImplCopyWith<_$GetCarsResponseImpl> get copyWith =>
      __$$GetCarsResponseImplCopyWithImpl<_$GetCarsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetCarsResponseImplToJson(
      this,
    );
  }
}

abstract class _GetCarsResponse implements GetCarsResponse {
  factory _GetCarsResponse(
      {required final String message,
      required final CarNumberList data}) = _$GetCarsResponseImpl;

  factory _GetCarsResponse.fromJson(Map<String, dynamic> json) =
      _$GetCarsResponseImpl.fromJson;

  @override
  String get message;
  @override
  CarNumberList get data;

  /// Create a copy of GetCarsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetCarsResponseImplCopyWith<_$GetCarsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
