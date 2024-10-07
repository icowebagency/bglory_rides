import 'dart:io';

import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/image_strings.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:bglory_rides/utils/helpers/helper_functions.dart';
import 'package:bglory_rides/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

import '../../../general_widgets/custom_drop_down.dart';

class DriverInfoStep extends StatelessWidget {
  const DriverInfoStep({
    super.key,
    required this.profilePic,
    required GlobalKey<FormState> formKey,
    required TextEditingController fullname,
    required TextEditingController address,
    required TextEditingController dateOfBirth,
    required String? selectedGender,
    required List<String> genderList,
    required TextEditingController nextOfKin,
    required TextEditingController nextOfKinPhone,
    required this.onUpdateGender,
    required this.onUpdateProfilePicture,
    required this.onPickDateofBirth,
    this.autovalidateMode = AutovalidateMode.disabled,
  })  : _formKey = formKey,
        _fullname = fullname,
        _address = address,
        _dateOfBirth = dateOfBirth,
        _selectedGender = selectedGender,
        _genderList = genderList,
        _nextOfKin = nextOfKin,
        _nextOfKinPhone = nextOfKinPhone;

  final File? profilePic;
  final GlobalKey<FormState> _formKey;
  final TextEditingController _fullname;
  final TextEditingController _address;
  final TextEditingController _dateOfBirth;
  final String? _selectedGender;
  final List<String> _genderList;
  final TextEditingController _nextOfKin;
  final TextEditingController _nextOfKinPhone;
  final void Function(String? val) onUpdateGender;
  final void Function(BuildContext context) onUpdateProfilePicture;
  final Future<void> Function(BuildContext context) onPickDateofBirth;
  final AutovalidateMode autovalidateMode;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            TTexts.driverInformationTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        Center(
          child: Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: GestureDetector(
              onTap: () {
                onUpdateProfilePicture(context);
              },
              child: profilePic == null
                  ? Lottie.asset(
                      fit: BoxFit.contain,
                      TImages.animUser,
                    )
                  : ClipOval(
                      child: Image.file(
                        profilePic!,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Full name
              Text(
                TTexts.fullName,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TextFormField(
                controller: _fullname,
                keyboardType: TextInputType.name,
                validator: TValidator.simpleInputValidation,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: TColors.grey,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: TColors.primary),
                  ),
                  hintText: TTexts.fullNameHint,
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  fillColor: dark ? TColors.dark : TColors.white,
                  filled: true,
                ),
              ),

              /// Address
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                TTexts.address,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TextFormField(
                controller: _address,
                validator: TValidator.simpleInputValidation,
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                  hintText: TTexts.homeAddressHint,
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  fillColor: dark ? TColors.dark : TColors.white,
                  filled: true,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: TColors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: dark ? TColors.secondary : TColors.primary),
                  ),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                TTexts.dateOfBirth,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Date of birth
              TextFormField(
                controller: _dateOfBirth,
                validator: TValidator.simpleInputValidation,
                decoration: InputDecoration(
                  labelText: 'Select Date Of Birth',
                  prefixIcon: Icon(
                    Iconsax.calendar,
                    color: dark ? TColors.white : TColors.primary,
                  ),
                  fillColor: dark ? TColors.dark : TColors.white,
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
                readOnly: true,
                onTap: () async {
                  await onPickDateofBirth(context);
                },
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Gender
              Text(
                TTexts.genderTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              ValidatedDropdown(
                dropdownColor: dark ? TColors.darkGrey : TColors.grey,
                initialValue: _selectedGender,
                validator: TValidator.simpleInputValidation,
                decoration: InputDecoration(
                  hintText: TTexts.gender,
                  prefixIcon: Icon(
                    Icons.accessibility_new_rounded,
                    color: dark ? TColors.white : TColors.primary,
                  ),
                  filled: true,
                  fillColor: dark ? TColors.dark : TColors.white,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: TColors.grey,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: TColors.primary),
                  ),
                ),
                icon: Icon(
                  Iconsax.arrow_down_14,
                  color: TColors.primary.withOpacity(0.4),
                ),
                items: _genderList,
                onChanged: (val) {
                  onUpdateGender(val);
                },
              ),

              /// Next of kin name
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                TTexts.nextOfKinName,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TextFormField(
                controller: _nextOfKin,
                keyboardType: TextInputType.name,
                validator: TValidator.simpleInputValidation,
                decoration: InputDecoration(
                  hintText: TTexts.nextOfKinNameSubTitle,
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  fillColor: dark ? TColors.dark : TColors.white,
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

              /// Next of kin Phone Number
              Text(
                TTexts.nextOfKinNumber,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TextFormField(
                controller: _nextOfKinPhone,
                validator: TValidator.simpleInputValidation,
                keyboardType: TextInputType.phone,
                maxLength: 11,
                decoration: InputDecoration(
                  hintText: TTexts.nextOfKinNumber,
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  fillColor: dark ? TColors.dark : TColors.white,
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
            ],
          ),
        ),
      ],
    );
  }
}
