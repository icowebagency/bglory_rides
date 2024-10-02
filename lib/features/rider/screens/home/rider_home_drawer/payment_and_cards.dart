import 'package:flutter/material.dart';

class PaymentAndCardsScreen extends StatefulWidget {
  const PaymentAndCardsScreen({super.key});

  @override
  State<PaymentAndCardsScreen> createState() => _PaymentAndCardsScreenState();
}

class _PaymentAndCardsScreenState extends State<PaymentAndCardsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Payment and card')),
    );
  }
}
