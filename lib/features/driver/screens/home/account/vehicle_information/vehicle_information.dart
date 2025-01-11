import 'package:bglory_rides/routing/driver_routing.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../drivers_document/driver_document.dart';

class VehicleInformationScreen extends StatelessWidget {
  const VehicleInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(TTexts.vehicleInformationAppBarTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            const Text(TTexts.vehicleInformationSubTitle),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            //driver license and upload mark
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(TTexts.vehicleInformationAppBarTitle),
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
                        Icons.verified_outlined,
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
                      TTexts.vehicleManufacturerTitle,
                      style: Theme.of(context).textTheme.titleLarge!.apply(
                            color: TColors.grey,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // license number
                    Text(
                      TTexts.vehicleManufacturer,
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    // expiry date
                    Text(
                      TTexts.vehicleModelTitle,
                      style: Theme.of(context).textTheme.titleLarge!.apply(
                            color: TColors.grey,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      TTexts.vehicleModel,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    // expiry date
                    Text(
                      TTexts.vehicleColorTitle,
                      style: Theme.of(context).textTheme.titleLarge!.apply(
                            color: TColors.grey,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      TTexts.vehicleColor,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    // expiry date
                    Text(
                      TTexts.vehicleNumberTitle,
                      style: Theme.of(context).textTheme.titleLarge!.apply(
                            color: TColors.grey,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      TTexts.vehicleNumber,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    // license photo
                    Text(
                      TTexts.vehicleExteriorTitle,
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
                          TTexts.vehicleExteriorDemoText,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    Text(
                      TTexts.vehicleInteriorTitle,
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
                          TTexts.vehicleInteriorDemoText,
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
                        context.go(BGDriverRouteNames.vehicleInformationEdit);
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
