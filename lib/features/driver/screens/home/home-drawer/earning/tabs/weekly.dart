import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../common/widgets/save_button_widget.dart';
import '../../../../../../../routing/driver_routing.dart';
import '../../../../../../../utils/constants/text_strings.dart';
import '../widgets/table_tab_widget.dart';

class SecondTab extends StatefulWidget {
  const SecondTab({Key? key}) : super(key: key);

  @override
  _SecondTabState createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentWeekIndex = 0; // Current week index
  int _currentMonth = DateTime.now().month; // Current month

  void _onPageChanged(int index) {
    setState(() {
      _currentWeekIndex = index;
      _currentMonth =
          DateTime(2024, _currentMonth, 1).add(Duration(days: index * 7)).month;
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
              icon: const Icon(
                Icons.keyboard_arrow_left_rounded,
                color: TColors.primary,
              ),
              onPressed: _onArrowLeft,
            ),
            SizedBox(
              width: 200,
              height: 100,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount:
                    53, // Assuming 52 weeks in a year, index from 0 to 51
                itemBuilder: (context, index) {
                  DateTime weekStartDate = DateTime(2024, 1, 1).add(
                    Duration(days: index * 7),
                  );
                  DateTime weekEndDate = DateTime(2024, 1, 1).add(
                    Duration(days: index * 7 + 6),
                  );
                  String monthName = DateFormat('MMMM').format(weekStartDate);
                  int weekNumber = index + 1;
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Week $weekNumber',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 20),
                        ),
                        Text(
                          '${weekStartDate.day} - ${weekEndDate.day} ${DateFormat('MMM').format(weekEndDate)}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_right_rounded,
                color: TColors.primary,
              ),
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
