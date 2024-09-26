// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DriverInfoState {
  DriverResponse? get driverData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DriverInfoStateCopyWith<DriverInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverInfoStateCopyWith<$Res> {
  factory $DriverInfoStateCopyWith(
          DriverInfoState value, $Res Function(DriverInfoState) then) =
      _$DriverInfoStateCopyWithImpl<$Res, DriverInfoState>;
  @useResult
  $Res call({DriverResponse? driverData});
}

/// @nodoc
class _$DriverInfoStateCopyWithImpl<$Res, $Val extends DriverInfoState>
    implements $DriverInfoStateCopyWith<$Res> {
  _$DriverInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverData = freezed,
  }) {
    return _then(_value.copyWith(
      driverData: freezed == driverData
          ? _value.driverData
          : driverData // ignore: cast_nullable_to_non_nullable
              as DriverResponse?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DriverInfoStateImplCopyWith<$Res>
    implements $DriverInfoStateCopyWith<$Res> {
  factory _$$DriverInfoStateImplCopyWith(_$DriverInfoStateImpl value,
          $Res Function(_$DriverInfoStateImpl) then) =
      __$$DriverInfoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DriverResponse? driverData});
}

/// @nodoc
class __$$DriverInfoStateImplCopyWithImpl<$Res>
    extends _$DriverInfoStateCopyWithImpl<$Res, _$DriverInfoStateImpl>
    implements _$$DriverInfoStateImplCopyWith<$Res> {
  __$$DriverInfoStateImplCopyWithImpl(
      _$DriverInfoStateImpl _value, $Res Function(_$DriverInfoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverData = freezed,
  }) {
    return _then(_$DriverInfoStateImpl(
      driverData: freezed == driverData
          ? _value.driverData
          : driverData // ignore: cast_nullable_to_non_nullable
              as DriverResponse?,
    ));
  }
}

/// @nodoc

class _$DriverInfoStateImpl implements _DriverInfoState {
  const _$DriverInfoStateImpl({this.driverData});

  @override
  final DriverResponse? driverData;

  @override
  String toString() {
    return 'DriverInfoState(driverData: $driverData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverInfoStateImpl &&
            (identical(other.driverData, driverData) ||
                other.driverData == driverData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, driverData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverInfoStateImplCopyWith<_$DriverInfoStateImpl> get copyWith =>
      __$$DriverInfoStateImplCopyWithImpl<_$DriverInfoStateImpl>(
          this, _$identity);
}

abstract class _DriverInfoState implements DriverInfoState {
  const factory _DriverInfoState({final DriverResponse? driverData}) =
      _$DriverInfoStateImpl;

  @override
  DriverResponse? get driverData;
  @override
  @JsonKey(ignore: true)
  _$$DriverInfoStateImplCopyWith<_$DriverInfoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
