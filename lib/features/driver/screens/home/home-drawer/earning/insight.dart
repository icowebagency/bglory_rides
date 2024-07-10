import 'package:bglory_rides/features/driver/screens/home/home-drawer/earning/tabs/first_tab.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/earning/tabs/second_tab.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/earning/tabs/third_tab.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/constants/sizes.dart';

class InsightScreen extends StatefulWidget {
  const InsightScreen({super.key});

  @override
  State<InsightScreen> createState() => _InsightScreenState();
}

class _InsightScreenState extends State<InsightScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: true,
          title: const Text(TTexts.insightAppBarTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  TTexts.insightSubTitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  TTexts.insightAmountTitle,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  TTexts.insightSubText,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                TabBar(
                  dividerColor: Colors.transparent,
                  indicatorColor: TColors.primary,
                  labelColor: TColors.secondary,
                  unselectedLabelColor: TColors.black,
                  labelStyle: Theme.of(context).textTheme.bodyLarge,
                  enableFeedback: true,
                  tabs: const [
                    Tab(
                      text: 'Daily',
                    ),
                    Tab(
                      text: 'Weekly',
                    ),
                    Tab(
                      text: 'Monthly',
                    ),
                  ],
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      FirstTab(),
                      SecondTab(),
                      ThirdTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
