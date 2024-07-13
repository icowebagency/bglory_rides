import 'dart:developer';
import 'dart:io';

import 'package:bglory_rides/features/driver/general-widgets/custom_drop_down.dart';
import 'package:bglory_rides/features/driver/screens/verification/driver_information_registration/driver_registration_provider.dart';
import 'package:bglory_rides/utils/constants/key_constants.dart';
import 'package:bglory_rides/utils/notification/notification_utils.dart';
import 'package:bglory_rides/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../../common/widgets/driver_info_upload_widget.dart';
import '../../../../../routing/driver_routing.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class DriverInformationScreen extends ConsumerStatefulWidget {
  const DriverInformationScreen({super.key});

  @override
  ConsumerState<DriverInformationScreen> createState() =>
      _DriverInformationScreenState();
}

class _DriverInformationScreenState
    extends ConsumerState<DriverInformationScreen> {
  final TextEditingController _licenseExpiry = TextEditingController();
  final TextEditingController _dateOfBirth = TextEditingController();
  late final TextEditingController _fullname;
  late final TextEditingController _address;
  late final TextEditingController _nextOfKin;
  late final TextEditingController _nextOfKinPhone;
  late final TextEditingController _licenseNumber;
  late final TextEditingController _vehicleColor;
  late final TextEditingController _vehicleYear;
  late final TextEditingController _vehiclePlateNumber;

  File? profilePic;
  File? driversLicensePhoto;
  File? vehicleExteriorPhoto;
  File? vehicleInteriorPhoto;
  File? proofOfOwnershipPhoto;
  File? vehicleLicensePhoto;
  File? roadWorthinessPhoto;
  File? vehicleInsurancePhoto;

  final _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fullname = TextEditingController();
    _address = TextEditingController();
    _nextOfKin = TextEditingController();
    _nextOfKinPhone = TextEditingController();
    _licenseNumber = TextEditingController();
    _vehicleColor = TextEditingController();
    _vehicleYear = TextEditingController();
    _vehiclePlateNumber = TextEditingController();
  }

  /// variables
  _DriverInformationScreenState();

  final List<String> _vehicleList = [
    'Toyota',
    'Volkswagen',
    'Ford',
    'Honda',
    'Chevrolet',
    'Nissan',
    'BMW',
    'Mercedes-Benz',
    'Hyundai',
    'Kia',
    'Audi',
    'Subaru',
    'Mazda',
    'Lexus',
    'Jaguar',
    'Porsche',
    'Ferrari',
    'Lamborghini',
    'Volvo',
    'Land Rover',
    'Jeep',
    'Dodge',
    'Chrysler',
    'Buick',
    'Cadillac',
    'Acura',
    'Infiniti',
    'Mitsubishi',
    'Tesla',
    'Mini',
    'Maserati',
    'Alfa Romeo',
    'Bentley',
    'Rolls-Royce',
    'Bugatti',
    'Aston Martin',
    'Peugeot',
    'Renault',
    'Citroën',
    'Skoda',
    'SEAT',
    'Fiat',
    'Suzuki',
    'Isuzu',
    'Saab',
    'Lincoln',
    'Genesis',
    'McLaren',
    'Pagani',
    'Koenigsegg'
  ];

  final List<String> _nigerianBanks = [
    'Access Bank',
    'Zenith Bank',
    'First Bank of Nigeria',
    'United Bank for Africa (UBA)',
    'Guaranty Trust Bank (GTBank)',
    'Stanbic IBTC Bank',
    'Union Bank of Nigeria',
    'Fidelity Bank',
    'Ecobank Nigeria',
    'Sterling Bank',
    'Wema Bank',
    'Polaris Bank',
    'FCMB (First City Monument Bank)',
    'Heritage Bank',
    'Unity Bank',
    'Keystone Bank',
    'Jaiz Bank',
    'SunTrust Bank Nigeria',
    'Providus Bank',
    'Titan Trust Bank',
    'Globus Bank'
  ];

  final _genderList = [
    "Male",
    "Female",
  ];
  String? _selectedValue;
  String? _vehicleSelectedValue;
  String? _vehicleSelectedModel;
  String? _banksSelectedValue;

  /// stepper variables and functions
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
      canGoNext = canGoNext && checkInteriorAndExteriorPhoto();
    }
    if (currentStep == 3) {
      canGoNext = checkAllVehicleDocumentInformation();
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
        key: DriverPayloadKey.vehicleYear,
        value: _vehicleYear.text,
      );
      updateProfileField(
        key: DriverPayloadKey.vehicleColor,
        value: _vehicleColor.text,
      );
      updateProfileField(
        key: DriverPayloadKey.plateNumber,
        value: _vehiclePlateNumber.text,
      );
    }

    if (currentStep < _totalSteps - 1) {
      setState(() {
        currentStep += 1;
      });
    } else {
      context.go(BGRouteNames.driverHomePageScreen);
    }
  }

  void updateProfileFiles({required String key, required String value}) {
    ref.read(driverRegistrationFilesProvider)[key] = value;
    log('${ref.read(driverRegistrationFilesProvider)}');
  }

  void updateProfileField({required String key, required String value}) {
    ref.read(driverRegistrationDetailsProvider)[key] = value;
    log('${ref.read(driverRegistrationDetailsProvider)}');
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

  bool checkInteriorAndExteriorPhoto() {
    if (vehicleExteriorPhoto == null) {
      NotificationUtil.showErrorNotification('Enter Vehicle Exterior photo');
      return false;
    }
    if (vehicleInteriorPhoto == null) {
      NotificationUtil.showErrorNotification('Enter Vehicle Interior photo');
      return false;
    }
    return true;
  }

  bool checkAllVehicleDocumentInformation() {
    if (proofOfOwnershipPhoto == null) {
      log('Im here');
      NotificationUtil.showErrorNotification('Enter Proof of Ownership photo');
      return false;
    }
    if (vehicleLicensePhoto == null) {
      NotificationUtil.showErrorNotification('Enter Vehicle License photo');
      return false;
    }
    if (roadWorthinessPhoto == null) {
      NotificationUtil.showErrorNotification('Enter Road Worthiness photo');
      return false;
    }
    if (vehicleInsurancePhoto == null) {
      NotificationUtil.showErrorNotification('Enter Vehicle Insurance photo');
      return false;
    }
    return true;
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
        child: Padding(
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
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                TTexts.driverInformationTitle,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwSections,
                            ),
                            Center(
                              child: Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: TColors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: TColors.primary,
                                  ),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    context
                                        .push<File?>(
                                            BGRouteNames.driverUploadProfile)
                                        .then(
                                      (value) {
                                        if (value != null) {
                                          profilePic = value;

                                          updateProfileFiles(
                                              key: DriverPayloadKey
                                                  .profilePicture,
                                              value: value.path);

                                          log('${ref.read(driverRegistrationFilesProvider)}');
                                          setState(() {});
                                        }
                                        return;
                                      },
                                    );
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
                              key: _formKeys[0],
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// Full name
                                  Text(
                                    TTexts.fullName,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
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
                                        borderSide:
                                            BorderSide(color: TColors.primary),
                                      ),
                                      hintText: TTexts.fullNameHint,
                                      hintStyle:
                                          Theme.of(context).textTheme.bodySmall,
                                      fillColor:
                                          TColors.containerBackgroundColor,
                                      filled: true,
                                    ),
                                  ),

                                  /// Address
                                  const SizedBox(
                                    height: TSizes.spaceBtwItems,
                                  ),
                                  Text(
                                    TTexts.address,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
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
                                      hintStyle:
                                          Theme.of(context).textTheme.bodySmall,
                                      fillColor:
                                          TColors.containerBackgroundColor,
                                      filled: true,
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: TColors.grey,
                                        ),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: TColors.primary),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: TSizes.spaceBtwItems,
                                  ),
                                  Text(
                                    TTexts.dateOfBirth,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(
                                    height: TSizes.spaceBtwItems,
                                  ),

                                  /// Date of birth
                                  TextFormField(
                                    controller: _dateOfBirth,
                                    validator: TValidator.simpleInputValidation,
                                    decoration: const InputDecoration(
                                      labelText: 'Select Date Of Birth',
                                      prefixIcon: Icon(
                                        Iconsax.calendar,
                                        color: TColors.primary,
                                      ),
                                      fillColor:
                                          TColors.containerBackgroundColor,
                                      filled: true,
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
                                    readOnly: true,
                                    onTap: () async {
                                      DateTime? pickeddateofbirth =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1980),
                                        lastDate: DateTime(2101),
                                      );
                                      //Conditions
                                      if (pickeddateofbirth != null) {
                                        setState(() {
                                          _dateOfBirth.text =
                                              DateFormat.yMMMd('en_US')
                                                  .format(pickeddateofbirth);

                                          ref.read(driverRegistrationDetailsProvider)[
                                                  DriverPayloadKey.dob] =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(pickeddateofbirth);
                                        });
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: TSizes.spaceBtwItems,
                                  ),

                                  /// Gender
                                  Text(
                                    TTexts.genderTitle,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),

                                  const SizedBox(
                                    height: TSizes.spaceBtwItems,
                                  ),
                                  ValidatedDropdown(
                                    dropdownColor: TColors.grey,
                                    initialValue: _selectedValue,
                                    validator: TValidator.simpleInputValidation,
                                    decoration: const InputDecoration(
                                      hintText: TTexts.gender,
                                      prefixIcon: Icon(
                                        Icons.accessibility_new_rounded,
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
                                    items: _genderList,
                                    onChanged: (val) {
                                      setState(() {
                                        _selectedValue = val as String;
                                        ref.read(
                                                driverRegistrationDetailsProvider)[
                                            DriverPayloadKey
                                                .gender] = val.toLowerCase();

                                        log('${ref.read(driverRegistrationDetailsProvider)}');
                                      });
                                    },
                                  ),

                                  /// Next of kin name
                                  const SizedBox(
                                    height: TSizes.spaceBtwItems,
                                  ),
                                  Text(
                                    TTexts.nextOfKinName,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(
                                    height: TSizes.spaceBtwItems,
                                  ),
                                  TextFormField(
                                    controller: _nextOfKin,
                                    keyboardType: TextInputType.name,
                                    validator: TValidator.simpleInputValidation,
                                    decoration: InputDecoration(
                                      hintText: TTexts.nextOfKinNamesubTitle,
                                      hintStyle:
                                          Theme.of(context).textTheme.bodySmall,
                                      fillColor:
                                          TColors.containerBackgroundColor,
                                      filled: true,
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: TColors.grey,
                                        ),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: TColors.primary),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: TSizes.spaceBtwItems,
                                  ),

                                  /// Next of kin Phone Number
                                  Text(
                                    TTexts.nextOfKinNumber,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(
                                    height: TSizes.spaceBtwItems,
                                  ),
                                  TextFormField(
                                    controller: _nextOfKinPhone,
                                    validator: TValidator.simpleInputValidation,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      hintText: TTexts.nextOfKinNumber,
                                      hintStyle:
                                          Theme.of(context).textTheme.bodySmall,
                                      fillColor:
                                          TColors.containerBackgroundColor,
                                      filled: true,
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: TColors.grey,
                                        ),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: TColors.primary),
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
                        ),
                      ),

                      /// Section 2 -- License Information
                      Step(
                        isActive: currentStep >= 1,
                        state: currentStep >= 1
                            ? StepState.complete
                            : StepState.disabled,
                        title: const Text(''),
                        content: Form(
                          key: _formKeys[1],
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  TTexts.driverlicenseTitle,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
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
                                  hintStyle:
                                      Theme.of(context).textTheme.bodySmall,
                                  fillColor: TColors.containerBackgroundColor,
                                  filled: true,
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: TColors.grey,
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: TColors.primary),
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
                                    borderSide:
                                        BorderSide(color: TColors.primary),
                                  ),
                                ),
                                readOnly: true,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101));
                                  //Conditions
                                  if (pickedDate != null) {
                                    setState(() {
                                      _licenseExpiry.text =
                                          DateFormat.yMMMd('en_US')
                                              .format(pickedDate);

                                      ref.read(driverRegistrationDetailsProvider)[
                                              DriverPayloadKey
                                                  .licenseExpiryDate] =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);

                                      log("${ref.read(driverRegistrationDetailsProvider)}");
                                    });
                                  }
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
                                            key:
                                                DriverPayloadKey.licensePicture,
                                            value: value.path);

                                        log('${ref.read(driverRegistrationFilesProvider)}');
                                        setState(() {});
                                      }
                                      return;
                                    },
                                  );
                                },
                              ),
                              const SizedBox(
                                height: TSizes.spaceBtwSections,
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// Driver Vehicle Information
                      Step(
                        isActive: currentStep >= 2,
                        state: currentStep >= 2
                            ? StepState.complete
                            : StepState.disabled,
                        title: const Text(''),
                        content: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Form(
                            key: _formKeys[2],
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    TTexts.driverVehicleInformationTitle,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
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
                                      borderSide:
                                          BorderSide(color: TColors.primary),
                                    ),
                                  ),
                                  icon: Icon(
                                    Iconsax.arrow_down_14,
                                    color: TColors.primary.withOpacity(0.4),
                                  ),
                                  items: _vehicleList,
                                  onChanged: (val) {
                                    setState(() {
                                      _vehicleSelectedValue = val as String;
                                      updateProfileField(
                                        key: DriverPayloadKey
                                            .vehicleManufacturer,
                                        value: val,
                                      );
                                    });
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
                                      borderSide:
                                          BorderSide(color: TColors.primary),
                                    ),
                                  ),
                                  icon: Icon(
                                    Iconsax.arrow_down_14,
                                    color: TColors.primary.withOpacity(0.4),
                                  ),
                                  items: _vehicleList.toSet().toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      _vehicleSelectedModel = val as String;
                                      updateProfileField(
                                        key: DriverPayloadKey.vehicleModel,
                                        value: val,
                                      );
                                    });
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
                                    hintStyle:
                                        Theme.of(context).textTheme.bodySmall,
                                    fillColor: TColors.containerBackgroundColor,
                                    filled: true,
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: TColors.grey,
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: TColors.primary),
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
                                    hintStyle:
                                        Theme.of(context).textTheme.bodySmall,
                                    fillColor: TColors.containerBackgroundColor,
                                    filled: true,
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: TColors.grey,
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: TColors.primary),
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
                                    hintStyle:
                                        Theme.of(context).textTheme.bodySmall,
                                    fillColor: TColors.containerBackgroundColor,
                                    filled: true,
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: TColors.grey,
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: TColors.primary),
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
                                    getPictureAndUpdateDataField(
                                      context: context,
                                      imageDetailKey:
                                          DriverPayloadKey.vehicleImageExterior,
                                      navPath:
                                          BGRouteNames.driverExteriorGuideline,
                                    ).then(
                                      (value) {
                                        if (value != null) {
                                          vehicleExteriorPhoto = value;
                                          setState(() {});
                                        }
                                      },
                                    );
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
                                      getPictureAndUpdateDataField(
                                        context: context,
                                        imageDetailKey: DriverPayloadKey
                                            .vehicleImageInterior,
                                        navPath: BGRouteNames
                                            .driverInteriorGuideline,
                                      ).then(
                                        (value) {
                                          if (value != null) {
                                            vehicleInteriorPhoto = value;
                                            setState(() {});
                                          }
                                        },
                                      );
                                    }),
                                const SizedBox(
                                  height: TSizes.spaceBtwSections,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      /// Step 4 -- Vehicle document information
                      Step(
                        isActive: currentStep >= 3,
                        state: currentStep >= 3
                            ? StepState.complete
                            : StepState.disabled,
                        title: const Text(''),
                        content: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  TTexts.driverVehicleDocumentInformationTitle,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
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
                                    getPictureAndUpdateDataField(
                                      context: context,
                                      imageDetailKey:
                                          DriverPayloadKey.proofOfOwnership,
                                      navPath:
                                          BGRouteNames.driverProofOfOwnership,
                                    ).then(
                                      (value) {
                                        if (value != null) {
                                          proofOfOwnershipPhoto = value;
                                          setState(() {});
                                        }
                                      },
                                    );
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
                                  getPictureAndUpdateDataField(
                                    context: context,
                                    imageDetailKey:
                                        DriverPayloadKey.vehicleLicense,
                                    navPath: BGRouteNames.driverVehicleLicense,
                                  ).then(
                                    (value) {
                                      if (value != null) {
                                        vehicleLicensePhoto = value;
                                        setState(() {});
                                      }
                                    },
                                  );
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
                                    getPictureAndUpdateDataField(
                                      context: context,
                                      imageDetailKey: DriverPayloadKey
                                          .vehicleRoadWorthiness,
                                      navPath:
                                          BGRouteNames.driverRoadWorthiness,
                                    ).then(
                                      (value) {
                                        if (value != null) {
                                          roadWorthinessPhoto = value;
                                          setState(() {});
                                        }
                                      },
                                    );
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
                                  ///TODO: Fix routing to vehicle insurance guileline
                                  getPictureAndUpdateDataField(
                                    context: context,
                                    imageDetailKey:
                                        DriverPayloadKey.vehicleInsurance,
                                    navPath: BGRouteNames
                                        .vehicleInsuranceGuidlineScreen,
                                  ).then(
                                    (value) {
                                      if (value != null) {
                                        vehicleInsurancePhoto = value;
                                        setState(() {});
                                      }
                                    },
                                  );
                                },
                              ),

                              const SizedBox(
                                height: TSizes.spaceBtwSections,
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// Step 5 -- Payment Details
                      Step(
                        isActive: currentStep >= 4,
                        state: currentStep >= 4
                            ? StepState.complete
                            : StepState.disabled,
                        title: const Text(''),
                        content: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  TTexts.driverPaymentDetailsTitle,
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
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(
                                height: TSizes.spaceBtwItems,
                              ),
                              DropdownButtonFormField(
                                isExpanded: true,
                                elevation: 0,
                                dropdownColor: TColors.grey,
                                decoration: const InputDecoration(
                                  hintText: 'Select one',
                                  prefixIcon: Icon(
                                    Iconsax.bank,
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
                                  fillColor: TColors.containerBackgroundColor,
                                ),
                                icon: Icon(
                                  Iconsax.arrow_down_14,
                                  color: TColors.primary.withOpacity(0.4),
                                ),
                                value: _banksSelectedValue,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                items: _nigerianBanks
                                    .map(
                                      (e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (val) {
                                  setState(() {
                                    _banksSelectedValue = val as String;
                                  });
                                },
                              ),

                              /// Bank account holder name
                              const SizedBox(
                                height: TSizes.spaceBtwItems,
                              ),
                              Text(
                                TTexts.driverBankAccountHolderNameTitle,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(
                                height: TSizes.spaceBtwItems,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  hintText: TTexts.driverBankHolderNameHint,
                                  hintStyle:
                                      Theme.of(context).textTheme.bodySmall,
                                  fillColor: TColors.containerBackgroundColor,
                                  filled: true,
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: TColors.grey,
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: TColors.primary),
                                  ),
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
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(
                                height: TSizes.spaceBtwItems,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: TTexts.driverBankHolderNumberHint,
                                  hintStyle:
                                      Theme.of(context).textTheme.bodySmall,
                                  fillColor: TColors.containerBackgroundColor,
                                  filled: true,
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: TColors.grey,
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: TColors.primary),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
}
