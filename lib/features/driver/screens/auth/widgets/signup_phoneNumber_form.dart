import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../../routing/driver_routing.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import 'goto_sign_in.dart';

class PhoneNumberFormTab extends StatelessWidget {
  PhoneNumberFormTab({super.key});

  final TextEditingController _phoneNumbercontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: TSizes.spaceBtwSections * 2,
              ),
              const Text(TTexts.phoneNo),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              // Phone Number Section
              IntlPhoneField(
                onTap: () {
                  _phoneNumbercontroller.clear();
                },
                controller: _phoneNumbercontroller,
                autofocus: true,
                cursorColor: TColors.primary,
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Iconsax.close_circle,
                  ),
                  hintText: TTexts.signupPhoneHintText,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: TColors.primary,
                  )),
                  labelText: TTexts.phoneNo,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'NG',
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: TTexts.signupsigningUpAgreement,
                    style: Theme.of(context).textTheme.bodySmall,
                    children: [
                      TextSpan(
                        text: TTexts.signupTermsOfService,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigate to Terms of Service Screen here.
                          },
                      ),
                      TextSpan(
                        text: TTexts.driverAndText,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextSpan(
                        text: TTexts.privacyPolicy,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigate to Terms of Service Screen here.
                          },
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
                    String userInput = _phoneNumbercontroller.text;

                    final path = Uri(
                        path: BGDriverRouteNames.driverVerification,
                        queryParameters: {
                          'userInput': userInput,
                        }).toString();
                    context.go(path);
                  },
                  child: const Text(TTexts.createAccount),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const GotoSignIn(),
            ],
          ),
        ),
      ),
    );
  }
}
