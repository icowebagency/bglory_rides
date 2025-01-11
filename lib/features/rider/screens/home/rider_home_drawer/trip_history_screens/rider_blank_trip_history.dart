import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/constants/text_strings.dart';

class RiderBlankTripHistoryScreen extends StatefulWidget {
  const RiderBlankTripHistoryScreen({super.key});

  @override
  State<RiderBlankTripHistoryScreen> createState() =>
      _RiderBlankTripHistoryScreenState();
}

class _RiderBlankTripHistoryScreenState
    extends State<RiderBlankTripHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(0),
                  width: width,
                  height: height * 0.2,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFECF8F3),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.warning_amber_rounded,
                      size: 60,
                      color: TColors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Text(
                  textAlign: TextAlign.center,
                  TTexts.riderBlankTripTitle,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: TColors.darkGrey),
                ),
                Text(
                  textAlign: TextAlign.center,
                  TTexts.riderBlankTripSubTitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                SaveButtonWidget(
                  buttonText: TTexts.driverBookTripTitle,
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
