import 'package:flutter/material.dart';

import '../../../utils/constants/text_strings.dart';

class OutlinedButtonWidget extends StatelessWidget {
  const OutlinedButtonWidget({
    super.key,
    this.width = double.infinity,
    required this.onTap,
    this.buttonText = TTexts.driverUpdateButton,
    this.buttonOutlineColor,
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
          side: BorderSide(color: buttonOutlineColor!),
        ),
        onPressed: onTap,
        child: Text(
          buttonText!,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: buttonTextColor),
        ),
      ),
    );
  }
}
