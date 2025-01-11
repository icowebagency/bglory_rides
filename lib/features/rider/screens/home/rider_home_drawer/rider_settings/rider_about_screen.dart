import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/image_strings.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class RiderAboutScreen extends StatefulWidget {
  const RiderAboutScreen({super.key});

  @override
  State<RiderAboutScreen> createState() => _RiderAboutScreenState();
}

class _RiderAboutScreenState extends State<RiderAboutScreen> {
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
        child: Column(
          children: [
            const SizedBox(
              height: 70,
              child: Image(
                image: AssetImage(
                  TImages.lightAppLogo,
                ),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                TTexts.aboutFooterTitle,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 13,
                      color: TColors.darkGrey.withOpacity(0.5),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
