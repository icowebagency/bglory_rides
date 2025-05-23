import 'package:bglory_rides/routing/driver_routing.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:bglory_rides/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GotoSignIn extends StatelessWidget {
  const GotoSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          TTexts.driverAlreadyHaveAnAccount,
        ),
        GestureDetector(
          onTap: () {
            context.go(BGDriverRouteNames.driverLogin);
          },
          child: Text(
            TTexts.signIn,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: dark ? TColors.secondary : TColors.primary,
                ),
          ),
        ),
      ],
    );
  }
}
