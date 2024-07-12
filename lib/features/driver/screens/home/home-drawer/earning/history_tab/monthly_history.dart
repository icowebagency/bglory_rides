import 'package:bglory_rides/features/driver/screens/home/home-drawer/earning/history_tab/withdraw_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/constants/text_strings.dart';

class MonthlyHistoryTab extends StatefulWidget {
  const MonthlyHistoryTab({super.key});

  @override
  State<MonthlyHistoryTab> createState() => _MonthlyHistoryTabState();
}

class _MonthlyHistoryTabState extends State<MonthlyHistoryTab> {
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
