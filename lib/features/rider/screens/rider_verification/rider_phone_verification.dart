import 'dart:async';

import 'package:bglory_rides/common/widgets/loading_widget.dart';
import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:bglory_rides/features/rider/screens/rider_verification/verification_providers/verification_notifier.dart';
import 'package:bglory_rides/routing/rider_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class RiderPhoneVerificationScreen extends ConsumerStatefulWidget {
  const RiderPhoneVerificationScreen({required this.target,super.key});

  final dynamic target;
  @override
  ConsumerState<RiderPhoneVerificationScreen> createState() =>
      _RiderPhoneVerificationScreenState();
}

class _RiderPhoneVerificationScreenState
    extends ConsumerState<RiderPhoneVerificationScreen> {


  static const int _initialCountdown = 10;
  late int _countdown;
  Timer? _timer;
  String _otp = '';
  FocusNode focus = FocusNode();

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
    focus.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final sentTo = widget.target["email"] ?? widget.target["phone"] ?? "";
    final state = ref.watch(verificationNotifier);
    return Scaffold(
      body: SafeArea(
        child:LoadingWidget(
          isLoading: ref.watch(verificationNotifier.select((val)=> val.isLoading)),
          child:  Center(
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
                    "We sent a verification code to $sentTo",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Form(
                    key: _formKey,
                    child: Pinput(
                      length: 6,
                      focusNode: focus,
                      onChanged: (val) => _otp = val,
                      validator: (value) => value?.length != 6 ? "Input pin" : null,
                      onCompleted: (val) {
                        print(_otp);
                        focus.unfocus();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  if(_countdown != 0)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          TTexts.driverRequestCodeTitle,
                        ),
                        Text(
                          "$_countdown ${_countdown == 1 ? TTexts.driverRequestCodeSecondTitle :TTexts.driverRequestCodeSecondsTitle}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: TColors.primary),
                        ),
                      ],
                    )
                  else TextButton(
                    onPressed: () {
                      ref.read(verificationNotifier.notifier).resendCode(widget.target, () {
                        _startCountdown();
                      });
                    },
                    child: Text(
                      TTexts.driverRequestCode,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: TColors.primary),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  SaveButtonWidget(
                    onTap: () async {
                      if(_formKey.currentState!.validate()) {
                        final res = await ref.read(verificationNotifier.notifier).verifyOtp(
                            target: widget.target,
                            otp: _otp
                        );
                        if(res == true) {
                          context.go(state.isLogin ? BGRiderRouteNames.riderHomeScreen : BGRiderRouteNames.riderUserDetails);
                        }
                      }
                    },
                    buttonText: TTexts.driverVerifyButton,
                    buttonTextColor: TColors.white,
                    buttonColor: TColors.primary,
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     const Text(
                  //       TTexts.riderVerificationReceiveCodeTitle,
                  //     ),
                  //     // Text(
                  //     //   TTexts.riderVerificationReceiveCodeByEmailTitle,
                  //     //   style: Theme.of(context)
                  //     //       .textTheme
                  //     //       .bodyLarge!
                  //     //       .copyWith(color: TColors.primary),
                  //     // ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
