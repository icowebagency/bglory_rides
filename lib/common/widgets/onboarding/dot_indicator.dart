import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../utils/constants/colors.dart';

class TDotIndicator extends StatelessWidget {
  final PageController pageController;
  final int count;
  final Function(int) onDotClicked;

  const TDotIndicator({
    Key? key,
    required this.pageController,
    required this.count,
    required this.onDotClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SmoothPageIndicator(
      controller: pageController,
      count: count,
      onDotClicked: onDotClicked,
      effect: ExpandingDotsEffect(
        activeDotColor: isDark ? TColors.secondary : TColors.primary,
        dotColor: isDark ? TColors.darkGrey.withOpacity(0.7) : TColors.buttonDisabled,
        dotHeight: 8,
        dotWidth: 12,
        spacing: 6,
        expansionFactor: 3.0,
      ),
    );
  }
}