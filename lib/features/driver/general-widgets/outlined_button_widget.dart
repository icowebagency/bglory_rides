import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/text_strings.dart';

class OutlinedButtonWidget extends StatelessWidget {
  const OutlinedButtonWidget({
    super.key,
    this.width = double.infinity,
    required this.onTap,
    this.buttonText = TTexts.driverUpdateButton,
  });

  final double width;
  final VoidCallback onTap;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: TColors.primary,
            ),
          ),
        ),
        onPressed: onTap,
        child: Text(buttonText!),
      ),
    );
  }
}
