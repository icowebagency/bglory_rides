import 'package:bglory_rides/features/driver/screens/home/home-drawer/earning/widgets/withdraw_pin_widget.dart';
import 'package:flutter/material.dart';

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
                  maxLines: 1,
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
                      onPressed: () {},
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
