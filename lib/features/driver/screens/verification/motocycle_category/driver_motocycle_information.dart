import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bglory_rides/common/widgets/app_circular_progress_indicator.dart';
import 'package:bglory_rides/common/widgets/driver_info_upload_widget.dart';
import 'package:bglory_rides/features/driver/screens/auth/widgets/login_emailFormTab.dart';
import 'package:bglory_rides/features/driver/screens/auth/widgets/login_phoneNumberTab.dart';
import 'package:bglory_rides/features/driver/screens/verification/driver_information_registration/driver_registration_provider.dart';
import 'package:bglory_rides/features/driver/screens/verification/steps/driver_info_step.dart';
import 'package:bglory_rides/features/driver/screens/verification/steps/driver_license_info.dart';
import 'package:bglory_rides/utils/constants/constant_values.dart';
import 'package:bglory_rides/utils/constants/key_constants.dart';
import 'package:bglory_rides/utils/notification/notification_utils.dart';
import 'package:bglory_rides/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../../../routing/driver_routing.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../general_widgets/custom_drop_down.dart';

class DriverMotorcycleInformation extends ConsumerStatefulWidget {
  const DriverMotorcycleInformation({super.key});

  @override
  ConsumerState<DriverMotorcycleInformation> createState() =>
      _DriverMotorcycleInformationState();
}

class _DriverMotorcycleInformationState
    extends ConsumerState<DriverMotorcycleInformation> with RegistionMixin {
  final TextEditingController _date = TextEditingController();
  final TextEditingController _dateOfBirth = TextEditingController();
  late final TextEditingController _licenseNumber;

  late final TextEditingController _licenseExpiry;
  late final TextEditingController _fullname;
  late final TextEditingController _address;
  late final TextEditingController _nextOfKin;
  late final TextEditingController _nextOfKinPhone;

  late final TextEditingController _bankAccountName;
  late final TextEditingController _bankAccountNumber;
  late final TextEditingController _motorcycleColor;
  late final TextEditingController _vehiclePlateNumber;

  File? profilePic;
  File? driversLicensePhoto;
  File? hackneyPermit;
  File? motorcycleInsurance;
  File? proofOfOwnershipPhoto;
  File? motorcyclePhoto;
  File? roadWorthinessPhoto;
  File? vehicleInsurancePhoto;

  /// variables
  _DriverMotorcycleInformationState();

  final List<String> _motorcycleList = ConstantValues.motorcycleList;

  final List<String> _nigerianBanks = ConstantValues.nigerianBanks;

  final List<String> _motorcycleModelList = ConstantValues.motorcycleModelList;

  final List<String> _motorcycleColorList = ConstantValues.motorcycleColorList;

  String? _vehicleSelectedValue;
  String? _selectedGender;
  String? _banksSelectedValue;
  String? _motorcycleModelSelectedValue;

  final _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];

  final _genderList = ConstantValues.genderList;

  @override
  initState() {
    super.initState();
    _fullname = TextEditingController();
    _address = TextEditingController();
    _nextOfKin = TextEditingController();
    _nextOfKinPhone = TextEditingController();

    _bankAccountName = TextEditingController();
    _bankAccountNumber = TextEditingController();
    _motorcycleColor = TextEditingController();
    _vehiclePlateNumber = TextEditingController();

    _licenseNumber = TextEditingController();

    _licenseExpiry = TextEditingController();
  }

  /// continueStep function
  continueStep() {
    bool canGoNext = false;
    canGoNext = (_formKeys[currentStep].currentState?.validate() ?? false);

    log('$currentStep');
    if (currentStep == 0) {
      canGoNext = canGoNext && checkProfilePhoto();
    }
    if (currentStep == 1) {
      canGoNext = canGoNext && checkLicensePhoto();
    }
    if (currentStep == 2) {
      canGoNext = canGoNext && checkMotorcylePhoto();
    }
    if (currentStep == 3) {
      canGoNext = checkAllMotorcycleDocumentInformation();
    }

    if (!canGoNext) {
      return;
    }

    if (currentStep == 0) {
      updateProfileField(key: DriverPayloadKey.fullName, value: _fullname.text);
      updateProfileField(key: DriverPayloadKey.address, value: _address.text);
      updateProfileField(
        key: DriverPayloadKey.nextOfKinName,
        value: _nextOfKin.text,
      );
      updateProfileField(
        key: DriverPayloadKey.nextOfKinPhoneNumber,
        value: _nextOfKinPhone.text,
      );
    }
    if (currentStep == 1) {
      updateProfileField(
        key: DriverPayloadKey.licenseNumber,
        value: _licenseNumber.text,
      );
    }
    if (currentStep == 2) {
      updateProfileField(
        key: DriverPayloadKey.vehicleColor,
        value: _motorcycleColor.text,
      );
      updateProfileField(
        key: DriverPayloadKey.plateNumber,
        value: _vehiclePlateNumber.text,
      );
    }

    if (currentStep == 4) {
      updateProfileField(
          key: DriverPayloadKey.bankAccountName, value: _bankAccountName.text);
      updateProfileField(
          key: DriverPayloadKey.bankAccountNumber,
          value: _bankAccountNumber.text);
      final email = ref.read(emailText);
      final phone = ref.read(phoneNumberText);
      if (email.isNotEmpty) {
        updateProfileField(
          key: DriverPayloadKey.email,
          value: email,
        );
      }
      if (phone.isNotEmpty) {
        updateProfileField(
          key: DriverPayloadKey.phone,
          value: phone,
        );
      }
    }

    if (currentStep < _totalSteps - 1) {
      setState(() {
        currentStep += 1;
      });
    } else {
      () {
        context.go(BGRouteNames.driverHomePageScreen);
      };

      log(jsonEncode(ref.read(driverRegistrationFilesProvider)));
      log(jsonEncode(ref.read(driverRegistrationDetailsProvider)));

      ref
          .read(driverRegistrationProvider.notifier)
          .onRegister(
            profileData: ref.read(driverRegistrationDetailsProvider),
            files: ref.read(driverRegistrationFilesProvider),
            onError: NotificationUtil.showErrorNotification,
          )
          .then(
        (successful) {
          if (successful) {
            context.go(BGRouteNames.driverHomePageScreen);
          }
        },
      );
    }
  }

  void onUpdateProfilePicture(BuildContext context) {
    context.push<File?>(BGRouteNames.driverUploadProfile).then(
      (value) {
        if (value != null) {
          profilePic = value;

          updateProfileFiles(
              key: DriverPayloadKey.profilePicture, value: value.path);

          log('${ref.read(driverRegistrationFilesProvider)}');
          setState(() {});
        }
        return;
      },
    );
  }

  void onTakeMotorcyclePhoto(BuildContext context) {
    getPictureAndUpdateDataField(
      context: context,
      imageDetailKey: DriverPayloadKey.motorcycleImage,
      navPath: BGRouteNames.driverMotorcycleGuideline,
    ).then(
      (value) {
        if (value != null) {
          motorcyclePhoto = value;
          setState(() {});
        }
      },
    );
  }

  void onTakeMotorcycleInsurancePhoto(BuildContext context) {
    getPictureAndUpdateDataField(
      context: context,
      imageDetailKey: DriverPayloadKey.motorcycleInsurance,
      navPath: BGRouteNames.vehicleInsuranceGuidlineScreen,
    ).then(
      (value) {
        if (value != null) {
          motorcycleInsurance = value;
          setState(() {});
        }
      },
    );
  }

  void onTakeHackneyPermitPhoto(BuildContext context) {
    getPictureAndUpdateDataField(
      context: context,
      imageDetailKey: DriverPayloadKey.hackneyPermit,
      navPath: BGRouteNames.driverMotorcycleHackneyPermit,
    ).then(
      (value) {
        if (value != null) {
          hackneyPermit = value;
          setState(() {});
        }
      },
    );
  }

  Future<void> onPickDateofBirth(BuildContext context) async {
    DateTime? pickeddateofbirth = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2101),
    );
    //Conditions
    if (pickeddateofbirth != null) {
      setState(() {
        _dateOfBirth.text = DateFormat.yMMMd('en_US').format(pickeddateofbirth);

        ref.read(driverRegistrationDetailsProvider)[DriverPayloadKey.dob] =
            DateFormat('yyyy-MM-dd').format(pickeddateofbirth);
      });
    }
  }

  bool checkProfilePhoto() {
    if (profilePic == null) {
      NotificationUtil.showErrorNotification('Enter a photo');
      return false;
    }
    return true;
  }

  bool checkLicensePhoto() {
    if (driversLicensePhoto == null) {
      NotificationUtil.showErrorNotification('Enter license photo');
      return false;
    }
    return true;
  }

  bool checkMotorcylePhoto() {
    if (motorcyclePhoto == null) {
      NotificationUtil.showErrorNotification('Enter motorcycle photo');
      return false;
    }
    return true;
  }

  void onUpdateGender(String? val) {
    setState(() {
      _selectedGender = val as String;
      ref.read(driverRegistrationDetailsProvider)[DriverPayloadKey.gender] =
          val.toLowerCase();

      log('${ref.read(driverRegistrationDetailsProvider)}');
    });
  }

  bool checkAllMotorcycleDocumentInformation() {
    if (hackneyPermit == null) {
      log('Im here');
      NotificationUtil.showErrorNotification(
        'Enter hackney permit photo',
      );
      return false;
    }

    if (motorcycleInsurance == null) {
      NotificationUtil.showErrorNotification(
        'Enter Motorcycle Insurance photo',
      );
      return false;
    }
    return true;
  }

  Future<void> onPickDriverLicenseExpiryDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));
    //Conditions
    if (pickedDate != null) {
      setState(() {
        _licenseExpiry.text = DateFormat.yMMMd('en_US').format(pickedDate);

        updateProfileField(
          key: DriverPayloadKey.licenseExpiryDate,
          value: DateFormat('yyyy-MM-dd').format(pickedDate),
        );

        log("${ref.read(driverRegistrationDetailsProvider)}");
      });
    }
  }

  void onPickDriverLicensePhoto(BuildContext context) {
    context
        .push<File?>(
      Uri(
        path: BGRouteNames.driverLicenseGuideline,
      ).toString(),
    )
        .then(
      (value) {
        if (value != null) {
          driversLicensePhoto = value;

          updateProfileFiles(
              key: DriverPayloadKey.licensePicture, value: value.path);

          log('${ref.read(driverRegistrationFilesProvider)}');
          setState(() {});
        }
        return;
      },
    );
  }

  /// cancel step function
  cancelStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep = currentStep - 1;
      });
    }
  }

  /// OnStep Tapped function
  onStepTapped(int value) {
    setState(() {
      currentStep = value;
    });
  }

  /// Custom Next and Back button widget here
  Widget controlsBuilder(context, details) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: details.onStepCancel,
            child: const Text('Back'),
          ),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: details.onStepContinue,
            child: const Text('Next'),
          ),
        ),
      ],
    );
  }

  int currentStep = 0;
  final int _totalSteps = 5;
  final DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
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
                    Expanded(
                      child: Stepper(
                        connectorColor:
                            const WidgetStatePropertyAll(TColors.primary),
                        onStepContinue: continueStep,
                        onStepCancel: cancelStep,
                        onStepTapped: onStepTapped,
                        controlsBuilder: controlsBuilder,
                        elevation: 0,
                        type: StepperType.horizontal,
                        currentStep: currentStep,
                        steps: [
                          Step(
                            isActive: currentStep >= 0,
                            state: currentStep >= 0
                                ? StepState.complete
                                : StepState.disabled,
                            title: const Text(''),
                            content: DriverInfoStep(
                              profilePic: profilePic,
                              formKey: _formKeys[0],
                              fullname: _fullname,
                              address: _address,
                              dateOfBirth: _dateOfBirth,
                              selectedGender: _selectedGender,
                              genderList: _genderList,
                              nextOfKin: _nextOfKin,
                              nextOfKinPhone: _nextOfKinPhone,
                              onUpdateGender: onUpdateGender,
                              onUpdateProfilePicture: onUpdateProfilePicture,
                              onPickDateofBirth: onPickDateofBirth,
                            ),
                          ),

                          Step(
                            isActive: currentStep >= 1,
                            state: currentStep >= 1
                                ? StepState.complete
                                : StepState.disabled,
                            title: const Text(''),
                            content: DriverLicenseInfo(
                              formKey: _formKeys[1],
                              licenseNumber: _licenseNumber,
                              licenseExpiry: _licenseExpiry,
                              driversLicensePhoto: driversLicensePhoto,
                              onPickDriverLicenseExpiryDate:
                                  onPickDriverLicenseExpiryDate,
                              onPickDriverLicensePhoto:
                                  onPickDriverLicensePhoto,
                            ),
                          ),

                          /// Step 2  -  Motorcycle Information
                          Step(
                            isActive: currentStep >= 2,
                            state: currentStep >= 2
                                ? StepState.complete
                                : StepState.disabled,
                            title: const Text(''),
                            content: Form(
                              key: _formKeys[2],
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      TTexts.driverMotocycleInformationTitle,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: TSizes.spaceBtwSections,
                                  ),

                                  /// Motorcycle manufacturer
                                  Text(
                                    TTexts.driverVehicleManufacturerTitle,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(
                                    height: TSizes.spaceBtwItems,
                                  ),
                                  ValidatedDropdown(
                                    isExpanded: true,
                                    dropdownColor: TColors.grey,
                                    decoration: const InputDecoration(
                                      hintText: 'Select one',
                                      prefixIcon: Icon(
                                        Icons.motorcycle_rounded,
                                        color: TColors.primary,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: TColors.grey,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: TColors.primary),
                                      ),
                                      filled: true,
                                      fillColor:
                                          TColors.containerBackgroundColor,
                                    ),
                                    icon: Icon(
                                      Iconsax.arrow_down_14,
                                      color: TColors.primary.withOpacity(0.4),
                                    ),
                                    initialValue: _vehicleSelectedValue,
                                    items: _motorcycleList,
                                    onChanged: (val) {
                                      setState(() {
                                        _vehicleSelectedValue = val as String;
                                        updateProfileField(
                                          key: DriverPayloadKey
                                              .motorcycleManufacturer,
                                          value: val,
                                        );
                                      });
                                    },
                                    validator: TValidator.simpleInputValidation,
                                  ),
                                  const SizedBox(
                                    height: TSizes.spaceBtwSections,
                                  ),

                                  /// Motorcycle Model
                                  Text(
                                    TTexts.driverVehicleModelTitle,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(
                                    height: TSizes.spaceBtwItems,
                                  ),
                                  ValidatedDropdown(
                                    isExpanded: true,
                                    validator: TValidator.simpleInputValidation,
                                    dropdownColor: TColors.grey,
                                    decoration: const InputDecoration(
                                      hintText: 'Select one',
                                      prefixIcon: Icon(
                                        Icons.motorcycle,
                                        color: TColors.primary,
                                      ),
                                      filled: true,
                                      fillColor:
                                          TColors.containerBackgroundColor,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: TColors.grey,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: TColors.primary),
                                      ),
                                    ),
                                    icon: Icon(
                                      Iconsax.arrow_down_14,
                                      color: TColors.primary.withOpacity(0.4),
                                    ),
                                    initialValue: _motorcycleModelSelectedValue,
                                    items: _motorcycleModelList,
                                    onChanged: (val) {
                                      setState(() {
                                        _motorcycleModelSelectedValue =
                                            val as String;
                                        updateProfileField(
                                          key: DriverPayloadKey.motorcycleModel,
                                          value: val,
                                        );
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    height: TSizes.spaceBtwSections,
                                  ),

                                  /// Motorcycle Color
                                  Text(
                                    TTexts.driverVehicleColorTitle,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(
                                    height: TSizes.spaceBtwItems,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: _motorcycleColor,
                                    validator: TValidator.simpleInputValidation,
                                    decoration: InputDecoration(
                                      hintText: 'e.g Red',
                                      hintStyle:
                                          Theme.of(context).textTheme.bodySmall,
                                      fillColor:
                                          TColors.containerBackgroundColor,
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: TColors.grey,
                                        ),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: TColors.primary),
                                      ),
                                      filled: true,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: TSizes.spaceBtwSections,
                                  ),

                                  /// Vehicle Plate Number
                                  Text(
                                    TTexts.driverVehiclePlateNumberTitle,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
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
                                      hintStyle:
                                          Theme.of(context).textTheme.bodySmall,
                                      fillColor:
                                          TColors.containerBackgroundColor,
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: TColors.grey,
                                        ),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: TColors.primary),
                                      ),
                                      filled: true,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: TSizes.spaceBtwSections,
                                  ),

                                  /// License Upload
                                  Text(
                                    TTexts.driverMotorcyclePictureTitle,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(
                                    height: TSizes.spaceBtwItems,
                                  ),
                                  DriverInfoUploadWidget(
                                    photo: motorcyclePhoto,
                                    onTapNav: () {
                                      onTakeMotorcyclePhoto(context);
                                    },
                                  ),
                                  const SizedBox(
                                    height: TSizes.spaceBtwSections,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          /// Step 3  -  Document information

                          Step(
                            isActive: currentStep >= 3,
                            state: currentStep >= 3
                                ? StepState.complete
                                : StepState.disabled,
                            title: const Text(''),
                            content: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      TTexts
                                          .driverMotocycleDocumentInformationTitle,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: TSizes.spaceBtwSections,
                                  ),

                                  /// Hackney permit
                                  Text(
                                    TTexts.driverHackneyPermitTitle,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(
                                    height: TSizes.spaceBtwItems,
                                  ),
                                  DriverInfoUploadWidget(
                                    photo: hackneyPermit,
                                    onTapNav: () {
                                      onTakeHackneyPermitPhoto(context);
                                    },
                                  ),
                                  const SizedBox(
                                    height: TSizes.spaceBtwSections,
                                  ),

                                  /// Motorcycle insurance
                                  Text(
                                    TTexts.driverMotocycleInsuranceTitle,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(
                                    height: TSizes.spaceBtwItems,
                                  ),
                                  DriverInfoUploadWidget(
                                      photo: motorcycleInsurance,
                                      onTapNav: () {
                                        onTakeMotorcycleInsurancePhoto(context);
                                      }),
                                  const SizedBox(
                                    height: TSizes.spaceBtwSections,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          /// Step 4
                          Step(
                            isActive: currentStep >= 4,
                            state: currentStep >= 4
                                ? StepState.complete
                                : StepState.disabled,
                            title: const Text(''),
                            content: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              child: Form(
                                key: _formKeys[4],
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text(
                                        TTexts
                                            .driverVehicleDocumentInformationTitle,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: TSizes.spaceBtwSections,
                                    ),

                                    /// Bank Name
                                    Text(
                                      TTexts.driverBankName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                    const SizedBox(
                                      height: TSizes.spaceBtwItems,
                                    ),
                                    ValidatedDropdown(
                                      isExpanded: true,
                                      dropdownColor: TColors.grey,
                                      validator:
                                          TValidator.simpleInputValidation,
                                      decoration: const InputDecoration(
                                        hintText: 'Select one',
                                        prefixIcon: Icon(
                                          Iconsax.bank,
                                          color: TColors.primary,
                                        ),
                                        filled: true,
                                        fillColor:
                                            TColors.containerBackgroundColor,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: TColors.grey,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: TColors.primary),
                                        ),
                                      ),
                                      icon: Icon(
                                        Iconsax.arrow_down_14,
                                        color: TColors.primary.withOpacity(0.4),
                                      ),
                                      initialValue: _banksSelectedValue,
                                      items: _nigerianBanks,
                                      onChanged: (val) {
                                        setState(() {
                                          _banksSelectedValue = val as String;
                                          updateProfileField(
                                            key: DriverPayloadKey.bank,
                                            value: val,
                                          );
                                        });
                                      },
                                    ),

                                    /// Bank account holder name
                                    const SizedBox(
                                      height: TSizes.spaceBtwItems,
                                    ),
                                    Text(
                                      TTexts.driverBankAccountHolderNameTitle,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                    const SizedBox(
                                      height: TSizes.spaceBtwItems,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.name,
                                      controller: _bankAccountName,
                                      validator:
                                          TValidator.simpleInputValidation,
                                      decoration: InputDecoration(
                                        hintText:
                                            TTexts.driverBankHolderNameHint,
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                        fillColor:
                                            TColors.containerBackgroundColor,
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: TColors.grey,
                                          ),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: TColors.primary),
                                        ),
                                        filled: true,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: TSizes.spaceBtwItems,
                                    ),

                                    /// Bank account number
                                    const SizedBox(
                                      height: TSizes.spaceBtwItems,
                                    ),
                                    Text(
                                      TTexts.driverBankAccountHolderNumberTitle,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                    const SizedBox(
                                      height: TSizes.spaceBtwItems,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: _bankAccountNumber,
                                      validator: TValidator.validNumber,
                                      decoration: InputDecoration(
                                        hintText:
                                            TTexts.driverBankHolderNumberHint,
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                        filled: true,
                                        fillColor:
                                            TColors.containerBackgroundColor,
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: TColors.grey,
                                          ),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: TColors.primary),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: TSizes.spaceBtwItems,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Consumer(builder: (context, ref, child) {
              return Visibility(
                visible: ref.watch(
                  driverRegistrationProvider,
                ),
                child: Container(
                  color: Colors.grey.withOpacity(0.4),
                  child: const Center(
                    child: AppCircularProgressIndicator(),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}

mixin RegistionMixin<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  Future<File?> getPictureAndUpdateDataField({
    required BuildContext context,
    required String navPath,
    required String imageDetailKey,
  }) {
    return context
        .push<File?>(
      Uri(
        path: navPath,
      ).toString(),
    )
        .then(
      (value) {
        if (value != null) {
          updateProfileFiles(key: imageDetailKey, value: value.path);

          return value;
        }
        return null;
      },
    );
  }

  void updateProfileFiles({required String key, required String value}) {
    ref.read(driverRegistrationFilesProvider)[key] = value;
    log('${ref.read(driverRegistrationFilesProvider)}');
  }

  void updateProfileField({required String key, required String value}) {
    ref.read(driverRegistrationDetailsProvider)[key] = value;
    log('${ref.read(driverRegistrationDetailsProvider)}');
  }
}
