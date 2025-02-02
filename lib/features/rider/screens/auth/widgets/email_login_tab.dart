import 'dart:convert';
import 'package:bglory_rides/features/rider/screens/auth/widgets/go_to_signin.dart';
import 'package:bglory_rides/features/rider/screens/auth/widgets/go_to_signup.dart';
import 'package:bglory_rides/utils/constants/key_constants.dart';
import 'package:bglory_rides/utils/helpers/helper_functions.dart';
import 'package:bglory_rides/utils/notification/notification_utils.dart';
import 'package:bglory_rides/utils/validators/validation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../rider/screens/auth/auth_providers/auth_state.dart';
import '../auth_providers/rider_auth_notifier.dart';

final emailText = StateProvider(
      (ref) => '',
);

class LoginEmailFormTab extends ConsumerWidget {
  LoginEmailFormTab({
    super.key,
    required this.riderAuthNotifier,
    required this.isLogin,
  });

  final _formKey = GlobalKey<FormState>();
  final AutoDisposeStateNotifierProvider<RiderAuthNotifier, AuthState> riderAuthNotifier;

  final bool isLogin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(riderAuthNotifier.notifier);
    final state = ref.watch(riderAuthNotifier);
    final dark = THelperFunctions.isDarkMode(context);
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
                height: TSizes.spaceBtwSections * 1,
              ),
              const Text(
                TTexts.email,
              ),
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
                        child: Icon(
                          Iconsax.close_circle,
                          size: 18,
                          color: dark ? TColors.warning : TColors.dark,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: dark ? TColors.secondary : TColors.primary,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: dark ? TColors.white : TColors.primary,
                        ),
                      ),
                      labelText: TTexts.driverHintText,
                      hintText: TTexts.driverHintText,
                      hintStyle:
                      Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: dark ? TColors.white : TColors.dark,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: TTexts.signupsigningUpAgreement,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: dark ? TColors.white : TColors.dark),
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
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: dark ? TColors.white : TColors.dark),
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
                      print(target);
                      ref.read(emailText.notifier).state =
                          state.textFieldController.text;
                      provider
                          .onAuthAction(
                        target: target,
                        onError: NotificationUtil.showErrorNotification, context: context,
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
