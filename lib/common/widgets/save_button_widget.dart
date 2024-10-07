import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/text_strings.dart';

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({
    super.key,
    this.width = double.infinity,
    this.onTap,
    this.buttonText = TTexts.driverUpdateButton,
    this.buttonColor = TColors.primary,
    this.buttonTextColor = TColors.white,
  });

  final double width;
  final VoidCallback? onTap;
  final String? buttonText;
  final Color? buttonColor;
  final Color? buttonTextColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 65,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          side: BorderSide.none,
        ),
        onPressed: onTap,
        child: Text(
          buttonText!,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: buttonTextColor),
        ),
      ),
    );
  }
}
