import 'dart:io';

import 'package:bglory_rides/features/driver/screens/verification/driver_guildelines_screens/driver_interior_picture_guideline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../general_widgets/take_photo_buttons.dart';

class DriverProfileUploadGuidelineScreen extends ConsumerStatefulWidget {
  const DriverProfileUploadGuidelineScreen({super.key});

  @override
  ConsumerState<DriverProfileUploadGuidelineScreen> createState() =>
      _DriverProfileUploadGuidelineScreenState();
}

class _DriverProfileUploadGuidelineScreenState
    extends ConsumerState<DriverProfileUploadGuidelineScreen> {
  File? profilePicture;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
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
                Text(
                  TTexts.driverPictureUploadTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                ImageViewWithProvider(
                  photo: profilePicture,
                  defaultImage: const AssetImage(
                    TImages.user,
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
                TakePhotoButtons(
                  photo: profilePicture,
                  onUpdatePhoto: (value) {
                    profilePicture = value;

                    setState(() {});
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
