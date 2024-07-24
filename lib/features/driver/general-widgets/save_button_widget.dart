import 'package:flutter/material.dart';

import '../../../utils/constants/text_strings.dart';

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({
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
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(buttonText!),
      ),
    );
  }
}
