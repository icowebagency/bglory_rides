import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../general_widgets/take_photo_buttons.dart';

class DriverMotorcyclePictureGuidelineScreen extends StatefulWidget {
  const DriverMotorcyclePictureGuidelineScreen({super.key});

  @override
  State<DriverMotorcyclePictureGuidelineScreen> createState() =>
      _DriverMotorcyclePictureGuidelineScreenState();
}

class _DriverMotorcyclePictureGuidelineScreenState
    extends State<DriverMotorcyclePictureGuidelineScreen> {
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
                  TTexts.driverMotorcyclePictureTitle,
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
                  TTexts.driverMotorcyleRules,
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

class ModerateImageView extends StatelessWidget {
  const ModerateImageView({
    super.key,
    required this.photo,
    this.defaultImage,
  });

  final File? photo;

  final Image? defaultImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        color: TColors.containerBackgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: TColors.grey,
        ),
      ),
      child: photo == null
          ? defaultImage
          : ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                fit: BoxFit.cover,
                image: FileImage(
                  photo!,
                ) as ImageProvider,
              ),
            ),
    );
  }
}

class ImageViewWithProvider extends StatelessWidget {
  const ImageViewWithProvider({
    super.key,
    required this.photo,
    this.defaultImage,
  });

  final File? photo;

  final ImageProvider? defaultImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        color: TColors.containerBackgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: TColors.grey,
        ),
        image: defaultImage == null
            ? null
            : DecorationImage(
                fit: BoxFit.cover,
                image: photo == null
                    ? defaultImage as ImageProvider
                    : FileImage(photo!) as ImageProvider,
              ),
      ),
    );
  }
}
