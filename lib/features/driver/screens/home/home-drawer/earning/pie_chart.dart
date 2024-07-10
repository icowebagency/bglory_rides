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
            titleStyle: const TextStyle(
              color: TColors.white,
              fontWeight: FontWeight.w600,
            ),
            value: 30,
            showTitle: true,
            radius: 50,
            color: TColors.info,
          ),
          PieChartSectionData(
            titleStyle: const TextStyle(
              color: TColors.white,
              fontWeight: FontWeight.w600,
            ),
            value: 10,
            color: TColors.primary,
          ),
          PieChartSectionData(
            titleStyle: const TextStyle(
              color: TColors.white,
              fontWeight: FontWeight.w600,
            ),
            value: 20,
            color: TColors.linkBlueColor,
          ),
          PieChartSectionData(
            titleStyle: const TextStyle(
              color: TColors.white,
              fontWeight: FontWeight.w600,
            ),
            value: 40,
            color: TColors.warning,
          ),
        ],
      ),
    );
  }
}
