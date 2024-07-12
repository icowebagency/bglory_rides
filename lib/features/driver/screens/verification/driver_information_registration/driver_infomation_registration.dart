import 'package:flutter/material.dart';
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

class DriverInformationScreen extends StatefulWidget {
  const DriverInformationScreen({super.key});

  @override
  State<DriverInformationScreen> createState() =>
      _DriverInformationScreenState();
}

class _DriverInformationScreenState extends State<DriverInformationScreen> {
  final TextEditingController _date = TextEditingController();
  final TextEditingController _dateOfBirth = TextEditingController();

  /// variables
  _DriverInformationScreenState() {
    _selectedValue = _genderList[0];
    _vehicleSelectedValue = _vehicleList[0];
    _banksSelectedValue = _nigerianBanks[0];
  }

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
  String? _selectedValue = "";
  String? _vehicleSelectedValue = "";
  String? _banksSelectedValue = "";

  /// stepper variables and functions
  /// continueStep function
  continueStep() {
    if (currentStep < _totalSteps - 1) {
      setState(() {
        currentStep += 1;
      });
    } else {
      context.go(BGRouteNames.driverHomePageScreen);
    }
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
  final int _totalSteps = 4;
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
                    width: 150,
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
                                        .go(BGRouteNames.driverUploadProfile);
                                  },
                                  child: Lottie.asset(
                                    fit: BoxFit.contain,
                                    TImages.animUser,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwSections,
                            ),
                            Form(
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
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      hintText: TTexts.fullNameHint,
                                      hintStyle:
                                          Theme.of(context).textTheme.bodySmall,
                                      fillColor: TColors.grey.withOpacity(0.4),
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
                                    keyboardType: TextInputType.streetAddress,
                                    decoration: InputDecoration(
                                      hintText: TTexts.homeAddressHint,
                                      hintStyle:
                                          Theme.of(context).textTheme.bodySmall,
                                      fillColor: TColors.grey.withOpacity(0.4),
                                      filled: true,
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
                                    decoration: InputDecoration(
                                      labelText: 'Select Date Of Birth',
                                      prefixIcon: const Icon(Iconsax.calendar),
                                      fillColor: TColors.grey.withOpacity(0.4),
                                      filled: true,
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
                                  DropdownButtonFormField(
                                    elevation: 0,
                                    dropdownColor: TColors.grey,
                                    decoration: InputDecoration(
                                      hintText: TTexts.gender,
                                      prefixIcon: const Icon(
                                        Icons.accessibility_new_rounded,
                                        color: TColors.primary,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              TColors.primary.withOpacity(0.3),
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: TColors.grey.withOpacity(0.4),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              TColors.primary.withOpacity(0.3),
                                        ),
                                      ),
                                    ),
                                    icon: Icon(
                                      Iconsax.arrow_down_14,
                                      color: TColors.primary.withOpacity(0.4),
                                    ),
                                    value: _selectedValue,
                                    items: _genderList
                                        .map(
                                          (e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(e),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (val) {
                                      setState(() {
                                        _selectedValue = val as String;
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
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      hintText: TTexts.nextOfKinNamesubTitle,
                                      hintStyle:
                                          Theme.of(context).textTheme.bodySmall,
                                      fillColor: TColors.grey.withOpacity(0.4),
                                      filled: true,
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
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      hintText: TTexts.nextOfKinNumber,
                                      hintStyle:
                                          Theme.of(context).textTheme.bodySmall,
                                      fillColor: TColors.grey.withOpacity(0.4),
                                      filled: true,
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
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
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: TTexts.driverlicenseNumberhint,
                                  hintStyle:
                                      Theme.of(context).textTheme.bodySmall,
                                  fillColor: TColors.grey.withOpacity(0.4),
                                  filled: true,
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
                                controller: _date,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Select Date',
                                  prefixIcon: const Icon(Iconsax.calendar),
                                  fillColor: TColors.grey.withOpacity(0.4),
                                  filled: true,
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
                                      _date.text = DateFormat.yMMMd('en_US')
                                          .format(pickedDate);
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
                                onTapNav: () {
                                  context
                                      .go(BGRouteNames.driverLicenseGuideline);
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
                              DropdownButtonFormField(
                                elevation: 0,
                                dropdownColor: TColors.grey,
                                decoration: InputDecoration(
                                  hintText: 'Select one',
                                  prefixIcon: const Icon(
                                    Iconsax.car,
                                    color: TColors.primary,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: TColors.primary.withOpacity(0.3),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: TColors.grey.withOpacity(0.4),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: TColors.primary.withOpacity(0.3),
                                    ),
                                  ),
                                ),
                                icon: Icon(
                                  Iconsax.arrow_down_14,
                                  color: TColors.primary.withOpacity(0.4),
                                ),
                                value: _vehicleSelectedValue,
                                items: _vehicleList
                                    .map(
                                      (e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (val) {
                                  setState(() {
                                    _vehicleSelectedValue = val as String;
                                  });
                                },
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
                              DropdownButtonFormField(
                                elevation: 0,
                                dropdownColor: TColors.grey,
                                decoration: InputDecoration(
                                  hintText: 'Select one',
                                  prefixIcon: const Icon(
                                    Iconsax.car,
                                    color: TColors.primary,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: TColors.primary.withOpacity(0.3),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: TColors.grey.withOpacity(0.4),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: TColors.primary.withOpacity(0.3),
                                    ),
                                  ),
                                ),
                                icon: Icon(
                                  Iconsax.arrow_down_14,
                                  color: TColors.primary.withOpacity(0.4),
                                ),
                                value: _vehicleSelectedValue,
                                items: _vehicleList
                                    .map(
                                      (e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (val) {
                                  setState(() {
                                    _vehicleSelectedValue = val as String;
                                  });
                                },
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
                              DropdownButtonFormField(
                                elevation: 0,
                                dropdownColor: TColors.grey,
                                decoration: InputDecoration(
                                  hintText: 'Select one',
                                  prefixIcon: const Icon(
                                    Iconsax.car,
                                    color: TColors.primary,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: TColors.primary.withOpacity(0.3),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: TColors.grey.withOpacity(0.4),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: TColors.primary.withOpacity(0.3),
                                    ),
                                  ),
                                ),
                                icon: Icon(
                                  Iconsax.arrow_down_14,
                                  color: TColors.primary.withOpacity(0.4),
                                ),
                                value: _vehicleSelectedValue,
                                items: _vehicleList
                                    .map(
                                      (e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (val) {
                                  setState(() {
                                    _vehicleSelectedValue = val as String;
                                  });
                                },
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
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: 'e.g White',
                                  hintStyle:
                                      Theme.of(context).textTheme.bodySmall,
                                  fillColor: TColors.grey.withOpacity(0.4),
                                  filled: true,
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
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: 'AA123BBB',
                                  hintStyle:
                                      Theme.of(context).textTheme.bodySmall,
                                  fillColor: TColors.grey.withOpacity(0.4),
                                  filled: true,
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
                                onTapNav: () {
                                  context
                                      .go(BGRouteNames.driverExteriorGuideline);
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
                              DriverInfoUploadWidget(onTapNav: () {
                                context
                                    .go(BGRouteNames.driverInteriorGuideline);
                              }),
                              const SizedBox(
                                height: TSizes.spaceBtwSections,
                              ),
                            ],
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
                              DriverInfoUploadWidget(onTapNav: () {
                                context.go(BGRouteNames.driverProofOfOwnership);
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
                              DriverInfoUploadWidget(onTapNav: () {
                                context.go(BGRouteNames.driverVehicleLicense);
                              }),
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
                              DriverInfoUploadWidget(onTapNav: () {
                                context.go(BGRouteNames.driverRoadWorthiness);
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
                              DriverInfoUploadWidget(onTapNav: () {
                                context
                                    .go(BGRouteNames.driverInteriorGuideline);
                              }),
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
                            vertical: 20,
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

                              /// Bank Name
                              Text(
                                TTexts.driverBankName,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(
                                height: TSizes.spaceBtwItems,
                              ),
                              DropdownButtonFormField(
                                elevation: 0,
                                dropdownColor: TColors.grey,
                                decoration: InputDecoration(
                                  hintText: 'Select one',
                                  prefixIcon: const Icon(
                                    Iconsax.bank,
                                    color: TColors.primary,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: TColors.primary.withOpacity(0.3),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: TColors.grey.withOpacity(0.4),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: TColors.primary.withOpacity(0.3),
                                    ),
                                  ),
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
                                  fillColor: TColors.grey.withOpacity(0.4),
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
                                  fillColor: TColors.grey.withOpacity(0.4),
                                  filled: true,
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
}
