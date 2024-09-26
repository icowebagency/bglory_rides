import 'dart:io';
import 'package:bglory_rides/common/widgets/driver_info_upload_widget.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:bglory_rides/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DriverLicenseInfo extends StatelessWidget {
  const DriverLicenseInfo({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController licenseNumber,
    required TextEditingController licenseExpiry,
    required this.driversLicensePhoto,
    required this.onPickDriverLicenseExpiryDate,
    required this.onPickDriverLicensePhoto,
    this.autovalidateMode = AutovalidateMode.disabled,
  })  : _formKey = formKey,
        _licenseNumber = licenseNumber,
        _licenseExpiry = licenseExpiry;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _licenseNumber;
  final TextEditingController _licenseExpiry;
  final File? driversLicensePhoto;
  final void Function(BuildContext context) onPickDriverLicenseExpiryDate;
  final void Function(BuildContext context) onPickDriverLicensePhoto;
  final AutovalidateMode autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              textAlign: TextAlign.center,
              TTexts.driverlicenseTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),

          /// License number
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          Text(
            TTexts.driverlicenseNumber,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          TextFormField(
            controller: _licenseNumber,
            keyboardType: TextInputType.number,
            validator: TValidator.simpleInputValidation,
            decoration: InputDecoration(
              hintText: TTexts.driverlicenseNumberhint,
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
            height: TSizes.spaceBtwItems,
          ),

          /// Expiry date
          Text(
            TTexts.driverlicenseExpireyDate,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          TextFormField(
            controller: _licenseExpiry,
            keyboardType: TextInputType.number,
            validator: TValidator.simpleInputValidation,
            decoration: const InputDecoration(
              labelText: 'Select Date',
              prefixIcon: Icon(
                Iconsax.calendar,
                color: TColors.primary,
              ),
              fillColor: TColors.containerBackgroundColor,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: TColors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: TColors.primary),
              ),
            ),
            readOnly: true,
            onTap: () {
              onPickDriverLicenseExpiryDate(context);
            },
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          /// License Upload
          Text(
            TTexts.driverlicensePhoto,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          DriverInfoUploadWidget(
            photo: driversLicensePhoto,
            onTapNav: () {
              onPickDriverLicensePhoto(context);
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
