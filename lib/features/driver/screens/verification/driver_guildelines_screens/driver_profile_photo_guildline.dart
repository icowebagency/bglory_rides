import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../routing/driver_routing.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class DriverProfileUploadGuidelineScreen extends StatefulWidget {
  const DriverProfileUploadGuidelineScreen({super.key});

  @override
  State<DriverProfileUploadGuidelineScreen> createState() =>
      _DriverProfileUploadGuidelineScreenState();
}

class _DriverProfileUploadGuidelineScreenState
    extends State<DriverProfileUploadGuidelineScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              const Center(
                child: Image(
                  width: 150,
                  height: 100,
                  image: AssetImage(TImages.driverLogo),
                ),
              ),
              Text(
                TTexts.driverPictureUploadTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: TColors.grey,
                  ),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      TImages.user,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                TTexts.driverPhotoUploadInst,
                style: Theme.of(context).textTheme.bodyLarge!.apply(
                      color: TColors.linkRedColor,
                    ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                TTexts.driverPhotoUploadInstTw,
                style: Theme.of(context).textTheme.bodyLarge!.apply(
                      color: TColors.linkRedColor,
                    ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.go(BGRouteNames.driverOption);
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
