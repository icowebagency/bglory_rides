import 'package:bglory_rides/features/driver/screens/home/home-drawer/earning/history_tab/withdraw_history_widget.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class DailyHistoryTab extends StatefulWidget {
  const DailyHistoryTab({super.key});

  @override
  State<DailyHistoryTab> createState() => _DailyHistoryTabState();
}

class _DailyHistoryTabState extends State<DailyHistoryTab> {
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
                  itemBuilder: (context, index) {
                    DateTime date =
                        DateTime(2024, 1, 1).add(Duration(days: index));
                    String formattedDate = DateFormat('d MMMM').format(date);
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
            width: MediaQuery.sizeOf(context).width,
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
