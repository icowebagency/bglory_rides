import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:bglory_rides/routing/driver_routing.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WithdrawalSuccessfulScreen extends StatefulWidget {
  const WithdrawalSuccessfulScreen({super.key});

  @override
  State<WithdrawalSuccessfulScreen> createState() =>
      _WithdrawalSuccessfulScreenState();
}

class _WithdrawalSuccessfulScreenState
    extends State<WithdrawalSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                textAlign: TextAlign.center,
                TTexts.withdrawSuccessfulHeadingText,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 25),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                textAlign: TextAlign.center,
                TTexts.withdrawSuccessfulSubText,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              SaveButtonWidget(
                onTap: () {
                  context.go(BGRouteNames.driverHomePageScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
