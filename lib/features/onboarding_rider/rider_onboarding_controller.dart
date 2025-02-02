import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

import '../../routing/rider_routing.dart';

final onboardingControllerProvider =
    StateNotifierProvider<RiderOnBoardingController, OnboardingState>(
  (ref) => RiderOnBoardingController(),
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

class RiderOnBoardingController extends StateNotifier<OnboardingState> {
  RiderOnBoardingController()
      : super(
          OnboardingState(
            pageController: PageController(),
            currentIndex: 0,
          ),
        );

  FlutterSecureStorage _storage = FlutterSecureStorage();

  /// Update Current Index when Page Scroll
  void updatePageIndicator(index) => state.copyWith(currentIndex: index);

  /// jump to the specific dot selected page.
  void dotNavigationClick(index) {
    state.copyWith(currentIndex: index);
    state.pageController.jumpTo(index.toDouble());
  }

  void init(BuildContext context) async {
    final token = await _storage.read(key: "token");
    if(token != null) {
      context.go(BGRiderRouteNames.riderHomeScreen);
    }
  }

}
