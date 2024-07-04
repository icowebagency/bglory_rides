import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../common/widgets/driver_info_upload_widget.dart';
import '../../../../../../routing/driver_routing.dart';
import '../../../../../../utils/constants/colors.dart';

class VehicleInformationEditScreen extends StatefulWidget {
  VehicleInformationEditScreen({super.key});

  @override
  State<VehicleInformationEditScreen> createState() =>
      _VehicleInformationEditScreenState();
}

class _VehicleInformationEditScreenState
    extends State<VehicleInformationEditScreen> {
  /// variables
  _VehicleInformationEditScreenState() {
    _selectedValue = _genderList[0];
    _vehicleSelectedValue = _vehicleList[0];
    _modelSelectedValue = _vehicleModelList[_vehicleSelectedValue]![0];
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

  final Map<String, List<String>> _vehicleModelList = {
    'Toyota': [
      'Corolla',
      'Camry',
      'RAV4',
      'Highlander',
      'Prius',
      'Yaris',
      'Avalon',
      'Sienna',
      'Tacoma',
      'Tundra',
    ],
    'Volkswagen': [
      'Golf',
      'Passat',
      'Jetta',
      'Tiguan',
      'Atlas',
      'Beetle',
      'Touareg',
      'Arteon',
      'ID.4',
    ],
    'Ford': [
      'F-150',
      'Mustang',
      'Explorer',
      'Escape',
      'Edge',
      'Bronco',
      'Ranger',
      'Expedition',
      'Fusion',
      'Maverick',
    ],
    'Honda': [
      'Civic',
      'Accord',
      'CR-V',
      'Pilot',
      'Fit',
      'HR-V',
      'Odyssey',
      'Passport',
      'Ridgeline',
    ],
    'Chevrolet': [
      'Silverado',
      'Malibu',
      'Equinox',
      'Tahoe',
      'Suburban',
      'Camaro',
      'Blazer',
      'Traverse',
      'Trailblazer',
    ],
    'Nissan': [
      'Altima',
      'Sentra',
      'Maxima',
      'Rogue',
      'Murano',
      'Pathfinder',
      'Titan',
      'Frontier',
      'Armada',
    ],
    'BMW': [
      '3 Series',
      '5 Series',
      '7 Series',
      'X1',
      'X3',
      'X5',
      'X7',
      'Z4',
      'i3',
      'i8',
    ],
    'Mercedes-Benz': [
      'C-Class',
      'E-Class',
      'S-Class',
      'GLA',
      'GLC',
      'GLE',
      'GLS',
      'A-Class',
      'AMG GT',
    ],
    // Add more manufacturers and their models as needed
  };

  final _genderList = [
    "Male",
    "Female",
  ];

  String? _selectedValue;
  String? _vehicleSelectedValue;
  String? _modelSelectedValue;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(TTexts.vehicleInformationAppBarTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(TTexts.vehicleInformationSubTitle),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Text(
              TTexts.vehicleInformationAppBarTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            Container(
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: TColors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      TTexts.vehicleManufacturerTitle,
                      style: Theme.of(context).textTheme.titleLarge!.apply(
                            color: TColors.grey,
                          ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    DropdownButtonFormField(
                      elevation: 0,
                      dropdownColor: TColors.grey,
                      decoration: const InputDecoration(
                        hintText: 'Select one',
                        errorBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        filled: true,
                        fillColor: TColors.containerBackgroundColor,
                      ),
                      icon: const Icon(
                        Iconsax.arrow_down_14,
                        color: TColors.black,
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
                          _vehicleSelectedValue = val;
                        });
                      },
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    DropdownButtonFormField(
                      elevation: 0,
                      dropdownColor: TColors.grey,
                      decoration: const InputDecoration(
                        hintText: 'Select one',
                        errorBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        filled: true,
                        fillColor: TColors.containerBackgroundColor,
                      ),
                      icon: Icon(
                        Iconsax.arrow_down_14,
                        color: TColors.primary.withOpacity(0.4),
                      ),
                      value: _modelSelectedValue,
                      items: _vehicleSelectedValue != null
                          ? _vehicleModelList[_vehicleSelectedValue]!
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList()
                          : [],
                      onChanged: (val) {
                        setState(() {
                          _modelSelectedValue = val as String?;
                        });
                      },
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.photo_library_outlined),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          TTexts.documentLicensePhotoDemoText,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    DriverInfoUploadWidget(
                      onTapNav: () {},
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: width,
              child: ElevatedButton(
                onPressed: () {
                  context.go(BGRouteNames.driverAccountScreen);
                },
                child: const Text(TTexts.driverUpdateButton),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
