import 'package:bglory_rides/features/driver/screens/home/home-drawer/earning/driving_activity_tabs/driver_activity_tab_one.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/earning/driving_activity_tabs/driver_activity_tab_three.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/earning/driving_activity_tabs/driver_activity_tab_two.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';

class DriverActivityBreakdownBottomSheet extends StatelessWidget {
  const DriverActivityBreakdownBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(TTexts.drivingActivityTitle,
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: TSizes.spaceBtwItems),
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
                  DriverActivityTabOne(),
                  DriverActivityTabTwo(),
                  DriverActivityTabThree()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
