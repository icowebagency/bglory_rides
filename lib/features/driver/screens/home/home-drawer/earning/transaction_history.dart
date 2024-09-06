import 'package:bglory_rides/features/driver/screens/home/home-drawer/earning/history_tab/daily_history.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/earning/history_tab/monthly_history.dart';
import 'package:bglory_rides/features/driver/screens/home/home-drawer/earning/history_tab/weekly_history.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(TTexts.transactionHistoryAppBarTitle),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Column(
            children: [
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
                    DailyHistoryTab(),
                    WeeklyHistoryTab(),
                    MonthlyHistoryTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
