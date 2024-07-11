import 'dart:developer';

import 'package:bglory_rides/features/driver/screens/auth/login/driver_login_provider.dart';
import 'package:bglory_rides/utils/validators/validation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../../../routing/driver_routing.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../../../verification/driver_verification_screen.dart';

final phoneNumberText = StateProvider(
  (ref) => '',
);

class LoginPhoneNumberFormTab extends ConsumerWidget {
  LoginPhoneNumberFormTab({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(driverLoginStateNotifierProvider.notifier);
    final state = ref.watch(driverLoginStateNotifierProvider);
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
              Form(
                key: _formKey,
                child: IntlPhoneField(
                  controller: state.textFieldController,
                  autofocus: true,
                  cursorColor: TColors.primary,
                  validator: (value) async {
                    return TValidator.validatePhoneNumber(value);
                  },
                  onChanged: (value) => ref
                      .read(phoneNumberText.notifier)
                      .state = value.completeNumber,
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
                    log('${_formKey.currentState?.validate()}');
                    () {
                      String userInput = state.textFieldController.text;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DriverVerificationScreen(
                            userInput: userInput,
                          ),
                        ),
                      );
                      final path = Uri(
                          path: BGRouteNames.driverVerification,
                          queryParameters: {
                            'userInput': userInput,
                          }).toString();
                      context.go(path);
                    };

                    if (!ref.read(phoneNumberText).startsWith('+234')) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Enter a valid Nigerian number',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      );
                    }

                    provider.onAuthAction(target: {
                      'phone': ref.read(phoneNumberText),
                    });
                  },
                  child: const Text(TTexts.loginContinueButtonTitle),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    TTexts.driverAlreadyHaveAnAccount,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   (context),
                      //   MaterialPageRoute(
                      //     builder: (context) => const DriverSignup(),
                      //   ),
                      // );

                      context.go(BGRouteNames.driverSignup);
                    },
                    child: Text(
                      TTexts.createAccount,
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                            color: TColors.linkBlueColor,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
