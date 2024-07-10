import 'package:flutter/material.dart';

import '../../../../../../../utils/constants/colors.dart';

class EarningOptionWidget extends StatelessWidget {
  const EarningOptionWidget({
    super.key,
    this.height,
    this.width,
    required this.earningIcon,
    required this.containerText,
    required this.onTap,
  });

  final double? height;
  final double? width;
  final IconData earningIcon;
  final String containerText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: height ?? 80.0,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: TColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: TColors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                earningIcon,
                color: TColors.primary,
                applyTextScaling: true,
              ),
              const SizedBox(
                height: 7,
              ),
              FittedBox(
                child: Text(
                  containerText,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
