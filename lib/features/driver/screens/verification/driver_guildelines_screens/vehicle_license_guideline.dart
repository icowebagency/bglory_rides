import 'dart:io';

import 'package:bglory_rides/features/driver/screens/verification/driver_guildelines_screens/driver_interior_picture_guideline.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../general_widgets/take_photo_buttons.dart';

class DriverVehicleLicenseScreen extends StatefulWidget {
  const DriverVehicleLicenseScreen({super.key});

  @override
  State<DriverVehicleLicenseScreen> createState() =>
      _DriverVehicleLicenseScreenState();
}

class _DriverVehicleLicenseScreenState
    extends State<DriverVehicleLicenseScreen> {
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
                  TTexts.driverVehicleLicenseTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                ModerateImageView(
                  photo: photo,
                  defaultImage: const Image(
                    fit: BoxFit.contain,
                    image: AssetImage(
                      TImages.vehicleLicenseImage,
                    ),
                  ),
                ),
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
