import 'package:flutter/material.dart';

import '../../../../../utils/constants/text_strings.dart';

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({super.key});

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: const SafeArea(
        child: Center(
            child: Text(
          TTexts.homeDrawerSupport,
        )),
      ),
    );
  }
}
