// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_number_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CarNumberModel _$CarNumberModelFromJson(Map<String, dynamic> json) {
  return _CarNumberModel.fromJson(json);
}

/// @nodoc
mixin _$CarNumberModel {
  int? get carId => throw _privateConstructorUsedError;
  String? get camera_name => throw _privateConstructorUsedError;
  String? get ocr => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  String? get imag => throw _privateConstructorUsedError;

  /// Serializes this CarNumberModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CarNumberModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarNumberModelCopyWith<CarNumberModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarNumberModelCopyWith<$Res> {
  factory $CarNumberModelCopyWith(
          CarNumberModel value, $Res Function(CarNumberModel) then) =
      _$CarNumberModelCopyWithImpl<$Res, CarNumberModel>;
  @useResult
  $Res call(
      {int? carId,
      String? camera_name,
      String? ocr,
      DateTime? date,
      String? imag});
}

/// @nodoc
class _$CarNumberModelCopyWithImpl<$Res, $Val extends CarNumberModel>
    implements $CarNumberModelCopyWith<$Res> {
  _$CarNumberModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarNumberModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carId = freezed,
    Object? camera_name = freezed,
    Object? ocr = freezed,
    Object? date = freezed,
    Object? imag = freezed,
  }) {
    return _then(_value.copyWith(
      carId: freezed == carId
          ? _value.carId
          : carId // ignore: cast_nullable_to_non_nullable
              as int?,
      camera_name: freezed == camera_name
          ? _value.camera_name
          : camera_name // ignore: cast_nullable_to_non_nullable
              as String?,
      ocr: freezed == ocr
          ? _value.ocr
          : ocr // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      imag: freezed == imag
          ? _value.imag
          : imag // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarNumberModelImplCopyWith<$Res>
    implements $CarNumberModelCopyWith<$Res> {
  factory _$$CarNumberModelImplCopyWith(_$CarNumberModelImpl value,
          $Res Function(_$CarNumberModelImpl) then) =
      __$$CarNumberModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? carId,
      String? camera_name,
      String? ocr,
      DateTime? date,
      String? imag});
}

/// @nodoc
class __$$CarNumberModelImplCopyWithImpl<$Res>
    extends _$CarNumberModelCopyWithImpl<$Res, _$CarNumberModelImpl>
    implements _$$CarNumberModelImplCopyWith<$Res> {
  __$$CarNumberModelImplCopyWithImpl(
      _$CarNumberModelImpl _value, $Res Function(_$CarNumberModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CarNumberModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carId = freezed,
    Object? camera_name = freezed,
    Object? ocr = freezed,
    Object? date = freezed,
    Object? imag = freezed,
  }) {
    return _then(_$CarNumberModelImpl(
      carId: freezed == carId
          ? _value.carId
          : carId // ignore: cast_nullable_to_non_nullable
              as int?,
      camera_name: freezed == camera_name
          ? _value.camera_name
          : camera_name // ignore: cast_nullable_to_non_nullable
              as String?,
      ocr: freezed == ocr
          ? _value.ocr
          : ocr // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      imag: freezed == imag
          ? _value.imag
          : imag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarNumberModelImpl implements _CarNumberModel {
  _$CarNumberModelImpl(
      {required this.carId,
      required this.camera_name,
      required this.ocr,
      required this.date,
      required this.imag});

  factory _$CarNumberModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarNumberModelImplFromJson(json);

  @override
  final int? carId;
  @override
  final String? camera_name;
  @override
  final String? ocr;
  @override
  final DateTime? date;
  @override
  final String? imag;

  @override
  String toString() {
    return 'CarNumberModel(carId: $carId, camera_name: $camera_name, ocr: $ocr, date: $date, imag: $imag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarNumberModelImpl &&
            (identical(other.carId, carId) || other.carId == carId) &&
            (identical(other.camera_name, camera_name) ||
                other.camera_name == camera_name) &&
            (identical(other.ocr, ocr) || other.ocr == ocr) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.imag, imag) || other.imag == imag));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, carId, camera_name, ocr, date, imag);

  /// Create a copy of CarNumberModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarNumberModelImplCopyWith<_$CarNumberModelImpl> get copyWith =>
      __$$CarNumberModelImplCopyWithImpl<_$CarNumberModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarNumberModelImplToJson(
      this,
    );
  }
}

abstract class _CarNumberModel implements CarNumberModel {
  factory _CarNumberModel(
      {required final int? carId,
      required final String? camera_name,
      required final String? ocr,
      required final DateTime? date,
      required final String? imag}) = _$CarNumberModelImpl;

  factory _CarNumberModel.fromJson(Map<String, dynamic> json) =
      _$CarNumberModelImpl.fromJson;

  @override
  int? get carId;
  @override
  String? get camera_name;
  @override
  String? get ocr;
  @override
  DateTime? get date;
  @override
  String? get imag;

  /// Create a copy of CarNumberModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarNumberModelImplCopyWith<_$CarNumberModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
