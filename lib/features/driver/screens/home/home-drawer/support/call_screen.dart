import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/image_strings.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../utils/constants/text_strings.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Center(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: TColors.white,
                backgroundImage: AssetImage(TImages.user),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                TTexts.driverCallScreenTitle,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                TTexts.driverCallScreenCallingTitle,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const Spacer(),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                        color: TColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Iconsax.microphone,
                          color: TColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                        color: TColors.error,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Iconsax.call,
                          color: TColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                        color: TColors.darkGrey,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Iconsax.volume_high,
                          color: TColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections * 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
