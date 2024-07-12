import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../routing/driver_routing.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class DriverExteriorPictureGuidlineScreen extends StatefulWidget {
  const DriverExteriorPictureGuidlineScreen({super.key});

  @override
  State<DriverExteriorPictureGuidlineScreen> createState() =>
      _DriverExteriorPictureGuidlineScreenState();
}

class _DriverExteriorPictureGuidlineScreenState
    extends State<DriverExteriorPictureGuidlineScreen> {
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
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: TColors.containerBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: TColors.grey,
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
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.go(BGRouteNames.driverUploadInformation);
                  },
                  child: const Text(TTexts.driverTakePhotoButton),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
