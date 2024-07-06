import 'package:flutter/material.dart';

import '../../../../../utils/constants/text_strings.dart';

class EarningsScreen extends StatefulWidget {
  const EarningsScreen({super.key});

  @override
  State<EarningsScreen> createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        body: const SafeArea(
          child: Center(
              child: Text(
            TTexts.homeDrawerEarnings,
          )),
        ),
      ),
    );
  }
}
