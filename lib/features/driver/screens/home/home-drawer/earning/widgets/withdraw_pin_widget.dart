import 'package:bglory_rides/routing/driver_routing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';

import '../../../../../../../common/widgets/save_button_widget.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/constants/text_strings.dart';
import '../../../../../general-widgets/outlined_button_widget.dart';

class WithdrawPinWidget extends StatelessWidget {
  const WithdrawPinWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.withdrawModalTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Text(
            TTexts.withdrawPinText,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          OTPTextFieldV2(
            length: 4,
            autoFocus: true,
            width: MediaQuery.of(context).size.width,
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldWidth: 45,
            fieldStyle: FieldStyle.box,
            outlineBorderRadius: 5,
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: OutlinedButtonWidget(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  buttonText: TTexts.withdrawButtonCancelText,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: SaveButtonWidget(
                  onTap: () {
                    context.go(BGRouteNames.driverWithdrawSuccessfulScreen);
                  },
                  buttonText: TTexts.withdrawButtonSecondText,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
