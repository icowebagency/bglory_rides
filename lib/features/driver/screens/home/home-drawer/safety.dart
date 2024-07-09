import 'package:flutter/material.dart';

import '../../../../../utils/constants/text_strings.dart';

class SafetyScreen extends StatefulWidget {
  const SafetyScreen({super.key});

  @override
  State<SafetyScreen> createState() => _SafetyScreenState();
}

class _SafetyScreenState extends State<SafetyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: const SafeArea(
        child: Center(
            child: Text(
          TTexts.homeDrawerSafety,
        )),
      ),
    );
  }
}
