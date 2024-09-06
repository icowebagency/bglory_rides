// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'earnings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DriverEarningState {
  double get currentBalance => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DriverEarningStateCopyWith<DriverEarningState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverEarningStateCopyWith<$Res> {
  factory $DriverEarningStateCopyWith(
          DriverEarningState value, $Res Function(DriverEarningState) then) =
      _$DriverEarningStateCopyWithImpl<$Res, DriverEarningState>;
  @useResult
  $Res call({double currentBalance, bool isLoading});
}

/// @nodoc
class _$DriverEarningStateCopyWithImpl<$Res, $Val extends DriverEarningState>
    implements $DriverEarningStateCopyWith<$Res> {
  _$DriverEarningStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentBalance = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      currentBalance: null == currentBalance
          ? _value.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as double,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DriverEarningStateImplCopyWith<$Res>
    implements $DriverEarningStateCopyWith<$Res> {
  factory _$$DriverEarningStateImplCopyWith(_$DriverEarningStateImpl value,
          $Res Function(_$DriverEarningStateImpl) then) =
      __$$DriverEarningStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double currentBalance, bool isLoading});
}

/// @nodoc
class __$$DriverEarningStateImplCopyWithImpl<$Res>
    extends _$DriverEarningStateCopyWithImpl<$Res, _$DriverEarningStateImpl>
    implements _$$DriverEarningStateImplCopyWith<$Res> {
  __$$DriverEarningStateImplCopyWithImpl(_$DriverEarningStateImpl _value,
      $Res Function(_$DriverEarningStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentBalance = null,
    Object? isLoading = null,
  }) {
    return _then(_$DriverEarningStateImpl(
      currentBalance: null == currentBalance
          ? _value.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as double,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DriverEarningStateImpl implements _DriverEarningState {
  const _$DriverEarningStateImpl(
      {this.currentBalance = 0.0, this.isLoading = false});

  @override
  @JsonKey()
  final double currentBalance;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'DriverEarningState(currentBalance: $currentBalance, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverEarningStateImpl &&
            (identical(other.currentBalance, currentBalance) ||
                other.currentBalance == currentBalance) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentBalance, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverEarningStateImplCopyWith<_$DriverEarningStateImpl> get copyWith =>
      __$$DriverEarningStateImplCopyWithImpl<_$DriverEarningStateImpl>(
          this, _$identity);
}

abstract class _DriverEarningState implements DriverEarningState {
  const factory _DriverEarningState(
      {final double currentBalance,
      final bool isLoading}) = _$DriverEarningStateImpl;

  @override
  double get currentBalance;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$DriverEarningStateImplCopyWith<_$DriverEarningStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
