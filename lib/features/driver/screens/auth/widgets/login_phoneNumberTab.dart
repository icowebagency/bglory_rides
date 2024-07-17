import 'dart:convert';

import 'package:bglory_rides/features/driver/screens/auth/auth_provider/auth_state.dart';
import 'package:bglory_rides/features/driver/screens/auth/auth_provider/driver_auth_state_notifer.dart';
import 'package:bglory_rides/features/driver/screens/auth/login/driver_login_provider.dart';
import 'package:bglory_rides/features/driver/screens/auth/widgets/goto_sign_in.dart';
import 'package:bglory_rides/features/driver/screens/auth/widgets/login_emailFormTab.dart';
import 'package:bglory_rides/features/driver/screens/auth/widgets/signup_email_form_tab.dart';
import 'package:bglory_rides/utils/constants/key_constants.dart';
import 'package:bglory_rides/utils/notification/notification_utils.dart';
import 'package:bglory_rides/utils/validators/validation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../../routing/driver_routing.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import 'goto_sign_up.dart';

final phoneNumberText = StateProvider(
  (ref) => '',
);

class LoginPhoneNumberFormTab extends ConsumerWidget {
  LoginPhoneNumberFormTab(
      {super.key, required this.driverAuthProvider, required this.isLogin});

  final _formKey = GlobalKey<FormState>();

  final AutoDisposeStateNotifierProvider<DriverAuthStateNotifer, AuthState>
      driverAuthProvider;

  final bool isLogin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(driverAuthProvider.notifier);
    final state = ref.watch(driverAuthProvider);

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
                  onChanged: (value) =>
                      ref.read(phoneNumberText.notifier).state = value.number,
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
                    if ((_formKey.currentState?.validate() ?? false)

                        ///TODO: get backend to fix issue with +234 with numbers

                        &&
                        validatePhoneText(ref, context)) {
                      final target = {
                        KeyConstant.phone: '0${ref.read(phoneNumberText)}',
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
              if (isLogin) const GotoSignUp() else const GotoSignIn(),
            ],
          ),
        ),
      ),
    );
  }

  bool validatePhoneText(WidgetRef ref, BuildContext context) {
    // if (!ref.read(_phoneNumberText).startsWith('+234') ) {
    if (ref.read(phoneNumberText).length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Enter a valid Nigerian number',
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
      return false;
    }
    return true;
  }
}
