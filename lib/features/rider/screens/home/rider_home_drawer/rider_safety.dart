import 'package:flutter/material.dart';

class RiderSafetyScreen extends StatefulWidget {
  const RiderSafetyScreen({super.key});

  @override
  State<RiderSafetyScreen> createState() => _RiderSafetyScreenState();
}

class _RiderSafetyScreenState extends State<RiderSafetyScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Safety')),
    );
  }
}
