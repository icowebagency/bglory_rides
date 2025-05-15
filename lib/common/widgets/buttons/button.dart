import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

enum TButtonStyle {
  primary,
  secondary,
  outlined,
  text,
}

class TButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final TButtonStyle style;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Widget? icon;
  final bool isFullWidth;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;

  const TButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.style = TButtonStyle.primary,
    this.width,
    this.padding,
    this.icon,
    this.isFullWidth = true,
    this.borderRadius = TSizes.buttonRadius,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Widget buttonContent = isLoading
        ? SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(
            style == TButtonStyle.outlined
                ? (foregroundColor ?? (isDark ? TColors.secondary : TColors.primary))
                : TColors.white
        ),
      ),
    )
        : icon != null
        ? Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon!,
        const SizedBox(width: TSizes.xs),
        Text(text),
      ],
    )
        : Text(text);

    Widget buttonWidget;

    switch (style) {
      case TButtonStyle.primary:
        buttonWidget = ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? (isDark ? TColors.secondary : TColors.primary),
            foregroundColor: foregroundColor ?? TColors.white,
            padding: padding ?? const EdgeInsets.symmetric(vertical: TSizes.buttonHeight),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: buttonContent,
        );
        break;

      case TButtonStyle.secondary:
        buttonWidget = ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? TColors.secondary,
            foregroundColor: foregroundColor ?? TColors.black,
            padding: padding ?? const EdgeInsets.symmetric(vertical: TSizes.buttonHeight),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: buttonContent,
        );
        break;

      case TButtonStyle.outlined:
        buttonWidget = OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: foregroundColor ?? (isDark ? TColors.secondary : TColors.primary),
            side: BorderSide(
                color: borderColor ?? foregroundColor ?? (isDark ? TColors.secondary : TColors.primary)
            ),
            padding: padding ?? const EdgeInsets.symmetric(vertical: TSizes.buttonHeight),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: buttonContent,
        );
        break;

      case TButtonStyle.text:
        buttonWidget = TextButton(
          onPressed: isLoading ? null : onPressed,
          style: TextButton.styleFrom(
            foregroundColor: foregroundColor ?? (isDark ? TColors.secondary : TColors.primary),
            padding: padding ?? const EdgeInsets.symmetric(vertical: TSizes.buttonHeight / 2),
          ),
          child: buttonContent,
        );
        break;
    }

    return SizedBox(
      width: isFullWidth ? double.infinity : width,
      child: buttonWidget,
    );
  }
}