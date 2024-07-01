import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/text_strings.dart';

class DriverInfoUploadWidget extends StatelessWidget {
  const DriverInfoUploadWidget({required this.onTapNav});
  final VoidCallback onTapNav;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapNav,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.12,
        decoration: BoxDecoration(
          color: TColors.grey.withOpacity(0.4),
          border: Border.all(
            color: TColors.darkGrey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Iconsax.image,
              size: 40,
            ),
            SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(TTexts.driverUploadImageTitle),
          ],
        ),
      ),
    );
  }
}
