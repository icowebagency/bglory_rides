import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/text_strings.dart';

class DriverInfoUploadWidget extends StatelessWidget {
  const DriverInfoUploadWidget({super.key, required this.onTapNav, this.photo});
  final VoidCallback onTapNav;
  final File? photo;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapNav,
      child: DottedBorder(
        borderType: BorderType.Rect,
        strokeWidth: 0.8,
        dashPattern: const [
          8,
          3,
        ],
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * 0.13,
          decoration: const BoxDecoration(
            color: TColors.containerBackgroundColor,
          ),
          child: Builder(builder: (context) {
            if (photo != null) {
              return Image.file(photo!);
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Iconsax.image,
                  size: 30,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Text(
                  TTexts.driverUploadImageTitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
