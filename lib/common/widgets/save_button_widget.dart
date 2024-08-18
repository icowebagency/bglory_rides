import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/text_strings.dart';

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({
    super.key,
    this.width = double.infinity,
    required this.onTap,
    this.buttonText = TTexts.driverUpdateButton,
    this.buttonColor = TColors.primary,
  });

  final double width;
  final VoidCallback onTap;
  final String? buttonText;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
        ),
        onPressed: onTap,
        child: Text(buttonText!),
      ),
    );
  }
}
