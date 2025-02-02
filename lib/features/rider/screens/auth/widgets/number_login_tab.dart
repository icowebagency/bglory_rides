import 'dart:convert';
import 'package:bglory_rides/features/rider/screens/auth/auth_providers/rider_auth_notifier.dart';
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
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../rider/screens/auth/auth_providers/auth_state.dart';

final phoneNumberText = StateProvider(
      (ref) => '',
);

class LoginPhoneNumberFormTab extends ConsumerWidget {
  LoginPhoneNumberFormTab(
      {super.key,
        required this.riderAuthNotifier,
        required this.isLogin,});

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
                height: TSizes.spaceBtwSections,
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
                    hintText: TTexts.signupPhoneHintText,
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
                    labelText: TTexts.phoneNo,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  initialCountryCode: 'NG',
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
                            .copyWith(color: Colors.blue),
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
                    if ((_formKey.currentState?.validate() ?? false)

                        ///TODO: get backend to fix issue with +234 with numbers

                        &&
                        validatePhoneText(ref, context)) {
                      // print(ref.read(phoneNumberText).replaceAll('+', ''));
                      final target = {
                        KeyConstant.phone: ref.read(phoneNumberText),
                      };
                      provider
                          .onAuthAction(
                        target: target,
                        onError: NotificationUtil.showErrorNotification, context: context,
                      );
                      //     .then(
                      //       (otpGeneratedSuccessfully) {
                      //     if (otpGeneratedSuccessfully) {
                      //       final path = Uri(
                      //         path: BGDriverRouteNames.driverVerification,
                      //         queryParameters: {
                      //           KeyConstant.target: jsonEncode(target),
                      //         },
                      //       ).toString();
                      //       context.go(path);
                      //     }
                      //   },
                      // );
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
            style: TextStyle(color: TColors.error),
          ),
        ),
      );
      return false;
    }
    return true;
  }
}
