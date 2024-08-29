import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bglory_rides/common/widgets/app_circular_progress_indicator.dart';
import 'package:bglory_rides/features/driver/screens/auth/widgets/login_emailFormTab.dart';
import 'package:bglory_rides/features/driver/screens/auth/widgets/login_phoneNumberTab.dart';
import 'package:bglory_rides/features/driver/screens/verification/driver_information_registration/provider/driver_registration_provider.dart';
import 'package:bglory_rides/utils/constants/constant_values.dart';
import 'package:bglory_rides/utils/constants/key_constants.dart';
import 'package:bglory_rides/utils/notification/notification_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../routing/driver_routing.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../steps/driver_info_step.dart';
import '../steps/driver_license_info.dart';
import '../steps/payment_details_step.dart';
import '../steps/vehicle_document_info_step.dart';
import '../steps/vehicle_info_step.dart';

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
  late final TextEditingController _bankAccountName;
  late final TextEditingController _bankAccountNumber;

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
    _bankAccountName = TextEditingController();
    _bankAccountNumber = TextEditingController();
  }

  /// variables
  _DriverInformationScreenState();

  final List<String> _vehicleList = ConstantValues.vehicleList;

  final List<String> _nigerianBanks = ConstantValues.nigerianBanks;

  final _genderList = ConstantValues.genderList;
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
      updateProfileField(key: DriverKey.fullName, value: _fullname.text);
      updateProfileField(key: DriverKey.address, value: _address.text);
      updateProfileField(
        key: DriverKey.nextOfKinName,
        value: _nextOfKin.text,
      );
      updateProfileField(
        key: DriverKey.nextOfKinPhoneNumber,
        value: _nextOfKinPhone.text,
      );
    }
    if (currentStep == 1) {
      updateProfileField(
        key: DriverKey.licenseNumber,
        value: _licenseNumber.text,
      );
    }
    if (currentStep == 2) {
      updateProfileField(
        key: DriverKey.vehicleYear,
        value: _vehicleYear.text,
      );
      updateProfileField(
        key: DriverKey.vehicleColor,
        value: _vehicleColor.text,
      );
      updateProfileField(
        key: DriverKey.plateNumber,
        value: _vehiclePlateNumber.text,
      );
    }

    if (currentStep == 4) {
      updateProfileField(
          key: DriverKey.bankAccountName, value: _bankAccountName.text);
      updateProfileField(
          key: DriverKey.bankAccountNumber, value: _bankAccountNumber.text);

      final email = ref.read(emailText);
      final phone = ref.read(phoneNumberText);
      if (email.isNotEmpty) {
        updateProfileField(
          key: DriverKey.email,
          value: email,
        );
      }
      if (phone.isNotEmpty) {
        updateProfileField(
          key: DriverKey.phone,
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

      log(jsonEncode(ref.read(driverRegistrationDetailsProvider)));
      log(jsonEncode(ref.read(driverRegistrationFilesProvider)));

      ref
          .read(registrationNotifierProvider.notifier)
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
                              selectedGender: _selectedValue,
                              genderList: _genderList,
                              nextOfKin: _nextOfKin,
                              nextOfKinPhone: _nextOfKinPhone,
                              onUpdateGender: onUpdateGender,
                              onUpdateProfilePicture: onUpdateProfilePicture,
                              onPickDateofBirth: onPickDateofBirth,
                            ),
                          ),

                          /// Section 2 -- License Information
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

                          /// Driver Vehicle Information
                          Step(
                            isActive: currentStep >= 2,
                            state: currentStep >= 2
                                ? StepState.complete
                                : StepState.disabled,
                            title: const Text(''),
                            content: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: VehicleInfoStep(
                                formKey: _formKeys[2],
                                vehicleSelectedValue: _vehicleSelectedValue,
                                vehicleManfacturersList: _vehicleList,
                                vehicleSelectedModel: _vehicleSelectedModel,
                                vehicleYear: _vehicleYear,
                                vehicleColor: _vehicleColor,
                                vehiclePlateNumber: _vehiclePlateNumber,
                                vehicleExteriorPhoto: vehicleExteriorPhoto,
                                vehicleInteriorPhoto: vehicleInteriorPhoto,
                                onSelectVehicleManufacturer:
                                    onSelectVehicleManufacturer,
                                onUpateVehicleModel: onUpateVehicleModel,
                                onTakeVehicleExteriorPhoto:
                                    onTakeVehicleExteriorPhoto,
                                onTakeVehicleInteriorPhoto:
                                    onTakeVehicleInteriorPhoto,
                                vehicleModelList: _vehicleList,
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
                              child: VehicleDocumentInfoStep(
                                proofOfOwnershipPhoto: proofOfOwnershipPhoto,
                                vehicleLicensePhoto: vehicleLicensePhoto,
                                roadWorthinessPhoto: roadWorthinessPhoto,
                                vehicleInsurancePhoto: vehicleInsurancePhoto,
                                onTakeProofOfOwnershipPhoto:
                                    onTakeProofOfOwnershipPhoto,
                                onTakeRoadWorthinessPhoto:
                                    onTakeRoadWorthinessPhoto,
                                onTakeVehicleInsurancePhoto:
                                    onTakeVehicleInsurancePhoto,
                                onTakeVehicleLicensePhoto:
                                    onTakeVehicleLicensePhoto,
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
                              child: Builder(builder: (context) {
                                var formKey = _formKeys[4];
                                return PaymentDetailsStep(
                                  formKey: formKey,
                                  banksSelectedValue: _banksSelectedValue,
                                  nigerianBanks: _nigerianBanks,
                                  bankAccountName: _bankAccountName,
                                  bankAccountNumber: _bankAccountNumber,
                                  onSelectBank: onSelectBank,
                                );
                              }),
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
                  registrationNotifierProvider,
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

  void onSelectBank(String? val) {
    setState(() {
      _banksSelectedValue = val as String;
      updateProfileField(
        key: DriverKey.bank,
        value: val,
      );
    });
  }

  void onTakeVehicleInsurancePhoto(BuildContext context) {
    getPictureAndUpdateDataField(
      context: context,
      imageDetailKey: DriverKey.vehicleInsurance,
      navPath: BGRouteNames.vehicleInsuranceGuidlineScreen,
    ).then(
      (value) {
        if (value != null) {
          vehicleInsurancePhoto = value;
          setState(() {});
        }
      },
    );
  }

  void onTakeRoadWorthinessPhoto(BuildContext context) {
    getPictureAndUpdateDataField(
      context: context,
      imageDetailKey: DriverKey.vehicleRoadWorthiness,
      navPath: BGRouteNames.driverRoadWorthiness,
    ).then(
      (value) {
        if (value != null) {
          roadWorthinessPhoto = value;
          setState(() {});
        }
      },
    );
  }

  void onTakeVehicleLicensePhoto(BuildContext context) {
    getPictureAndUpdateDataField(
      context: context,
      imageDetailKey: DriverKey.vehicleLicense,
      navPath: BGRouteNames.driverVehicleLicense,
    ).then(
      (value) {
        if (value != null) {
          vehicleLicensePhoto = value;
          setState(() {});
        }
      },
    );
  }

  void onTakeProofOfOwnershipPhoto(BuildContext context) {
    getPictureAndUpdateDataField(
      context: context,
      imageDetailKey: DriverKey.proofOfOwnership,
      navPath: BGRouteNames.driverProofOfOwnership,
    ).then(
      (value) {
        if (value != null) {
          proofOfOwnershipPhoto = value;
          setState(() {});
        }
      },
    );
  }

  void onTakeVehicleInteriorPhoto(BuildContext context) {
    getPictureAndUpdateDataField(
      context: context,
      imageDetailKey: DriverKey.vehicleImageInterior,
      navPath: BGRouteNames.driverInteriorGuideline,
    ).then(
      (value) {
        if (value != null) {
          vehicleInteriorPhoto = value;
          setState(() {});
        }
      },
    );
  }

  void onTakeVehicleExteriorPhoto(BuildContext context) {
    getPictureAndUpdateDataField(
      context: context,
      imageDetailKey: DriverKey.vehicleImageExterior,
      navPath: BGRouteNames.driverExteriorGuideline,
    ).then(
      (value) {
        if (value != null) {
          vehicleExteriorPhoto = value;
          setState(() {});
        }
      },
    );
  }

  void onUpateVehicleModel(String? val) {
    setState(() {
      _vehicleSelectedModel = val as String;
      updateProfileField(
        key: DriverKey.vehicleModel,
        value: val,
      );
    });
  }

  void onSelectVehicleManufacturer(String? val) {
    setState(() {
      _vehicleSelectedValue = val as String;
      updateProfileField(
        key: DriverKey.vehicleManufacturer,
        value: val,
      );
    });
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

          updateProfileFiles(key: DriverKey.licensePicture, value: value.path);

          log('${ref.read(driverRegistrationFilesProvider)}');
          setState(() {});
        }
        return;
      },
    );
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

        ref.read(driverRegistrationDetailsProvider)[DriverKey
            .licenseExpiryDate] = DateFormat('yyyy-MM-dd').format(pickedDate);

        log("${ref.read(driverRegistrationDetailsProvider)}");
      });
    }
  }

  void onUpdateGender(String? val) {
    setState(() {
      _selectedValue = val as String;
      ref.read(driverRegistrationDetailsProvider)[DriverKey.gender] =
          val.toLowerCase();

      log('${ref.read(driverRegistrationDetailsProvider)}');
    });
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

        ref.read(driverRegistrationDetailsProvider)[DriverKey.dob] =
            DateFormat('yyyy-MM-dd').format(pickeddateofbirth);
      });
    }
  }

  void onUpdateProfilePicture(BuildContext context) {
    context.push<File?>(BGRouteNames.driverUploadProfile).then(
      (value) {
        if (value != null) {
          profilePic = value;

          updateProfileFiles(key: DriverKey.profilePicture, value: value.path);

          log('${ref.read(driverRegistrationFilesProvider)}');
          setState(() {});
        }
        return;
      },
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
