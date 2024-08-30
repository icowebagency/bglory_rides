import 'package:bglory_rides/features/driver/screens/home/home-drawer/earning/widgets/change_payment.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/earning/widgets/withdraw_pin_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../common/widgets/save_button_widget.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';

class WithdrawEarningsScreen extends StatefulWidget {
  const WithdrawEarningsScreen({super.key});

  @override
  State<WithdrawEarningsScreen> createState() => _WithdrawEarningsScreenState();
}

class _WithdrawEarningsScreenState extends State<WithdrawEarningsScreen> {
  final TextEditingController _controller = TextEditingController();

  void _clearText() {
    _controller.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
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
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 1,
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
                        .copyWith(color: TColors.grey, fontFamily: 'Notosans'),
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
                          constraints: BoxConstraints.tight(
                            Size.fromHeight(height * 0.5),
                          ),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  height: MediaQuery.of(context).size.height * 0.3,
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
                        TTexts.driverChangePaymentAccountName,
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
                        TTexts.driverChangePaymentAccountNumber,
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
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        TTexts.driverChangePaymentBankName,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                SaveButtonWidget(
                  onTap: () {
                    showModalBottomSheet(
                      constraints: BoxConstraints.tight(
                        Size.fromHeight(height * 0.4),
                      ),
                      isScrollControlled: false,
                      context: context,
                      builder: (BuildContext context) {
                        return const WithdrawPinWidget();
                      },
                    );
                  },
                  buttonText: TTexts.driverProceedButton,
                ),
                // const SizedBox(height: TSizes.spaceBtwSections),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
