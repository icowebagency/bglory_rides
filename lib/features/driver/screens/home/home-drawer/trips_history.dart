import 'package:flutter/material.dart';

import '../../../../../utils/constants/text_strings.dart';

class TripHistoryScreen extends StatefulWidget {
  const TripHistoryScreen({super.key});

  @override
  State<TripHistoryScreen> createState() => _TripHistoryScreenState();
}

class _TripHistoryScreenState extends State<TripHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: Center(
            child: Text(
          TTexts.homeDrawerTripHistory,
        )),
      ),
    );
  }
}
