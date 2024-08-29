import 'package:bglory_rides/common/widgets/app_circular_progress_indicator.dart';
import 'package:bglory_rides/features/driver/screens/verification/driver_verification_successful/provider/successful_verification_provider.dart';
import 'package:bglory_rides/utils/notification/notification_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../../routing/driver_routing.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class SuccessfulVerification extends ConsumerWidget {
  const SuccessfulVerification({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider =
        ref.read(successfulVerificationStateNotifierProvider.notifier);
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
                      image: AssetImage(
                        TImages.driverLogo,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections * 2,
                  ),
                  Lottie.asset(TImages.signupVerification),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const DriverOptionScreen(),
                        //   ),
                        // );

                        provider
                            .onProceed(
                                onError: NotificationUtil.showErrorNotification)
                            .then(
                          (isProfileComplete) {
                            if (isProfileComplete != null) {
                              if (isProfileComplete) {
                                context.go(BGRouteNames.driverHomePageScreen);
                              } else {
                                context.go(BGRouteNames.driverOption);
                              }
                            }
                          },
                        );
                      },
                      child: const Text(TTexts.driverProceedButton),
                    ),
                  ),
                ],
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                return Visibility(
                  visible:
                      ref.watch(successfulVerificationStateNotifierProvider),
                  child: Container(
                    color: Colors.grey.withOpacity(0.4),
                    child: const Center(
                      child: AppCircularProgressIndicator(),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
