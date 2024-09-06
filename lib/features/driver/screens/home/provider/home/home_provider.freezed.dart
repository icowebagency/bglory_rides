// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  DriverDashboardData get dashboardData => throw _privateConstructorUsedError;
  OtherDashboardData get otherData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({DriverDashboardData dashboardData, OtherDashboardData otherData});

  $OtherDashboardDataCopyWith<$Res> get otherData;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dashboardData = null,
    Object? otherData = null,
  }) {
    return _then(_value.copyWith(
      dashboardData: null == dashboardData
          ? _value.dashboardData
          : dashboardData // ignore: cast_nullable_to_non_nullable
              as DriverDashboardData,
      otherData: null == otherData
          ? _value.otherData
          : otherData // ignore: cast_nullable_to_non_nullable
              as OtherDashboardData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OtherDashboardDataCopyWith<$Res> get otherData {
    return $OtherDashboardDataCopyWith<$Res>(_value.otherData, (value) {
      return _then(_value.copyWith(otherData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DriverDashboardData dashboardData, OtherDashboardData otherData});

  @override
  $OtherDashboardDataCopyWith<$Res> get otherData;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dashboardData = null,
    Object? otherData = null,
  }) {
    return _then(_$HomeStateImpl(
      dashboardData: null == dashboardData
          ? _value.dashboardData
          : dashboardData // ignore: cast_nullable_to_non_nullable
              as DriverDashboardData,
      otherData: null == otherData
          ? _value.otherData
          : otherData // ignore: cast_nullable_to_non_nullable
              as OtherDashboardData,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  _$HomeStateImpl({required this.dashboardData, required this.otherData});

  @override
  final DriverDashboardData dashboardData;
  @override
  final OtherDashboardData otherData;

  @override
  String toString() {
    return 'HomeState(dashboardData: $dashboardData, otherData: $otherData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.dashboardData, dashboardData) ||
                other.dashboardData == dashboardData) &&
            (identical(other.otherData, otherData) ||
                other.otherData == otherData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dashboardData, otherData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  factory _HomeState(
      {required final DriverDashboardData dashboardData,
      required final OtherDashboardData otherData}) = _$HomeStateImpl;

  @override
  DriverDashboardData get dashboardData;
  @override
  OtherDashboardData get otherData;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OtherDashboardData {
  String get todaysDate => throw _privateConstructorUsedError;
  String get driverLocation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OtherDashboardDataCopyWith<OtherDashboardData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtherDashboardDataCopyWith<$Res> {
  factory $OtherDashboardDataCopyWith(
          OtherDashboardData value, $Res Function(OtherDashboardData) then) =
      _$OtherDashboardDataCopyWithImpl<$Res, OtherDashboardData>;
  @useResult
  $Res call({String todaysDate, String driverLocation});
}

/// @nodoc
class _$OtherDashboardDataCopyWithImpl<$Res, $Val extends OtherDashboardData>
    implements $OtherDashboardDataCopyWith<$Res> {
  _$OtherDashboardDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todaysDate = null,
    Object? driverLocation = null,
  }) {
    return _then(_value.copyWith(
      todaysDate: null == todaysDate
          ? _value.todaysDate
          : todaysDate // ignore: cast_nullable_to_non_nullable
              as String,
      driverLocation: null == driverLocation
          ? _value.driverLocation
          : driverLocation // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OtherDashboardDataImplCopyWith<$Res>
    implements $OtherDashboardDataCopyWith<$Res> {
  factory _$$OtherDashboardDataImplCopyWith(_$OtherDashboardDataImpl value,
          $Res Function(_$OtherDashboardDataImpl) then) =
      __$$OtherDashboardDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String todaysDate, String driverLocation});
}

/// @nodoc
class __$$OtherDashboardDataImplCopyWithImpl<$Res>
    extends _$OtherDashboardDataCopyWithImpl<$Res, _$OtherDashboardDataImpl>
    implements _$$OtherDashboardDataImplCopyWith<$Res> {
  __$$OtherDashboardDataImplCopyWithImpl(_$OtherDashboardDataImpl _value,
      $Res Function(_$OtherDashboardDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todaysDate = null,
    Object? driverLocation = null,
  }) {
    return _then(_$OtherDashboardDataImpl(
      todaysDate: null == todaysDate
          ? _value.todaysDate
          : todaysDate // ignore: cast_nullable_to_non_nullable
              as String,
      driverLocation: null == driverLocation
          ? _value.driverLocation
          : driverLocation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OtherDashboardDataImpl implements _OtherDashboardData {
  _$OtherDashboardDataImpl(
      {required this.todaysDate, required this.driverLocation});

  @override
  final String todaysDate;
  @override
  final String driverLocation;

  @override
  String toString() {
    return 'OtherDashboardData(todaysDate: $todaysDate, driverLocation: $driverLocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtherDashboardDataImpl &&
            (identical(other.todaysDate, todaysDate) ||
                other.todaysDate == todaysDate) &&
            (identical(other.driverLocation, driverLocation) ||
                other.driverLocation == driverLocation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todaysDate, driverLocation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OtherDashboardDataImplCopyWith<_$OtherDashboardDataImpl> get copyWith =>
      __$$OtherDashboardDataImplCopyWithImpl<_$OtherDashboardDataImpl>(
          this, _$identity);
}

abstract class _OtherDashboardData implements OtherDashboardData {
  factory _OtherDashboardData(
      {required final String todaysDate,
      required final String driverLocation}) = _$OtherDashboardDataImpl;

  @override
  String get todaysDate;
  @override
  String get driverLocation;
  @override
  @JsonKey(ignore: true)
  _$$OtherDashboardDataImplCopyWith<_$OtherDashboardDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
