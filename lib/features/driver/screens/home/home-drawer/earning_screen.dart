import 'package:bglory_rides/features/driver/screens/home/home-drawer/earning/driver_activity_breakdown_bottomsheet.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/earning/earning_target_bottomsheet.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/earning/pie_chart.dart';
import 'package:bglory_rides/routing/driver_routing.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import 'earning/widgets/earning_option_widget.dart';
import 'earning/widgets/earning_rate_widget.dart';

class EarningsScreen extends StatefulWidget {
  const EarningsScreen({super.key});

  @override
  State<EarningsScreen> createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(TTexts.earningAppBarTitle),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      TTexts.earningSubTitle,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    FittedBox(
                      child: Text(
                        TTexts.earningAmountTitle,
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontFamily: 'Notosans',
                                ),
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: EarningOptionWidget(
                            onTap: () {
                              context.push(
                                  BGRouteNames.driverWithdrawEarningScreen);
                            },
                            earningIcon: Iconsax.money_send,
                            containerText: TTexts.earningWithdrawalTitle,
                          ),
                        ),
                        const SizedBox(
                          width: TSizes.spaceBtwInputFields,
                        ),
                        Expanded(
                          child: EarningOptionWidget(
                            onTap: () {
                              context.push(
                                  BGRouteNames.driverTransactionHistoryScreen);
                            },
                            earningIcon: Iconsax.activity,
                            containerText: TTexts.earningHistoryTitle,
                          ),
                        ),
                        const SizedBox(
                          width: TSizes.spaceBtwInputFields,
                        ),
                        Expanded(
                          child: EarningOptionWidget(
                            onTap: () {
                              context.push(BGRouteNames.driverInsightScreen);
                            },
                            earningIcon: Iconsax.calendar,
                            containerText: TTexts.earningInsightsTitle,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    SizedBox(
                      height: height *
                          0.36, // Fixed height for the pie chart section
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            FittedBox(
                              child: Text(
                                textAlign: TextAlign.center,
                                TTexts.earningChartTitle,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            const MyPieChart(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: width,
                      height: height * 0.12,
                      decoration: BoxDecoration(
                        color: TColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const FittedBox(
                        child: Row(
                          children: [
                            EarningRateWidget(
                              earningColor: TColors.success,
                              earningRateText: TTexts.earningDrivingRateTitle,
                              percentageText:
                                  TTexts.earningDrivingRatePercentage,
                            ),
                            EarningRateWidget(
                              earningColor: TColors.warning,
                              earningRateText:
                                  TTexts.earningCompletedRidesTitle,
                              percentageText:
                                  TTexts.earningCompletedRidesPercentage,
                            ),
                            EarningRateWidget(
                              earningColor: TColors.error,
                              earningRateText: TTexts.earningRejectedRidesTitle,
                              percentageText:
                                  TTexts.earningRejectedRidesPercentage,
                            ),
                            EarningRateWidget(
                              earningColor: TColors.error,
                              earningRateText: TTexts.earningCanceledRidesTitle,
                              percentageText:
                                  TTexts.earningCanceledRidesPercentage,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          constraints: BoxConstraints.tight(
                            Size.fromHeight(height * 0.5),
                          ),
                          isScrollControlled: false,
                          context: context,
                          builder: (BuildContext context) {
                            return const DriverActivityBreakdownBottomSheet();
                          },
                        );
                      },
                      child: Text(
                        TTexts.earningViewAnalysisTitle,
                        style: Theme.of(context).textTheme.titleLarge!.apply(
                              decoration: TextDecoration.underline,
                              color: TColors.secondary,
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: width,
                      height: height * 0.12,
                      decoration: BoxDecoration(
                        color: TColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  TTexts.earningTargetTitle,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Iconsax.box,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(TTexts.earningTargetSubTitle),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: TColors.primary,
                              ),
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      constraints: BoxConstraints.tight(
                                        Size.fromHeight(height * 0.5),
                                      ),
                                      isScrollControlled: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const EarningTargetBottomsheet();
                                      },
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: TColors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
