import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../routing/driver_routing.dart';
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
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Image(
                    fit: BoxFit.contain,
                    image: AssetImage(
                      TImages.roadWorthinessImaage,
                    ),
                  ),
                ),
              ),
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
    ;
  }
}
