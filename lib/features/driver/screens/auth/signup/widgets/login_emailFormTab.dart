import 'dart:convert';

import 'package:bglory_rides/features/driver/screens/auth/login/driver_login_provider.dart';
import 'package:bglory_rides/utils/constants/key_constants.dart';
import 'package:bglory_rides/utils/notification/notification_utils.dart';
import 'package:bglory_rides/utils/validators/validation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../routing/driver_routing.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';

class LoginEmailFormTab extends ConsumerWidget {
  LoginEmailFormTab({super.key});
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
              const Text(TTexts.email),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Center(
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: state.textFieldController,
                    keyboardType: TextInputType.emailAddress,
                    validator: TValidator.validateEmail,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          state.textFieldController.clear();
                        },
                        child: const Icon(
                          Iconsax.close_circle,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: TColors.primary),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: TColors.primary.withOpacity(0.3),
                        ),
                      ),
                      hintText: TTexts.driverHintText,
                      hintStyle: Theme.of(context).textTheme.bodySmall!.apply(
                            color: TColors.darkGrey,
                          ),
                    ),
                  ),
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
                    if (_formKey.currentState?.validate() ?? false) {
                      final target = {
                        'email': state.textFieldController.text,
                      };
                      provider
                          .onAuthAction(
                        target: target,
                        onError: NotificationUtil.showErrorNotification,
                      )
                          .then(
                        (otpGeneratedSuccessfully) {
                          if (otpGeneratedSuccessfully) {
                            final path = Uri(
                              path: BGRouteNames.driverVerification,
                              queryParameters: {
                                KeyConstant.target: jsonEncode(target),
                              },
                            ).toString();
                            context.go(path);
                          }
                        },
                      );
                    }
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
