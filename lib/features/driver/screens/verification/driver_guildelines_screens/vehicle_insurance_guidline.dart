import 'dart:io';

import 'package:bglory_rides/features/driver/general-widgets/take_photo_buttons.dart';
import 'package:bglory_rides/features/driver/screens/verification/driver_guildelines_screens/driver_interior_picture_guideline.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class VehicleInsuranceGuidline extends StatefulWidget {
  const VehicleInsuranceGuidline({super.key});

  @override
  State<VehicleInsuranceGuidline> createState() =>
      _VehicleInsuranceGuidlineState();
}

class _VehicleInsuranceGuidlineState extends State<VehicleInsuranceGuidline> {
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
          child: Column(
            children: [
              const Center(
                child: Image(
                  width: 100,
                  height: 100,
                  image: AssetImage(TImages.driverLogo),
                ),
              ),
              Text(
                TTexts.vehicleInsuranceGuidelineTitle,
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
                      TImages.roadWorthinessImaage,
                    ),
                  )),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Text(
                TTexts.driverInsuranceRuleeOne,
                style: Theme.of(context).textTheme.bodyLarge!.apply(
                      color: TColors.linkRedColor,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                TTexts.driverInsuranceRuleeTwo,
                style: Theme.of(context).textTheme.bodyLarge!.apply(
                      color: TColors.linkRedColor,
                    ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const Spacer(),
              TakePhotoButtons(
                photo: photo,
                onUpdatePhoto: (value) {
                  photo = value;
                  setState(() {});
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
