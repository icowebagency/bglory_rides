import 'package:bglory_rides/routing/rider_routing.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:bglory_rides/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GotoSignUp extends StatelessWidget {
  const GotoSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          TTexts.driverDontHaveAnAccount,
        ),
        GestureDetector(
          onTap: () {
            context.go(BGRiderRouteNames.riderSignup);
          },
          child: Text(
            TTexts.createAccount,
            style: Theme.of(context).textTheme.titleLarge!.apply(
              color: dark ? TColors.secondary : TColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
