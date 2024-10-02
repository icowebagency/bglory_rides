import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onboardingControllerProvider =
    StateNotifierProvider<OnBoardingController, OnboardingState>(
  (ref) => OnBoardingController(),
);

class OnboardingState {
  final PageController pageController;
  final int currentIndex;

  OnboardingState({required this.pageController, required this.currentIndex});

  OnboardingState copyWith(
          {PageController? pageController, int? currentIndex}) =>
      OnboardingState(
        pageController: pageController ?? this.pageController,
        currentIndex: currentIndex ?? this.currentIndex,
      );
}

class OnBoardingController extends StateNotifier<OnboardingState> {
  OnBoardingController()
      : super(
          OnboardingState(
            pageController: PageController(),
            currentIndex: 0,
          ),
        );

  /// Update Current Index when Page Scroll
  void updatePageIndicator(index) => state.copyWith(currentIndex: index);

  /// jump to the specific dot selected page.
  void dotNavigationClick(index) {
    state.copyWith(currentIndex: index);
    state.pageController.jumpTo(index.toDouble());
  }
}
