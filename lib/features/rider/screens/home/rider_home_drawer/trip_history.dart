import 'package:flutter/material.dart';

class RiderTripHistoryScreen extends StatefulWidget {
  const RiderTripHistoryScreen({super.key});

  @override
  State<RiderTripHistoryScreen> createState() => _RiderTripHistoryScreenState();
}

class _RiderTripHistoryScreenState extends State<RiderTripHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Trip history')),
    );
  }
}
