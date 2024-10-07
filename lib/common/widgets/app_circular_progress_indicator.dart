import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AppCircularProgressIndicator extends StatelessWidget {
  const AppCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator.adaptive(
      valueColor: AlwaysStoppedAnimation(TColors.primary),
    );
  }
}
