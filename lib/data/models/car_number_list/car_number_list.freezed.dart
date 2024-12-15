// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_number_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CarNumberList _$CarNumberListFromJson(Map<String, dynamic> json) {
  return _CarNumberList.fromJson(json);
}

/// @nodoc
mixin _$CarNumberList {
  List<String> get camerasName => throw _privateConstructorUsedError;
  List<String> get feedBacks => throw _privateConstructorUsedError;
  List<CarNumberModel> get lPRs => throw _privateConstructorUsedError;
  int get notificationCount => throw _privateConstructorUsedError;

  /// Serializes this CarNumberList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CarNumberList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarNumberListCopyWith<CarNumberList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarNumberListCopyWith<$Res> {
  factory $CarNumberListCopyWith(
          CarNumberList value, $Res Function(CarNumberList) then) =
      _$CarNumberListCopyWithImpl<$Res, CarNumberList>;
  @useResult
  $Res call(
      {List<String> camerasName,
      List<String> feedBacks,
      List<CarNumberModel> lPRs,
      int notificationCount});
}

/// @nodoc
class _$CarNumberListCopyWithImpl<$Res, $Val extends CarNumberList>
    implements $CarNumberListCopyWith<$Res> {
  _$CarNumberListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarNumberList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? camerasName = null,
    Object? feedBacks = null,
    Object? lPRs = null,
    Object? notificationCount = null,
  }) {
    return _then(_value.copyWith(
      camerasName: null == camerasName
          ? _value.camerasName
          : camerasName // ignore: cast_nullable_to_non_nullable
              as List<String>,
      feedBacks: null == feedBacks
          ? _value.feedBacks
          : feedBacks // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lPRs: null == lPRs
          ? _value.lPRs
          : lPRs // ignore: cast_nullable_to_non_nullable
              as List<CarNumberModel>,
      notificationCount: null == notificationCount
          ? _value.notificationCount
          : notificationCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarNumberListImplCopyWith<$Res>
    implements $CarNumberListCopyWith<$Res> {
  factory _$$CarNumberListImplCopyWith(
          _$CarNumberListImpl value, $Res Function(_$CarNumberListImpl) then) =
      __$$CarNumberListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> camerasName,
      List<String> feedBacks,
      List<CarNumberModel> lPRs,
      int notificationCount});
}

/// @nodoc
class __$$CarNumberListImplCopyWithImpl<$Res>
    extends _$CarNumberListCopyWithImpl<$Res, _$CarNumberListImpl>
    implements _$$CarNumberListImplCopyWith<$Res> {
  __$$CarNumberListImplCopyWithImpl(
      _$CarNumberListImpl _value, $Res Function(_$CarNumberListImpl) _then)
      : super(_value, _then);

  /// Create a copy of CarNumberList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? camerasName = null,
    Object? feedBacks = null,
    Object? lPRs = null,
    Object? notificationCount = null,
  }) {
    return _then(_$CarNumberListImpl(
      camerasName: null == camerasName
          ? _value._camerasName
          : camerasName // ignore: cast_nullable_to_non_nullable
              as List<String>,
      feedBacks: null == feedBacks
          ? _value._feedBacks
          : feedBacks // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lPRs: null == lPRs
          ? _value._lPRs
          : lPRs // ignore: cast_nullable_to_non_nullable
              as List<CarNumberModel>,
      notificationCount: null == notificationCount
          ? _value.notificationCount
          : notificationCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarNumberListImpl implements _CarNumberList {
  _$CarNumberListImpl(
      {required final List<String> camerasName,
      required final List<String> feedBacks,
      required final List<CarNumberModel> lPRs,
      required this.notificationCount})
      : _camerasName = camerasName,
        _feedBacks = feedBacks,
        _lPRs = lPRs;

  factory _$CarNumberListImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarNumberListImplFromJson(json);

  final List<String> _camerasName;
  @override
  List<String> get camerasName {
    if (_camerasName is EqualUnmodifiableListView) return _camerasName;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_camerasName);
  }

  final List<String> _feedBacks;
  @override
  List<String> get feedBacks {
    if (_feedBacks is EqualUnmodifiableListView) return _feedBacks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_feedBacks);
  }

  final List<CarNumberModel> _lPRs;
  @override
  List<CarNumberModel> get lPRs {
    if (_lPRs is EqualUnmodifiableListView) return _lPRs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lPRs);
  }

  @override
  final int notificationCount;

  @override
  String toString() {
    return 'CarNumberList(camerasName: $camerasName, feedBacks: $feedBacks, lPRs: $lPRs, notificationCount: $notificationCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarNumberListImpl &&
            const DeepCollectionEquality()
                .equals(other._camerasName, _camerasName) &&
            const DeepCollectionEquality()
                .equals(other._feedBacks, _feedBacks) &&
            const DeepCollectionEquality().equals(other._lPRs, _lPRs) &&
            (identical(other.notificationCount, notificationCount) ||
                other.notificationCount == notificationCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_camerasName),
      const DeepCollectionEquality().hash(_feedBacks),
      const DeepCollectionEquality().hash(_lPRs),
      notificationCount);

  /// Create a copy of CarNumberList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarNumberListImplCopyWith<_$CarNumberListImpl> get copyWith =>
      __$$CarNumberListImplCopyWithImpl<_$CarNumberListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarNumberListImplToJson(
      this,
    );
  }
}

abstract class _CarNumberList implements CarNumberList {
  factory _CarNumberList(
      {required final List<String> camerasName,
      required final List<String> feedBacks,
      required final List<CarNumberModel> lPRs,
      required final int notificationCount}) = _$CarNumberListImpl;

  factory _CarNumberList.fromJson(Map<String, dynamic> json) =
      _$CarNumberListImpl.fromJson;

  @override
  List<String> get camerasName;
  @override
  List<String> get feedBacks;
  @override
  List<CarNumberModel> get lPRs;
  @override
  int get notificationCount;

  /// Create a copy of CarNumberList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarNumberListImplCopyWith<_$CarNumberListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
