import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';

import '../../../../routing/driver_routing.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class DriverVerificationScreen extends StatefulWidget {
  const DriverVerificationScreen({super.key, this.userInput, this.emailInput});

  final String? userInput;
  final String? emailInput;

  @override
  State<DriverVerificationScreen> createState() =>
      _DriverVerificationScreenState();
}

class _DriverVerificationScreenState extends State<DriverVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    String displayInput = widget.emailInput?.isNotEmpty == true
        ? widget.emailInput!
        : '+234${widget.userInput}';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              const Center(
                child: Image(
                  width: 150,
                  height: 100,
                  image: AssetImage(TImages.driverLogo),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Text(
                TTexts.driverVerfTitle,
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
              Text(
                displayInput,
                style: Theme.of(context).textTheme.headlineMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              OTPTextFieldV2(
                length: 5,
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
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: TTexts.driverRequestCodeTitle,
                    style: Theme.of(context).textTheme.bodySmall,
                    children: [
                      TextSpan(
                        text: '23 ',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(color: TColors.primary),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigate to Terms of Service Screen here.
                          },
                      ),
                      TextSpan(
                        text: TTexts.driverRequestCodeSecondsTitle,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(color: TColors.primary),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.go(BGRouteNames.driverVerificationSuccessful);
                  },
                  child: const Text(TTexts.driverVerifyButton),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
