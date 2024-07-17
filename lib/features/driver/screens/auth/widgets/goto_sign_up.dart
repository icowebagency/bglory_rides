import 'package:bglory_rides/routing/driver_routing.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GotoSignUp extends StatelessWidget {
  const GotoSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          TTexts.driverDontHaveAnAccount,
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
    );
  }
}
