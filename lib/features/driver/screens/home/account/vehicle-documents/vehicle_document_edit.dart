import 'package:bglory_rides/common/widgets/driver_info_upload_widget.dart';
import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../routing/driver_routing.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';

class VehicleDocumentsEditScreen extends StatefulWidget {
  const VehicleDocumentsEditScreen({super.key});

  @override
  State<VehicleDocumentsEditScreen> createState() =>
      _VehicleDocumentsEditScreenState();
}

class _VehicleDocumentsEditScreenState
    extends State<VehicleDocumentsEditScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        //  vehicle document app bar title
        title: const Text(TTexts.vehicleDocumentAppBarTitleEdit),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // vehicle document sub title
              const Text(TTexts.vehicleDocumentSubTitle),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              Text(
                TTexts.vehicleDocumentTitle,
                style: Theme.of(context).textTheme.titleLarge,
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
                      //  vehicle document proof of ownership certificate
                      Text(
                        TTexts.vehicleDocumentProofOfOwnershipCertificateTitle,
                        style: Theme.of(context).textTheme.titleLarge!.apply(
                              color: TColors.grey,
                            ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwInputFields,
                      ),
                      // license number
                      Row(
                        children: [
                          const Icon(Icons.photo_library_outlined),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            TTexts
                                .vehicleDocumentProofOfOwnershipCertificateText,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwInputFields,
                      ),
                      DriverInfoUploadWidget(onTapNav: () {}),

                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      //  vehicle document license
                      Text(
                        TTexts.vehicleDocumentLicenseTitle,
                        style: Theme.of(context).textTheme.titleLarge!.apply(
                              color: TColors.grey,
                            ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwInputFields,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.photo_library_outlined),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            TTexts.vehicleDocumentLicenseText,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwInputFields,
                      ),
                      DriverInfoUploadWidget(onTapNav: () {}),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      //  vehicle document road worthiness
                      Text(
                        TTexts.vehicleDocumentCertificateOfRoadWorthinessTitle,
                        style: Theme.of(context).textTheme.titleLarge!.apply(
                              color: TColors.grey,
                            ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwInputFields,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.photo_library_outlined),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            TTexts
                                .vehicleDocumentCertificateOfRoadWorthinessText,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwInputFields,
                      ),
                      DriverInfoUploadWidget(onTapNav: () {}),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      //  vehicle document insurance
                      Text(
                        TTexts.vehicleDocumentVehicleInsuranceTitle,
                        style: Theme.of(context).textTheme.titleLarge!.apply(
                              color: TColors.grey,
                            ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwInputFields,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.photo_library_outlined),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            TTexts.vehicleDocumentVehicleInsuranceText,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwInputFields,
                      ),
                      DriverInfoUploadWidget(onTapNav: () {}),
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
                      SaveButtonWidget(onTap: () {
                        context.go(BGRouteNames.driverAccountScreen);
                      })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
