import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../../../common/widgets/motorcycle_upload_information_widget.dart';
import '../../../../../routing/driver_routing.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class DriverMotorcycleInformation extends StatefulWidget {
  const DriverMotorcycleInformation({super.key});

  @override
  State<DriverMotorcycleInformation> createState() =>
      _DriverMotorcycleInformationState();
}

class _DriverMotorcycleInformationState
    extends State<DriverMotorcycleInformation> {
  final TextEditingController _date = TextEditingController();
  final TextEditingController _dateOfBirth = TextEditingController();

  /// variables
  _DriverMotorcycleInformationState() {
    _vehicleSelectedValue = _motorcycleList[0];
    _banksSelectedValue = _nigerianBanks[0];
    _motorcycleModelSelectedValue = _motorcycleModelList[0];
    _motorcycleColorSelectedValue = _motorcycleColorList[0];
  }

  final List<String> _motorcycleList = [
    'Honda',
    'Yamaha',
    'Suzuki',
    'Kawasaki',
    'Harley-Davidson',
    'Ducati',
    'BMW Motorrad',
    'KTM',
    'Triumph',
    'Aprilia',
    'Moto Guzzi',
    'Royal Enfield',
    'Indian Motorcycle',
    'Husqvarna Motorcycles',
    'MV Agusta'
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
  final List<String> _motorcycleModelList = [
    'Honda CBR600RR',
    'Yamaha YZF-R1',
    'Suzuki GSX-R750',
    'Kawasaki Ninja ZX-6R',
    'Harley-Davidson Sportster',
    'Ducati Panigale V4',
    'BMW S1000RR',
    'KTM 1290 Super Duke R',
    'Triumph Street Triple',
    'Aprilia RSV4',
    'Moto Guzzi V7',
    'Royal Enfield Classic 500',
    'Indian Scout',
    'Husqvarna Vitpilen 701',
    'MV Agusta Brutale 800'
  ];

  final List<String> _motorcycleColorList = [
    'Red',
    'Blue',
    'Black',
    'White',
    'Green',
    'Yellow',
    'Orange',
    'Silver',
    'Gray',
    'Purple',
    'Brown',
    'Gold',
    'Maroon',
    'Cyan',
    'Pink'
  ];

  String? _vehicleSelectedValue = "";
  String? _banksSelectedValue = "";
  String? _motorcycleModelSelectedValue = "";
  String? _motorcycleColorSelectedValue = "";

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
  final int _totalSteps = 3;
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
                        const MaterialStatePropertyAll(TColors.primary),
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
                                TTexts.driverlicenseTitle,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwSections,
                            ),
                            Form(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// license number
                                  Text(
                                    TTexts.driverlicenseNumber,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(
                                    height: TSizes.spaceBtwItems,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      hintText: TTexts
                                          .driverMotocyclelicenseNumberhint,
                                      hintStyle:
                                          Theme.of(context).textTheme.bodySmall,
                                      fillColor: TColors.grey.withOpacity(0.4),
                                      filled: true,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: TSizes.spaceBtwSections,
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

                                  /// License Upload
                                  Text(
                                    TTexts.driverlicensePhoto,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(
                                    height: TSizes.spaceBtwItems,
                                  ),
                                  MotorcycleUploadInformationWidget(onTap: () {
                                    context.go(
                                        BGRouteNames.driverLicenseGuideline);
                                  }),
                                  const SizedBox(
                                    height: TSizes.spaceBtwSections,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// Step 2  -  Motorcycle Information
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
                                    Icons.motorcycle_rounded,
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
                                items: _motorcycleList
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

                              /// Motorcycle Model
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
                                    Icons.motorcycle,
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
                                value: _motorcycleModelSelectedValue,
                                items: _motorcycleModelList
                                    .map(
                                      (e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (val) {
                                  setState(() {
                                    _motorcycleModelSelectedValue =
                                        val as String;
                                  });
                                },
                              ),
                              const SizedBox(
                                height: TSizes.spaceBtwSections,
                              ),

                              /// Motorcycle Color
                              Text(
                                TTexts.driverVehicleColorTitle,
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
                                    Icons.motorcycle,
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
                                value: _motorcycleColorSelectedValue,
                                items: _motorcycleColorList
                                    .map(
                                      (e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (val) {
                                  setState(() {
                                    _motorcycleColorSelectedValue =
                                        val as String;
                                  });
                                },
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

                              /// License Upload
                              Text(
                                TTexts.driverlicensePhoto,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(
                                height: TSizes.spaceBtwItems,
                              ),
                              MotorcycleUploadInformationWidget(onTap: () {
                                context.go(BGRouteNames.driverLicenseGuideline);
                              }),
                              const SizedBox(
                                height: TSizes.spaceBtwSections,
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// Step 3  -  Document information

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
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(
                                height: TSizes.spaceBtwItems,
                              ),
                              MotorcycleUploadInformationWidget(onTap: () {
                                // context.go(BGRouteNames.driverLicenseGuideline);
                              }),
                              const SizedBox(
                                height: TSizes.spaceBtwSections,
                              ),

                              /// Motorcycle insurance
                              Text(
                                TTexts.driverMotocycleInsuranceTitle,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(
                                height: TSizes.spaceBtwItems,
                              ),
                              MotorcycleUploadInformationWidget(onTap: () {
                                // context.go(BGRouteNames.driverLicenseGuideline);
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
