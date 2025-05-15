import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';

class TLoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final Color backgroundColor;
  final double opacity;

  const TLoadingOverlay({
    Key? key,
    required this.isLoading,
    required this.child,
    this.backgroundColor = Colors.black,
    this.opacity = 0.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Positioned.fill(
            child: Container(
              color: backgroundColor.withOpacity(opacity),
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(TColors.primary),
                ),
              ),
            ),
          ),
      ],
    );
  }
}