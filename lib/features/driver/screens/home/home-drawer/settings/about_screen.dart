import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TTexts.aboutAppBarTitle),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            TTexts.aboutFooterTitle,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 13,
                  color: TColors.darkGrey.withOpacity(0.5),
                ),
          ),
        ),
      ),
    );
  }
}
