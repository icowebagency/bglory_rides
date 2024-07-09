import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyPieChart extends StatelessWidget {
  const MyPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            showTitle: true,
            radius: 50,
            color: TColors.info,
          ),
          PieChartSectionData(
            color: TColors.primary,
          ),
          PieChartSectionData(
            color: TColors.linkBlueColor,
          ),
          PieChartSectionData(
            color: TColors.warning,
          ),
        ],
      ),
    );
  }
}
