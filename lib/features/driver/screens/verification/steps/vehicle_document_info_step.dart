import 'dart:io';
import 'package:bglory_rides/common/widgets/driver_info_upload_widget.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class VehicleDocumentInfoStep extends StatelessWidget {
  const VehicleDocumentInfoStep({
    super.key,
    required this.proofOfOwnershipPhoto,
    required this.vehicleLicensePhoto,
    required this.roadWorthinessPhoto,
    required this.vehicleInsurancePhoto,
    required this.onTakeProofOfOwnershipPhoto,
    required this.onTakeVehicleLicensePhoto,
    required this.onTakeRoadWorthinessPhoto,
    required this.onTakeVehicleInsurancePhoto,
  });

  final File? proofOfOwnershipPhoto;
  final File? vehicleLicensePhoto;
  final File? roadWorthinessPhoto;
  final File? vehicleInsurancePhoto;

  final ValueChanged<BuildContext> onTakeProofOfOwnershipPhoto;
  final ValueChanged<BuildContext> onTakeVehicleLicensePhoto;
  final ValueChanged<BuildContext> onTakeRoadWorthinessPhoto;
  final ValueChanged<BuildContext> onTakeVehicleInsurancePhoto;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            TTexts.driverVehicleDocumentInformationTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),

        /// Proof of ownership certificate
        Text(
          TTexts.driverVehicleProofOfOwnership,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        DriverInfoUploadWidget(
            photo: proofOfOwnershipPhoto,
            onTapNav: () {
              onTakeProofOfOwnershipPhoto(context);
            }),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),

        /// Vehicle license
        Text(
          TTexts.driverVehicleLicense,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        DriverInfoUploadWidget(
          photo: vehicleLicensePhoto,
          onTapNav: () {
            onTakeVehicleLicensePhoto(context);
          },
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),

        /// certificate of road worthiness
        Text(
          TTexts.driverRoadWorthinessTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        DriverInfoUploadWidget(
            photo: roadWorthinessPhoto,
            onTapNav: () {
              onTakeRoadWorthinessPhoto(context);
            }),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),

        /// Vehicle insurance
        Text(
          TTexts.driverVehicleInsurance,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        DriverInfoUploadWidget(
          photo: vehicleInsurancePhoto,
          onTapNav: () {
            onTakeVehicleInsurancePhoto(context);
          },
        ),

        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
      ],
    );
  }
}
