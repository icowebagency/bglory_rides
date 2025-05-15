import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class TAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final String primaryButtonText;
  final String? secondaryButtonText;
  final VoidCallback? onPrimaryPressed;
  final VoidCallback? onSecondaryPressed;
  final bool isDestructive;

  const TAlertDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.primaryButtonText,
    this.secondaryButtonText,
    this.onPrimaryPressed,
    this.onSecondaryPressed,
    this.isDestructive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AlertDialog(
      backgroundColor: isDark ? TColors.darkContainer : TColors.white,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      actions: [
        if (secondaryButtonText != null)
          TextButton(
            onPressed: onSecondaryPressed ?? () => Navigator.of(context).pop(false),
            child: Text(
              secondaryButtonText!,
              style: TextStyle(color: isDark ? TColors.white : TColors.dark),
            ),
          ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isDestructive ? TColors.error : TColors.primary,
            foregroundColor: TColors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: TSizes.md,
              vertical: TSizes.xs,
            ),
          ),
          onPressed: onPrimaryPressed ?? () => Navigator.of(context).pop(true),
          child: Text(primaryButtonText),
        ),
      ],
    );
  }
}