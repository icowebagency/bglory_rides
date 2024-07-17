import 'dart:convert';

import 'package:bglory_rides/features/driver/screens/auth/auth_provider/auth_state.dart';
import 'package:bglory_rides/features/driver/screens/auth/auth_provider/driver_auth_state_notifer.dart';
import 'package:bglory_rides/features/driver/screens/auth/widgets/goto_sign_in.dart';
import 'package:bglory_rides/utils/constants/key_constants.dart';
import 'package:bglory_rides/utils/notification/notification_utils.dart';
import 'package:bglory_rides/utils/validators/validation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../routing/driver_routing.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import 'goto_sign_up.dart';

final emailText = StateProvider(
  (ref) => '',
);

class LoginEmailFormTab extends ConsumerWidget {
  LoginEmailFormTab({
    super.key,
    required this.driverAuthProvider,
    required this.isLogin,
  });
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
                        KeyConstant.email: state.textFieldController.text,
                      };
                      ref.read(emailText.notifier).state =
                          state.textFieldController.text;
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
}
