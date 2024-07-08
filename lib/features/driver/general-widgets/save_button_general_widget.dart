import 'package:flutter/material.dart';

import '../../../utils/constants/text_strings.dart';

class SaveGeneralButtonWidget extends StatelessWidget {
  const SaveGeneralButtonWidget({
    super.key,
    this.width = double.infinity,
    required this.onTap,
  });

  final double width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        child: const Text(TTexts.driverUpdateButton),
      ),
    );
  }
}
