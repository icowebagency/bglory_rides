import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../common/widgets/save_button_widget.dart';
import '../../../../../../../routing/driver_routing.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/constants/text_strings.dart';
import '../widgets/table_tab_widget.dart';

class ThirdTab extends StatefulWidget {
  const ThirdTab({super.key});

  @override
  State<ThirdTab> createState() => _ThirdTabState();
}

class _ThirdTabState extends State<ThirdTab> {
  final PageController _pageController = PageController(initialPage: 0);
  final List<String> _months = List.generate(12, (index) {
    return DateFormat.MMMM().format(DateTime(2024, index + 1));
  });

  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onArrowLeft() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onArrowRight() {
    if (_currentIndex < 11) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_left_rounded),
              onPressed: _onArrowLeft,
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _months.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Text(
                      _months[index],
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  );
                },
              ),
            ),
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_right_rounded),
              onPressed: _onArrowRight,
            ),
          ],
        ),
        const TabTableWidget(
          firstText: TTexts.firstTabInAppPaymentTitle,
          lastText: TTexts.firstTabInAppPaymentPrice,
        ),
        const TabTableWidget(
          firstText: TTexts.firstTabCashPaymentTitle,
          lastText: TTexts.firstTabCashPaymentPrice,
        ),
        const TabTableWidget(
          firstText: TTexts.firstTabCommissionTitle,
          lastText: TTexts.firstTabCashPaymentPrice,
        ),
        const TabTableWidget(
          firstText: TTexts.firstTabYouEarnedTitle,
          lastText: TTexts.firstTabYouEarnedPrice,
          dividerColor: Colors.transparent,
          subText: TTexts.firstTabSubCommissionText,
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        SaveButtonWidget(
          onTap: () {
            context.push(BGDriverRouteNames.driverWithdrawEarningScreen);
          },
          buttonText: TTexts.firstTabWithdrawEarningBtnText,
        ),
      ],
    );
  }
}
