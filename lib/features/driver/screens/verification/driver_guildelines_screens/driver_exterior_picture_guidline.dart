import 'dart:io';

import 'package:bglory_rides/features/driver/screens/verification/driver_guildelines_screens/driver_interior_picture_guideline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../general-widgets/take_photo_buttons.dart';

class DriverExteriorPictureGuidlineScreen extends ConsumerStatefulWidget {
  const DriverExteriorPictureGuidlineScreen({super.key});

  @override
  ConsumerState<DriverExteriorPictureGuidlineScreen> createState() =>
      _DriverExteriorPictureGuidlineScreenState();
}

class _DriverExteriorPictureGuidlineScreenState
    extends ConsumerState<DriverExteriorPictureGuidlineScreen> {
  File? photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Center(
                  child: Image(
                    width: 100,
                    height: 100,
                    image: AssetImage(TImages.driverLogo),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                Text(
                  TTexts.driverVehicleExteriorPictureTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                ModerateImageView(photo: photo),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                Text(
                  TTexts.driverExteriorRules,
                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                        color: TColors.linkRedColor,
                      ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Text(
                  TTexts.driverExteriorRulesTwo,
                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                        color: TColors.linkRedColor,
                      ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                TakePhotoButtons(
                  photo: photo,
                  onUpdatePhoto: (value) {
                    setState(() {
                      photo = value;
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
