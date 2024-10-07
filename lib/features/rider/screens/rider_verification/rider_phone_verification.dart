import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:bglory_rides/routing/rider_routing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class RiderPhoneVerificationScreen extends StatefulWidget {
  const RiderPhoneVerificationScreen({super.key});

  @override
  State<RiderPhoneVerificationScreen> createState() =>
      _RiderPhoneVerificationScreenState();
}

class _RiderPhoneVerificationScreenState
    extends State<RiderPhoneVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 150,
                  height: 150,
                  child: Image(
                    fit: BoxFit.contain,
                    image: AssetImage(
                      TImages.lightAppLogo,
                    ),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                Text(
                  TTexts.driverVerifyTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Text(
                  TTexts.driverCodeSentTitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                const Pinput(
                  length: 6,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      TTexts.driverRequestCodeTitle,
                    ),
                    Text(
                      TTexts.driverRequestCodeSecondsTitle,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: TColors.primary),
                    ),
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                SaveButtonWidget(
                  onTap: () {
                    context.go(BGRiderRouteNames.riderUserDetails);
                  },
                  buttonText: TTexts.driverVerifyButton,
                  buttonTextColor: TColors.white,
                  buttonColor: TColors.primary,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      TTexts.riderVerificationReceiveCodeTitle,
                    ),
                    Text(
                      TTexts.riderVerificationReceiveCodeByEmailTitle,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: TColors.primary),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
