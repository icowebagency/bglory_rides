import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class TCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final double borderRadius;
  final Border? border;
  final List<BoxShadow>? boxShadow;
  final VoidCallback? onTap;

  const TCard({
    Key? key,
    required this.child,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderRadius = 12.0,
    this.border,
    this.boxShadow,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding ?? const EdgeInsets.all(TSizes.md),
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor ?? (isDark ? TColors.darkContainer : TColors.white),
          borderRadius: BorderRadius.circular(borderRadius),
          border: border,
          boxShadow: boxShadow ?? [
            if (!isDark)
              BoxShadow(
                color: TColors.dark.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: child,
      ),
    );
  }
}