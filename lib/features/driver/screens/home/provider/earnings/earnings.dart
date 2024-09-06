import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'earnings.freezed.dart';
part 'earnings.g.dart';

@Riverpod(keepAlive: true)
class DriverEarning extends _$DriverEarning {
  @override
  DriverEarningState build() => const DriverEarningState();



  
}

@freezed
class DriverEarningState with _$DriverEarningState {
  const factory DriverEarningState({
    @Default(0.0) double currentBalance,
    @Default(false) bool isLoading,
  }) = _DriverEarningState;

}
