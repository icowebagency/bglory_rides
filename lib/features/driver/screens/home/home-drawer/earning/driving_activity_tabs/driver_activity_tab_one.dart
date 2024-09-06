import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

import '../widgets/driving_activity_breakdown_table_widget.dart';

class DriverActivityTabOne extends StatefulWidget {
  const DriverActivityTabOne({super.key});

  @override
  State<DriverActivityTabOne> createState() => _DriverActivityTabOneState();
}

class _DriverActivityTabOneState extends State<DriverActivityTabOne> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            DrivingActivityTableWidget(
              title: TTexts.drivingActivityDriveRateTitle,
              percentage: TTexts.drivingActivityDriveRatePercentage,
            ),
            Divider(),
            DrivingActivityTableWidget(
              title: TTexts.drivingActivityRideTargetTitle,
              percentage: TTexts.drivingActivityRideTargetPercentage,
            ),
            Divider(),
            DrivingActivityTableWidget(
              title: TTexts.drivingActivityCompletedRidesTitle,
              percentage: TTexts.drivingActivityCompletedRidesPercentage,
            ),
            Divider(),
            DrivingActivityTableWidget(
              title: TTexts.drivingActivityRejectedRidesTitle,
              percentage: TTexts.drivingActivityRejectedRidesPercentage,
            ),
            Divider(),
            DrivingActivityTableWidget(
              title: TTexts.drivingActivityCancelledRidesTitle,
              percentage: TTexts.drivingActivityCancelledRidesPercentage,
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
