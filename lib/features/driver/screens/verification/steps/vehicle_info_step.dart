import 'dart:io';

import 'package:bglory_rides/common/widgets/driver_info_upload_widget.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:bglory_rides/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../general_widgets/custom_drop_down.dart';

class VehicleInfoStep extends StatelessWidget {
  const VehicleInfoStep({
    super.key,
    required this.formKey,
    required String? vehicleSelectedValue,
    required List<String> vehicleManfacturersList,
    required List<String> vehicleModelList,
    required String? vehicleSelectedModel,
    required TextEditingController vehicleYear,
    required TextEditingController vehicleColor,
    required TextEditingController vehiclePlateNumber,
    required this.vehicleExteriorPhoto,
    required this.vehicleInteriorPhoto,
    required this.onSelectVehicleManufacturer,
    required this.onUpateVehicleModel,
    required this.onTakeVehicleExteriorPhoto,
    required this.onTakeVehicleInteriorPhoto,
  })  : _vehicleSelectedValue = vehicleSelectedValue,
        _vehicleList = vehicleManfacturersList,
        _vehicleModelList = vehicleModelList,
        _vehicleSelectedModel = vehicleSelectedModel,
        _vehicleYear = vehicleYear,
        _vehicleColor = vehicleColor,
        _vehiclePlateNumber = vehiclePlateNumber;

  final GlobalKey<FormState> formKey;
  final String? _vehicleSelectedValue;
  final List<String> _vehicleList;
  final List<String> _vehicleModelList;
  final String? _vehicleSelectedModel;
  final TextEditingController _vehicleYear;
  final TextEditingController _vehicleColor;
  final TextEditingController _vehiclePlateNumber;
  final File? vehicleExteriorPhoto;
  final File? vehicleInteriorPhoto;

  final ValueChanged<String?> onSelectVehicleManufacturer;
  final ValueChanged<String?> onUpateVehicleModel;
  final ValueChanged<BuildContext> onTakeVehicleExteriorPhoto;
  final ValueChanged<BuildContext> onTakeVehicleInteriorPhoto;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              TTexts.driverVehicleInformationTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          /// Driver manufacturer
          Text(
            TTexts.driverVehicleManufacturerTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          ValidatedDropdown(
            dropdownColor: TColors.grey,
            initialValue: _vehicleSelectedValue,
            decoration: const InputDecoration(
              hintText: 'Select one',
              prefixIcon: Icon(
                Iconsax.car,
                color: TColors.primary,
              ),
              filled: true,
              fillColor: TColors.containerBackgroundColor,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: TColors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: TColors.primary),
              ),
            ),
            icon: Icon(
              Iconsax.arrow_down_14,
              color: TColors.primary.withOpacity(0.4),
            ),
            items: _vehicleList,
            onChanged: (val) {
              onSelectVehicleManufacturer(val);
            },
            validator: TValidator.simpleInputValidation,
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          /// Driver Vehicle Model
          Text(
            TTexts.driverVehicleModelTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          ValidatedDropdown(
            initialValue: _vehicleSelectedModel,
            dropdownColor: TColors.grey,
            decoration: const InputDecoration(
              hintText: 'Select one',
              prefixIcon: Icon(
                Iconsax.car,
                color: TColors.primary,
              ),
              filled: true,
              fillColor: TColors.containerBackgroundColor,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: TColors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: TColors.primary),
              ),
            ),
            icon: Icon(
              Iconsax.arrow_down_14,
              color: TColors.primary.withOpacity(0.4),
            ),
            items: _vehicleModelList,
            onChanged: (val) {
              onUpateVehicleModel(val);
            },
            validator: TValidator.simpleInputValidation,
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          /// Vehicle year
          Text(
            TTexts.driverVehicleYearTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          TextFormField(
            controller: _vehicleYear,
            keyboardType: TextInputType.text,
            validator: TValidator.validNumber,
            decoration: InputDecoration(
              hintText: 'e.g 2019',
              hintStyle: Theme.of(context).textTheme.bodySmall,
              fillColor: TColors.containerBackgroundColor,
              filled: true,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: TColors.grey,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: TColors.primary),
              ),
            ),
          ),

          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          /// Vehicle Color
          Text(
            TTexts.vehicleColorTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          TextFormField(
            controller: _vehicleColor,
            keyboardType: TextInputType.text,
            validator: TValidator.simpleInputValidation,
            decoration: InputDecoration(
              hintText: 'e.g White',
              hintStyle: Theme.of(context).textTheme.bodySmall,
              fillColor: TColors.containerBackgroundColor,
              filled: true,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: TColors.grey,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: TColors.primary),
              ),
            ),
          ),

          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          /// Vehicle Plate Number
          Text(
            TTexts.driverVehiclePlateNumberTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          TextFormField(
            controller: _vehiclePlateNumber,
            keyboardType: TextInputType.text,
            validator: TValidator.simpleInputValidation,
            decoration: InputDecoration(
              hintText: 'e.g AA123BBB',
              hintStyle: Theme.of(context).textTheme.bodySmall,
              fillColor: TColors.containerBackgroundColor,
              filled: true,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: TColors.grey,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: TColors.primary),
              ),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          /// Exterior picture of your car
          Text(
            TTexts.driverVehicleExteriorPictureTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          DriverInfoUploadWidget(
            photo: vehicleExteriorPhoto,
            onTapNav: () {
              onTakeVehicleExteriorPhoto(context);
            },
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          /// Interior picture of your car
          Text(
            TTexts.driverVehicleInteriorPictureTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          DriverInfoUploadWidget(
            photo: vehicleInteriorPhoto,
            onTapNav: () {
              onTakeVehicleInteriorPhoto(context);
            },
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
        ],
      ),
    );
  }
}
