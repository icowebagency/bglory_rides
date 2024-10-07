import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:bglory_rides/features/driver/general_widgets/outlined_button_widget.dart';
import 'package:bglory_rides/routing/rider_routing.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../utils/constants/sizes.dart';

class RiderPaymentSuccessfulScreen extends StatefulWidget {
  const RiderPaymentSuccessfulScreen({super.key});

  @override
  State<RiderPaymentSuccessfulScreen> createState() =>
      _RiderPaymentSuccessfulScreenState();
}

class _RiderPaymentSuccessfulScreenState
    extends State<RiderPaymentSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  TTexts.riderPaymentSuccessfulTitle,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 25),
                ),
                Text(
                  textAlign: TextAlign.center,
                  TTexts.riderPaymentSuccessfulSubTitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: TSizes.spaceBtwSections * 3),

                /// Book a trip
                SaveButtonWidget(
                  onTap: () {},
                  buttonText: TTexts.riderPaymentSuccessfulBookTitle,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),

                /// Rate driver
                OutlinedButtonWidget(
                  onTap: () {
                    context.go(BGRiderRouteNames.riderRateDriverScreen);
                  },
                  buttonText: TTexts.riderPaymentSuccessfulRateTitle,
                  buttonOutlineColor: TColors.dark,
                ),

                /// View invoice
                const SizedBox(height: TSizes.spaceBtwItems),
                OutlinedButtonWidget(
                  onTap: () {
                    context.push(BGRiderRouteNames.riderInvoiceScreen);
                  },
                  buttonText: TTexts.riderPaymentSuccessfulInvoiceTitle,
                  buttonOutlineColor: TColors.dark,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
