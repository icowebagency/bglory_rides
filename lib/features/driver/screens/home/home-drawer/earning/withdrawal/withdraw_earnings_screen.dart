import 'dart:developer';

import 'package:bglory_rides/common/widgets/loading_widget.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/earning/widgets/set_withdraw_pin_widget.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/earning/widgets/withdraw_pin_widget.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/earning/withdrawal/provider/withdrawal_provider.dart';
import 'package:bglory_rides/features/driver/screens/home/provider/driver_info/driver_info.dart';
import 'package:bglory_rides/routing/driver_routing.dart';
import 'package:bglory_rides/utils/formatters/formatter.dart';
import 'package:bglory_rides/utils/formatters/input_formatter.dart';
import 'package:bglory_rides/utils/notification/notification_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../common/widgets/save_button_widget.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/constants/text_strings.dart';

class WithdrawEarningsScreen extends ConsumerStatefulWidget {
  const WithdrawEarningsScreen({super.key});

  @override
  ConsumerState<WithdrawEarningsScreen> createState() =>
      _WithdrawEarningsScreenState();
}

class _WithdrawEarningsScreenState
    extends ConsumerState<WithdrawEarningsScreen> {
  late final TextEditingController _amountController;
  late final TextEditingController _accountDetailsController;
  String? _bank;
  String? _bankAccountName;
  String? _bankAccountNumber;
  late final ProviderSubscription<DriverInfoState> subscription;

  final MINIMUM = 1000;

  double? get _amount =>
      TFormatter.parseCurrencyToDouble(_amountController.text);

  bool get _isValidAmount {
    return _amount != null && _amount! >= MINIMUM;
  }

  @override
  void initState() {
    _amountController = TextEditingController();
    _accountDetailsController = TextEditingController();
    super.initState();
    startListening();
    initValues();
  }

  void initValues() {
    final driver = ref.read(driverInfoProvider).driverData?.driver;

    if (driver != null) {
      _bankAccountNumber = driver.bankAccountNumber;
      _bankAccountName = driver.bankAccountName;
      _bank = driver.bank;
      _accountDetailsController.text =
          '$_bankAccountNumber - $_bankAccountName - $_bank';

      if (driver.isTransactionPinSet != null && !driver.isTransactionPinSet!) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _startSetPinFlow();
        });
      }
    }
  }

  void _rebuild() {
    setState(() {});
  }

  void _startSetPinFlow() async {
    if (mounted) {
      final result1 = await setWithdrawalPin(context);
      if (result1 == null) {
        // Handle the scenario where setting the pin failed or was canceled
        return;
      }

      if (mounted) {
        final result2 = await setWithdrawalPin(context, isConfirmation: true);
        if (result2 == null) {
          return;
        }
        if (result1 == result2) {
          log('They Match!');
          ref.read(withdrawalStateNotifierProvider.notifier).setWithdrawalPin(
                transactionPin: result1,
                onError: NotificationUtil.showErrorNotification,
                onSuccess: () => NotificationUtil.showPositiveNotification(
                  "PIN set successfully. Kindly proceed",
                ),
              );
        } else {
          log("They don't match");
          NotificationUtil.showErrorNotification("Pin does don't match");
          _startSetPinFlow();
        }
      }
    }
  }

  void startListening() {
    _amountController.addListener(_rebuild);
    subscription = ref.listenManual(
      driverInfoProvider,
      (previous, next) {
        log('listen called');

        if (next.driverData != null && next.driverData!.driver != null) {
          final driver = next.driverData!.driver;
          _bankAccountNumber = driver!.bankAccountNumber;
          _bankAccountName = driver.bankAccountName;
          _bank = driver.bank;
          _accountDetailsController.text =
              '$_bankAccountNumber - $_bankAccountName - $_bank';
        }
      },
    );
  }

  void stopListening() {
    _amountController.removeListener(_rebuild);
    subscription.close();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _accountDetailsController.dispose();
    super.dispose();
    stopListening();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(withdrawalStateNotifierProvider);
    final notifier = ref.read(withdrawalStateNotifierProvider.notifier);
    final driverNotifier = ref.watch(driverInfoProvider.notifier);
    final driverState = ref.watch(driverInfoProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: LoadingWidget(
        isLoading: state.isLoading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      TTexts.withdrawModalTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  const Center(
                    child: Text(
                      TTexts.withdrawAmountTitle,
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: _amountController,
                    maxLines: 1,
                    inputFormatters: [
                      MoneyTextInputFormatter(),
                    ],
                    decoration: InputDecoration(
                      hintText: TTexts.withdrawHintText,
                      hintStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: TColors.grey),
                      filled: true,
                      fillColor: TColors.containerBackgroundColor,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: TColors.grey,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: TColors.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        TTexts.withdrawPaymentTitle,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      TextButton(
                        onPressed: () {
                          log(_amountController.text);
                        },
                        child: Text(
                          TTexts.withdrawPaymentSecondTitle,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: TColors.secondary,
                                    decoration: TextDecoration.underline,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TextField(
                    keyboardType: TextInputType.name,
                    maxLines: 1,
                    controller: _accountDetailsController,
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: TTexts.withdrawPaymentHint,
                      hintStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: TColors.grey),
                      filled: true,
                      fillColor: TColors.containerBackgroundColor,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: TColors.grey,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: TColors.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SaveButtonWidget(
                    onTap: !_isValidAmount
                        ? null
                        : () async {
                            FocusManager.instance.primaryFocus?.unfocus();
                            final driver = driverState.driverData?.driver;
                            if (driver?.isTransactionPinSet == null ||
                                !driver!.isTransactionPinSet!) {
                              _startSetPinFlow();
                              return;
                            }

                            final pin = await requestPin(context);
                            if (pin != null) {
                              notifier.initiateWithdrawal(
                                amount: _amount.toString(),
                                transactionPin: pin,
                                onSuccess: () {
                                  context.go(BGDriverRouteNames
                                      .driverWithdrawSuccessfulScreen);
                                },
                                onError: NotificationUtil.showErrorNotification,
                              );
                            }
                          },
                    buttonText: TTexts.driverProceedButton,
                  ),
                  // const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<String?> requestPin(BuildContext context) {
    return showModalBottomSheet<String>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context)
                  .viewInsets
                  .bottom, // Adjust padding for keyboard
            ),
            child: const WithdrawPinWidget(),
          ),
        );
      },
    );
  }

  Future<String?> setWithdrawalPin(BuildContext context,
      {bool isConfirmation = false}) {
    return showModalBottomSheet<String>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context)
                  .viewInsets
                  .bottom, // Adjust padding for keyboard
            ),
            child: SetWithdrawPinWidget(
              isConfirmation: isConfirmation,
            ),
          ),
        );
      },
    );
  }
}
