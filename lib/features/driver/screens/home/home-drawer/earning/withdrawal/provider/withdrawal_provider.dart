import 'package:bglory_rides/features/driver/data/provider/driver_data_providers.dart';
import 'package:bglory_rides/features/driver/screens/home/provider/driver_info/driver_info.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../../../utils/secret/api_constants.dart';

part 'withdrawal_provider.freezed.dart';
part 'withdrawal_provider.g.dart';

@freezed
class WithdrawalState with _$WithdrawalState {
  factory WithdrawalState({
    @Default(false) bool isLoading,
  }) = _WithdrawalState;
}

@riverpod
class WithdrawalStateNotifier extends _$WithdrawalStateNotifier {
  @override
  WithdrawalState build() => WithdrawalState();

  Future<bool> initiateWithdrawal(
      {required String amount,
      required String transactionPin,
      VoidCallback? onSuccess,
      ValueChanged<String>? onError}) async {
    loading = true;
    final result = await ref
        // ignore: avoid_manual_providers_as_generated_provider_dependency
        .read(driverRepositoryProvider)
        .requestWithdrawal(amount: amount, transactionPin: transactionPin);
    loading = false;
    if (result is Failure) {
      onError?.call((result.errorResponse) ?? 'Request Failed');
      return false;
    } else {
      onSuccess?.call();
      return true;
    }
  }

  Future<bool> setWithdrawalPin({
    required String transactionPin,
    VoidCallback? onSuccess,
    ValueChanged<String>? onError,
  }) async {
    loading = true;
    final result = await ref
        // ignore: avoid_manual_providers_as_generated_provider_dependency
        .read(driverRepositoryProvider)
        .setTransactionPin(
          transactionPin: transactionPin,
          transactionPinConfirmation: transactionPin,
        );
    loading = false;
    ref.read(driverInfoProvider.notifier).getDriverInfo();
    if (result is Error) {
      onError?.call('Request Failed');
      return false;
    } else {
      onSuccess?.call();
      return true;
    }
  }

  set loading(bool value) {
    state = state.copyWith(isLoading: value);
  }
}
