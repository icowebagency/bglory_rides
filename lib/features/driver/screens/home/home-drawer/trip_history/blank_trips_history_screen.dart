import 'package:bglory_rides/features/driver/general-widgets/save_button_widget.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/constants/text_strings.dart';

class BlankTripHistoryScreen extends StatefulWidget {
  const BlankTripHistoryScreen({super.key});

  @override
  State<BlankTripHistoryScreen> createState() => _BlankTripHistoryScreenState();
}

class _BlankTripHistoryScreenState extends State<BlankTripHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          TTexts.blankTripHistoryAppBarTitle,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(0),
                  width: width * 0.4,
                  height: height * 0.4,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: TColors.grey.withOpacity(0.5),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.warning_amber_rounded,
                      size: 60,
                      color: TColors.grey,
                    ),
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  TTexts.blankTripHistoryTitle,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: TColors.darkGrey),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Text(
                  textAlign: TextAlign.center,
                  TTexts.blankTripHistorySubTitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                SaveButtonWidget(
                  buttonText: TTexts.blankTripHistoryButtonText,
                  onTap: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
