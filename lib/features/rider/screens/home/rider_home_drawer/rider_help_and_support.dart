import 'package:flutter/material.dart';

class RiderHelpAndSupportScreen extends StatefulWidget {
  const RiderHelpAndSupportScreen({super.key});

  @override
  State<RiderHelpAndSupportScreen> createState() =>
      _RiderHelpAndSupportScreenState();
}

class _RiderHelpAndSupportScreenState extends State<RiderHelpAndSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Rider help and support')),
    );
  }
}
