import 'package:bglory_rides/routing/driver_routing.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../utils/constants/colors.dart';

class DriverDocumentScreen extends StatefulWidget {
  const DriverDocumentScreen({super.key});

  @override
  State<DriverDocumentScreen> createState() => _DriverDocumentScreenState();
}

class _DriverDocumentScreenState extends State<DriverDocumentScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(TTexts.driverDocumentTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            const Text(TTexts.driverSubDocumentText),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            //driver license and upload mark
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(TTexts.driverLicenseTitleTwo),
                FittedBox(
                  child: Row(
                    children: [
                      Text(
                        TTexts.driverUploadNotification,
                        style: Theme.of(context).textTheme.bodySmall!.apply(
                              overflow: TextOverflow.ellipsis,
                              color: TColors.primary,
                            ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.verified,
                        color: TColors.primary,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            // Driver license details section
            Container(
              width: width,
              decoration: BoxDecoration(
                color: TColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      TTexts.documentLicenseFormTitle,
                      style: Theme.of(context).textTheme.titleLarge!.apply(
                            color: TColors.grey,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // license number
                    Text(
                      TTexts.documentLicenseFormNumber,
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    // expiry date
                    Text(
                      TTexts.documentExpiryDateTitle,
                      style: Theme.of(context).textTheme.titleLarge!.apply(
                            color: TColors.grey,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      TTexts.documentExpiryDate,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    // license photo
                    Text(
                      TTexts.documentLicensePhotoDemoTitle,
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                            color: TColors.grey,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.photo_library_outlined),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          TTexts.documentLicensePhotoDemoText,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    const Divider(
                      color: TColors.grey,
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    DriverEditButton(
                      onTap: () {
                        context.go(BGRouteNames.driverAccountScreen);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DriverEditButton extends StatelessWidget {
  const DriverEditButton({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Iconsax.edit,
            size: 20,
            color: TColors.primary,
          ),
          TextButton(
            onPressed: onTap,
            child: Text(
              TTexts.profileEdit,
              style: Theme.of(context).textTheme.titleLarge!.apply(
                    color: TColors.buttonPrimaryDeepGreen,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
