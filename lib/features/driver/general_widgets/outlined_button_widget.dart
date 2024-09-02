import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/text_strings.dart';

class OutlinedButtonWidget extends StatelessWidget {
  const OutlinedButtonWidget({
    super.key,
    this.width = double.infinity,
    required this.onTap,
    this.buttonText = TTexts.driverUpdateButton,
    this.buttonOutlineColor = TColors.grey,
    this.buttonTextColor,
  });

  final double width;
  final VoidCallback onTap;
  final String? buttonText;
  final Color? buttonOutlineColor;
  final Color? buttonTextColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: buttonOutlineColor!, width: 1.2),
        ),
        onPressed: onTap,
        child: Text(
          buttonText!,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: buttonTextColor, fontSize: 16),
        ),
      ),
    );
  }
}
