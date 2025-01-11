// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'withdrawal_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WithdrawalState {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WithdrawalStateCopyWith<WithdrawalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WithdrawalStateCopyWith<$Res> {
  factory $WithdrawalStateCopyWith(
          WithdrawalState value, $Res Function(WithdrawalState) then) =
      _$WithdrawalStateCopyWithImpl<$Res, WithdrawalState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$WithdrawalStateCopyWithImpl<$Res, $Val extends WithdrawalState>
    implements $WithdrawalStateCopyWith<$Res> {
  _$WithdrawalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WithdrawalStateImplCopyWith<$Res>
    implements $WithdrawalStateCopyWith<$Res> {
  factory _$$WithdrawalStateImplCopyWith(_$WithdrawalStateImpl value,
          $Res Function(_$WithdrawalStateImpl) then) =
      __$$WithdrawalStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$WithdrawalStateImplCopyWithImpl<$Res>
    extends _$WithdrawalStateCopyWithImpl<$Res, _$WithdrawalStateImpl>
    implements _$$WithdrawalStateImplCopyWith<$Res> {
  __$$WithdrawalStateImplCopyWithImpl(
      _$WithdrawalStateImpl _value, $Res Function(_$WithdrawalStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$WithdrawalStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$WithdrawalStateImpl implements _WithdrawalState {
  _$WithdrawalStateImpl({this.isLoading = false});

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'WithdrawalState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WithdrawalStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WithdrawalStateImplCopyWith<_$WithdrawalStateImpl> get copyWith =>
      __$$WithdrawalStateImplCopyWithImpl<_$WithdrawalStateImpl>(
          this, _$identity);
}

abstract class _WithdrawalState implements WithdrawalState {
  factory _WithdrawalState({final bool isLoading}) = _$WithdrawalStateImpl;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$WithdrawalStateImplCopyWith<_$WithdrawalStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
