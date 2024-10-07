import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:bglory_rides/features/driver/general_widgets/outlined_button_widget.dart';
import 'package:bglory_rides/routing/rider_routing.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../../../../utils/constants/text_strings.dart';

class RiderConfirmationPinScreen extends StatefulWidget {
  const RiderConfirmationPinScreen({super.key});

  @override
  State<RiderConfirmationPinScreen> createState() =>
      _RiderConfirmationPinScreenState();
}

class _RiderConfirmationPinScreenState
    extends State<RiderConfirmationPinScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            TTexts.riderConfirmationTitle,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            textAlign: TextAlign.center,
            TTexts.riderConfirmationSubTitle,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          const Pinput(),
          const SizedBox(height: TSizes.spaceBtwItems),
          Row(
            children: [
              Expanded(
                child: OutlinedButtonWidget(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  buttonOutlineColor: TColors.dark,
                  buttonText:
                      TTexts.driverChangePaymentBottomSheetCancelButtonText,
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Expanded(
                child: SaveButtonWidget(
                  onTap: () {
                    context.go(BGRiderRouteNames.riderPaymentSuccessfulScreen);
                  },
                  buttonText: TTexts.driverConfirm,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
