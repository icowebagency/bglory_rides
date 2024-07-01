import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../routing/driver_routing.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class SuccessfulVerification extends StatefulWidget {
  const SuccessfulVerification({super.key});

  @override
  State<SuccessfulVerification> createState() => _SuccessfulVerificationState();
}

class _SuccessfulVerificationState extends State<SuccessfulVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                    context.go(BGRouteNames.driverOption);
                  },
                  child: const Text(TTexts.driverProceedButton),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
