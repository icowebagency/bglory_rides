import 'dart:async';
import 'package:bglory_rides/common/widgets/app_circular_progress_indicator.dart';
import 'package:bglory_rides/features/driver/screens/verification/driver_verification/driver_verification_provider.dart';
import 'package:bglory_rides/utils/notification/notification_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/helpers.dart';
import 'package:pinput/pinput.dart';

import '../../../../../routing/driver_routing.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

final _otpFieldProvider = StateProvider(
  (ref) => '',
);

class DriverVerificationScreen extends ConsumerStatefulWidget {
  const DriverVerificationScreen({super.key, this.target});
  final dynamic target;

  @override
  ConsumerState<DriverVerificationScreen> createState() =>
      _DriverVerificationScreenState();
}

class _DriverVerificationScreenState
    extends ConsumerState<DriverVerificationScreen> {
  static const int _initialCountdown = 30;
  late int _countdown;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _countdown = _initialCountdown;
    _startCountdown();
  }

  void _startCountdown() {
    _timer?.cancel();
    _countdown = _initialCountdown;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        setState(() {
          _countdown--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    String displayInput = widget.target?['email']?.isNotEmpty ?? false == true
        ? widget.target!['email']!
        : widget.target!['phone']!;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
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
                  Pinput(
                    length: 6,
                    onChanged: (value) =>
                        ref.read(_otpFieldProvider.notifier).state = value,
                    onCompleted: (value) => triggerAction(ref, context),
                  ),
                  Center(
                    child: Builder(builder: (context) {
                      if (_countdown == 0) {
                        return Column(
                          children: [
                            const SizedBox(
                              height: TSizes.space18Sections,
                            ),
                            TextButton(
                              onPressed: requestCode,
                              child: Text(
                                TTexts.driverRequestCode,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: TColors.primary),
                              ),
                            ),
                            const SizedBox(
                              height: TSizes.space18Sections,
                            ),
                          ],
                        );
                      }
                      return Column(
                        children: [
                          const SizedBox(
                            height: TSizes.spaceBtwSections,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: TTexts.driverRequestCodeTitle,
                              style: Theme.of(context).textTheme.bodySmall,
                              children: [
                                TextSpan(
                                  text: '$_countdown ',
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
                          const SizedBox(
                            height: TSizes.spaceBtwSections,
                          ),
                        ],
                      );
                    }),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: ref.watch(_otpFieldProvider).length == 6
                          ? () {
                              triggerAction(ref, context);
                            }
                          : null,
                      child: const Text(TTexts.driverVerifyButton),
                    ),
                  ),
                ],
              ),
            ),
            Consumer(builder: (context, ref, child) {
              return Visibility(
                visible: ref.watch(
                  driverVerificationStateNotifier.select(
                    (value) => value.isLoading,
                  ),
                ),
                child: Container(
                  color: Colors.grey.withOpacity(0.4),
                  child: const Center(
                    child: AppCircularProgressIndicator(),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  void requestCode() {
    ref
        .read(driverVerificationStateNotifier.notifier)
        .onRequestOtp(
          target: Map<String, String>.from(widget.target),
          onError: NotificationUtil.showErrorNotification,
        )
        .then(
      (value) {
        if (value) {
          _startCountdown();
        }
      },
    );
  }

  void triggerAction(WidgetRef ref, BuildContext context) {
    if (validateOtp(ref, context)) {
      widget.target['otp'] = ref.read(_otpFieldProvider);
      ref
          .read(driverVerificationStateNotifier.notifier)
          .onAuthAction(
            target: Map<String, String>.from(widget.target),
            onError: NotificationUtil.showErrorNotification,
          )
          .then(
        (verified) {
          if (verified) {
            context.go(BGRouteNames.driverVerificationSuccessful);
          }
        },
      );
    }
  }

  bool validateOtp(WidgetRef ref, BuildContext context) {
    final text = ref.read(_otpFieldProvider);
    if (text.isEmpty || text.length < 6 || !isNumeric(text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Enter valid Otp',
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
      return false;
    }
    return true;
  }
}
