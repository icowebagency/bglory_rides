import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:bglory_rides/routing/driver_routing.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../widgets/table_tab_widget.dart';

class FirstTab extends StatefulWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  State<FirstTab> createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  final PageController _pageController = PageController(initialPage: 0);
  DateTime _currentDate = DateTime(2024, 1, 1);

  void _onPageChanged(int index) {
    setState(() {
      _currentDate = DateTime(2024, 1, 1).add(Duration(days: index));
    });
  }

  void _onArrowLeft() {
    if (_pageController.page != null) {
      _pageController.jumpToPage(_pageController.page!.toInt() - 1);
    }
  }

  void _onArrowRight() {
    if (_pageController.page != null) {
      _pageController.jumpToPage(_pageController.page!.toInt() + 1);
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
                itemBuilder: (context, index) {
                  DateTime date =
                      DateTime(2024, 1, 1).add(Duration(days: index));
                  String formattedDate = DateFormat('MMMM d').format(date);
                  return Center(
                    child: Text(
                      formattedDate,
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
