import 'package:bglory_rides/features/driver/screens/home/home-drawer/earning/history_tab/withdraw_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/constants/text_strings.dart';

class WeeklyHistoryTab extends StatefulWidget {
  const WeeklyHistoryTab({super.key});

  @override
  State<WeeklyHistoryTab> createState() => _WeeklyHistoryTabState();
}

class _WeeklyHistoryTabState extends State<WeeklyHistoryTab> {
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          const SizedBox(height: TSizes.spaceBtwItems),
          Text(
            TTexts.transactionHistoryTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: TColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Column(
              children: [
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryYesterdayTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalPrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalOnePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateOneTitle,
                  withdrawalIconProgress: Iconsax.close_circle,
                  withdrawalIconProgressColor: TColors.error,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistoryUnSuccessTitle,
                  withdrawalProgressColor: TColors.error,
                  withdrawIconTypeColor: TColors.error,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalTwoPrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateTwoTitle,
                  withdrawalIconProgress: Iconsax.minus_cirlce,
                  withdrawalIconProgressColor: TColors.warning,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistoryPendingTitle,
                  withdrawalProgressColor: TColors.warning,
                  withdrawIconTypeColor: TColors.warning,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalThreePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateThreeTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalFourPrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateFourTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalFivePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalOnePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateOneTitle,
                  withdrawalIconProgress: Iconsax.close_circle,
                  withdrawalIconProgressColor: TColors.error,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistoryUnSuccessTitle,
                  withdrawalProgressColor: TColors.error,
                  withdrawIconTypeColor: TColors.error,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalTwoPrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateTwoTitle,
                  withdrawalIconProgress: Iconsax.minus_cirlce,
                  withdrawalIconProgressColor: TColors.warning,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistoryPendingTitle,
                  withdrawalProgressColor: TColors.warning,
                  withdrawIconTypeColor: TColors.warning,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalThreePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateThreeTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalFourPrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateFourTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalFivePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalOnePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateOneTitle,
                  withdrawalIconProgress: Iconsax.close_circle,
                  withdrawalIconProgressColor: TColors.error,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistoryUnSuccessTitle,
                  withdrawalProgressColor: TColors.error,
                  withdrawIconTypeColor: TColors.error,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalTwoPrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateTwoTitle,
                  withdrawalIconProgress: Iconsax.minus_cirlce,
                  withdrawalIconProgressColor: TColors.warning,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistoryPendingTitle,
                  withdrawalProgressColor: TColors.warning,
                  withdrawIconTypeColor: TColors.warning,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalThreePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateThreeTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalFourPrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateFourTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalFivePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalOnePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateOneTitle,
                  withdrawalIconProgress: Iconsax.close_circle,
                  withdrawalIconProgressColor: TColors.error,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistoryUnSuccessTitle,
                  withdrawalProgressColor: TColors.error,
                  withdrawIconTypeColor: TColors.error,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalTwoPrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateTwoTitle,
                  withdrawalIconProgress: Iconsax.minus_cirlce,
                  withdrawalIconProgressColor: TColors.warning,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistoryPendingTitle,
                  withdrawalProgressColor: TColors.warning,
                  withdrawIconTypeColor: TColors.warning,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalThreePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateThreeTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalFourPrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateFourTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalFivePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalOnePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateOneTitle,
                  withdrawalIconProgress: Iconsax.close_circle,
                  withdrawalIconProgressColor: TColors.error,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistoryUnSuccessTitle,
                  withdrawalProgressColor: TColors.error,
                  withdrawIconTypeColor: TColors.error,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalTwoPrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateTwoTitle,
                  withdrawalIconProgress: Iconsax.minus_cirlce,
                  withdrawalIconProgressColor: TColors.warning,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistoryPendingTitle,
                  withdrawalProgressColor: TColors.warning,
                  withdrawIconTypeColor: TColors.warning,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalThreePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateThreeTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalFourPrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateFourTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalFivePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateOneTitle,
                  withdrawalIconProgress: Iconsax.close_circle,
                  withdrawalIconProgressColor: TColors.error,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistoryUnSuccessTitle,
                  withdrawalProgressColor: TColors.error,
                  withdrawIconTypeColor: TColors.error,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalTwoPrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateTwoTitle,
                  withdrawalIconProgress: Iconsax.minus_cirlce,
                  withdrawalIconProgressColor: TColors.warning,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistoryPendingTitle,
                  withdrawalProgressColor: TColors.warning,
                  withdrawIconTypeColor: TColors.warning,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalThreePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateThreeTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalFourPrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateFourTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalFivePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalOnePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateOneTitle,
                  withdrawalIconProgress: Iconsax.close_circle,
                  withdrawalIconProgressColor: TColors.error,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistoryUnSuccessTitle,
                  withdrawalProgressColor: TColors.error,
                  withdrawIconTypeColor: TColors.error,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalTwoPrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateTwoTitle,
                  withdrawalIconProgress: Iconsax.minus_cirlce,
                  withdrawalIconProgressColor: TColors.warning,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistoryPendingTitle,
                  withdrawalProgressColor: TColors.warning,
                  withdrawIconTypeColor: TColors.warning,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalThreePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateThreeTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalFourPrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateFourTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalFivePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateOneTitle,
                  withdrawalIconProgress: Iconsax.close_circle,
                  withdrawalIconProgressColor: TColors.error,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistoryUnSuccessTitle,
                  withdrawalProgressColor: TColors.error,
                  withdrawIconTypeColor: TColors.error,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalTwoPrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateTwoTitle,
                  withdrawalIconProgress: Iconsax.minus_cirlce,
                  withdrawalIconProgressColor: TColors.warning,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistoryPendingTitle,
                  withdrawalProgressColor: TColors.warning,
                  withdrawIconTypeColor: TColors.warning,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalThreePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateThreeTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalFourPrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateFourTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalFivePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalOnePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateOneTitle,
                  withdrawalIconProgress: Iconsax.close_circle,
                  withdrawalIconProgressColor: TColors.error,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistoryUnSuccessTitle,
                  withdrawalProgressColor: TColors.error,
                  withdrawIconTypeColor: TColors.error,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalTwoPrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateTwoTitle,
                  withdrawalIconProgress: Iconsax.minus_cirlce,
                  withdrawalIconProgressColor: TColors.warning,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistoryPendingTitle,
                  withdrawalProgressColor: TColors.warning,
                  withdrawIconTypeColor: TColors.warning,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalThreePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateThreeTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalFourPrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateFourTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalFivePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateOneTitle,
                  withdrawalIconProgress: Iconsax.close_circle,
                  withdrawalIconProgressColor: TColors.error,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistoryUnSuccessTitle,
                  withdrawalProgressColor: TColors.error,
                  withdrawIconTypeColor: TColors.error,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalTwoPrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateTwoTitle,
                  withdrawalIconProgress: Iconsax.minus_cirlce,
                  withdrawalIconProgressColor: TColors.warning,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistoryPendingTitle,
                  withdrawalProgressColor: TColors.warning,
                  withdrawIconTypeColor: TColors.warning,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalThreePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateThreeTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalFourPrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateFourTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalFivePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalOnePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateOneTitle,
                  withdrawalIconProgress: Iconsax.close_circle,
                  withdrawalIconProgressColor: TColors.error,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistoryUnSuccessTitle,
                  withdrawalProgressColor: TColors.error,
                  withdrawIconTypeColor: TColors.error,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalTwoPrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateTwoTitle,
                  withdrawalIconProgress: Iconsax.minus_cirlce,
                  withdrawalIconProgressColor: TColors.warning,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistoryPendingTitle,
                  withdrawalProgressColor: TColors.warning,
                  withdrawIconTypeColor: TColors.warning,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalThreePrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateThreeTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalFourPrice,
                ),
                TransactionWidget(
                  withdrawalDate: TTexts.transactionHistoryDateFourTitle,
                  withdrawalIconProgress: Iconsax.tick_circle,
                  withdrawalIconProgressColor: TColors.success,
                  withdrawalIconType: Iconsax.send,
                  withdrawalProgress: TTexts.transactionHistorySuccessTitle,
                  withdrawalProgressColor: TColors.success,
                  withdrawIconTypeColor: TColors.success,
                  withdrewedAmount:
                      TTexts.transactionHistoryEarningWithdrawalFivePrice,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
