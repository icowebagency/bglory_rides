import 'dart:developer';

import 'package:bglory_rides/common/widgets/loading_widget.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/earning/widgets/change_payment.dart';
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
import 'package:iconsax/iconsax.dart';

import '../../../../../../common/widgets/save_button_widget.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';

class WithdrawEarningsScreen extends ConsumerStatefulWidget {
  const WithdrawEarningsScreen({super.key});

  @override
  ConsumerState<WithdrawEarningsScreen> createState() =>
      _WithdrawEarningsScreenState();
}

class _WithdrawEarningsScreenState
    extends ConsumerState<WithdrawEarningsScreen> {
  final TextEditingController _amountController = TextEditingController();
  String _bank = '--';
  String _bankAccountName = '--';
  String _bankAccountNumber = '--';
  late final ProviderSubscription<DriverInfoState> subscription;

  final MINIMUM = 1000;

  bool get _isValidAmount {
    return _amount != null && _amount! >= MINIMUM;
  }

  double? get _amount =>
      TFormatter.parseCurrencyToDouble(_amountController.text);

  @override
  void initState() {
    super.initState();
    startListening();
    initValues();
  }

  void initValues() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final driver = ref.read(driverInfoProvider).driverData?.driver;

      if (driver != null) {
        _bankAccountNumber = driver.bankAccountNumber ?? _bankAccountNumber;
        _bankAccountName = driver.bankAccountName ?? _bankAccountName;
        _bank = driver.bank ?? _bank;
        setState(() {});

        if (driver.isTransactionPinSet != null &&
            !driver.isTransactionPinSet!) {
          _startSetPinFlow();
        }
      }
    });
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
          _bankAccountNumber = driver!.bankAccountNumber ?? _bankAccountNumber;
          _bankAccountName = driver.bankAccountName ?? _bankAccountName;
          _bank = driver.bank ?? _bank;
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
    super.dispose();
    stopListening();
  }

  void _clearText() {
    _amountController.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final state = ref.watch(withdrawalStateNotifierProvider);
    final notifier = ref.read(withdrawalStateNotifierProvider.notifier);
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
                  Text(
                    TTexts.withdrawModalTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  Text(
                    TTexts.withdrawAmountTitle,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  /// Withdraw amount field
                  TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    style: Theme.of(context).textTheme.titleLarge,
                    maxLines: 1,
                    inputFormatters: [
                      MoneyTextInputFormatter(),
                    ],
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          _clearText();
                        },
                        icon: const Icon(
                          Iconsax.close_circle,
                          color: TColors.grey,
                        ),
                      ),
                      prefixText: TTexts.nairaSymbol,
                      prefixStyle: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontFamily: 'Notosans'),
                      hintText: TTexts.withdrawHintText,
                      hintStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                              color: TColors.grey, fontFamily: 'Notosans'),
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
                          showModalBottomSheet(
                            isScrollControlled: false,
                            context: context,
                            builder: (BuildContext context) {
                              return const ChangePaymentScreen();
                            },
                          );
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

                  /// Account details
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: TColors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TTexts.driverChangePaymentAccountNameTitle,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 18),
                        ),
                        const Divider(),
                        const SizedBox(height: 5),
                        Text(
                          _bankAccountName,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        //   const Divider(),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        Text(
                          TTexts.driverChangePaymentAccountNumberTitle,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 18),
                        ),
                        const Divider(),
                        const SizedBox(height: 5),
                        Text(
                          _bankAccountNumber,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        Text(
                          TTexts.driverChangePaymentBankNameTitle,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 18),
                        ),
                        const Divider(),
                        const SizedBox(height: 5),
                        Text(
                          _bank,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
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
                                  context.go(BGRouteNames
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
