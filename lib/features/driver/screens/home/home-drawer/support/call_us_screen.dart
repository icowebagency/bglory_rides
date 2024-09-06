import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/image_strings.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CallUsScreen extends StatefulWidget {
  const CallUsScreen({super.key});

  @override
  State<CallUsScreen> createState() => _CallUsScreenState();
}

class _CallUsScreenState extends State<CallUsScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(TTexts.callUsAppBarTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Lottie.asset(
              fit: BoxFit.contain,
              TImages.callUsAnim,
            ),
            // heading text
            Text(
              TTexts.callUsHeadlineTitle,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: TColors.primary,
                    fontSize: 25,
                  ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            // Subtext
            Text(
              textAlign: TextAlign.center,
              TTexts.callUsHeadlineSubText,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            // phone number
            TextButton(
              onPressed: () {},
              child: Text(
                TTexts.callUsNumberTitle,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: TColors.primary,
                      fontSize: 20,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
