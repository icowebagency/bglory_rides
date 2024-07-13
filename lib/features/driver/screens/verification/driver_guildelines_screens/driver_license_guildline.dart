import 'dart:io';

import 'package:bglory_rides/utils/device/camera_utitliy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class DriverlicenseGuidlineScreen extends ConsumerStatefulWidget {
  const DriverlicenseGuidlineScreen({super.key});

  @override
  ConsumerState<DriverlicenseGuidlineScreen> createState() =>
      _DriverlicenseGuidlineScreenState();
}

class _DriverlicenseGuidlineScreenState
    extends ConsumerState<DriverlicenseGuidlineScreen> {
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
                  TTexts.driverLisenseGuidelineTitle,
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: photo != null ? 0 : 10.0,
                    ),
                    child: Image(
                      fit: BoxFit.cover,
                      image: photo == null
                          ? const AssetImage(
                              TImages.licenseDriverImage,
                            )
                          : FileImage(
                              photo!,
                            ) as ImageProvider,
                    ),
                  ),
                ),
                Text(
                  TTexts.driverLicenseRules,
                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                        color: TColors.linkRedColor,
                      ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Text(
                  TTexts.driverLicenseRulesTwo,
                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                        color: TColors.linkRedColor,
                      ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                Builder(
                  builder: (context) {
                    if (photo == null) {
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            CameraUtitliy.takeImageFromCamera(ref).then(
                              (value) {
                                if (value != null) {
                                  photo = value;

                                  setState(() {});
                                }
                                return;
                              },
                            );
                          },
                          child: const Text(TTexts.driverTakePhotoButton),
                        ),
                      );
                    } else {
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(photo);
                          },
                          child: const Text(TTexts.driverConfirm),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections / 2,
                ),
                if (photo != null)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        CameraUtitliy.takeImageFromCamera(ref).then(
                          (value) {
                            if (value != null) {
                              photo = value;

                              setState(() {});
                            }
                            return;
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: TColors.white,
                      ),
                      child: const Text(
                        TTexts.driverTakeAgain,
                        style: TextStyle(
                          color: TColors.primary,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
