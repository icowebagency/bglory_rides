import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../common/widgets/driver_info_upload_widget.dart';
import '../../../../../../common/widgets/save_button_widget.dart';
import '../../../../../../routing/driver_routing.dart';
import '../../../../../../utils/constants/colors.dart';

class VehicleInformationEditScreen extends StatefulWidget {
  const VehicleInformationEditScreen({super.key});

  @override
  State<VehicleInformationEditScreen> createState() =>
      _VehicleInformationEditScreenState();
}

class _VehicleInformationEditScreenState
    extends State<VehicleInformationEditScreen> {
  _VehicleInformationEditScreenState() {
    _vehicleSelectedValue = _vehicleList[0];
    _modelSelectedValue = _allVehicleModels[0];
    _yearSelectedValue = _yearList[0];
    _colorSelectedValue = _colorList[0];
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

  final List<String> _allVehicleModels = [
    'Corolla', 'Camry', 'RAV4', 'Highlander', 'Prius', 'Yaris', 'Avalon',
    'Sienna', 'Tacoma', 'Tundra', // Toyota
    'Golf', 'Passat', 'Jetta', 'Tiguan', 'Atlas', 'Beetle', 'Touareg', 'Arteon',
    'ID.4', // Volkswagen
    'F-150', 'Mustang', 'Explorer', 'Escape', 'Edge', 'Bronco', 'Ranger',
    'Expedition', 'Fusion', 'Maverick', // Ford
    'Civic', 'Accord', 'CR-V', 'Pilot', 'Fit', 'HR-V', 'Odyssey', 'Passport',
    'Ridgeline', // Honda
    'Silverado', 'Malibu', 'Equinox', 'Tahoe', 'Suburban', 'Camaro', 'Blazer',
    'Traverse', 'Trailblazer', // Chevrolet
    'Altima', 'Sentra', 'Maxima', 'Rogue', 'Murano', 'Pathfinder', 'Titan',
    'Frontier', 'Armada', // Nissan
    '3 Series', '5 Series', '7 Series', 'X1', 'X3', 'X5', 'X7', 'Z4', 'i3',
    'i8', // BMW
    'C-Class', 'E-Class', 'S-Class', 'GLA', 'GLC', 'GLE', 'GLS', 'A-Class',
    'AMG GT', // Mercedes-Benz
    // Add more models if needed
  ];

  final List<String> _yearList = List<String>.generate(
    DateTime.now().year - 1990 + 1,
    (index) => (1990 + index).toString(),
  );

  final List<String> _colorList = [
    'Black',
    'White',
    'Silver',
    'Gray',
    'Blue',
    'Red',
    'Brown',
    'Green',
    'Yellow',
    'Gold',
    'Orange',
    'Purple',
  ];

  String? _vehicleSelectedValue;
  String? _modelSelectedValue;
  String? _yearSelectedValue;
  String? _colorSelectedValue;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(TTexts.vehicleInformationAppBarTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
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
                          height: TSizes.spaceBtwInputFields,
                        ),
                        DropdownButtonFormField(
                          isExpanded: true,
                          elevation: 0,
                          dropdownColor: TColors.grey,
                          decoration: const InputDecoration(
                            hintText: 'Select one',
                            errorBorder: InputBorder.none,
                            fillColor: TColors.containerBackgroundColor,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.primary,
                              ),
                            ),
                            filled: true,
                          ),
                          icon: const Icon(
                            Iconsax.arrow_down_14,
                            color: TColors.primary,
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
                        Text(
                          TTexts.vehicleModelTitle,
                          style: Theme.of(context).textTheme.titleLarge!.apply(
                                color: TColors.grey,
                              ),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwInputFields,
                        ),
                        DropdownButtonFormField(
                          isExpanded: true,
                          elevation: 0,
                          dropdownColor: TColors.grey,
                          decoration: const InputDecoration(
                            hintText: 'Select one',
                            errorBorder: InputBorder.none,
                            filled: true,
                            fillColor: TColors.containerBackgroundColor,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.primary,
                              ),
                            ),
                          ),
                          icon: const Icon(
                            Iconsax.arrow_down_14,
                            color: TColors.primary,
                          ),
                          value: _modelSelectedValue,
                          items: _allVehicleModels
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                          onChanged: (val) {
                            setState(() {
                              _modelSelectedValue = val;
                            });
                          },
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        Text(
                          'Vehicle Year',
                          style: Theme.of(context).textTheme.titleLarge!.apply(
                                color: TColors.grey,
                              ),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwInputFields,
                        ),
                        DropdownButtonFormField(
                          isExpanded: true,
                          elevation: 0,
                          dropdownColor: TColors.grey,
                          decoration: const InputDecoration(
                            hintText: 'Select one',
                            errorBorder: InputBorder.none,
                            filled: true,
                            fillColor: TColors.containerBackgroundColor,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.primary,
                              ),
                            ),
                          ),
                          icon: const Icon(
                            Iconsax.arrow_down_14,
                            color: TColors.primary,
                          ),
                          value: _yearSelectedValue,
                          items: _yearList
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                          onChanged: (val) {
                            setState(() {
                              _yearSelectedValue = val;
                            });
                          },
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        Text(
                          TTexts.vehicleColorTitle,
                          style: Theme.of(context).textTheme.titleLarge!.apply(
                                color: TColors.grey,
                              ),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwInputFields,
                        ),
                        DropdownButtonFormField(
                          isExpanded: true,
                          elevation: 0,
                          dropdownColor: TColors.grey,
                          decoration: const InputDecoration(
                            hintText: 'Select one',
                            filled: true,
                            fillColor: TColors.containerBackgroundColor,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.primary,
                              ),
                            ),
                          ),
                          icon: const Icon(
                            Iconsax.arrow_down_14,
                            color: TColors.primary,
                          ),
                          value: _colorSelectedValue,
                          items: _colorList
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                          onChanged: (val) {
                            setState(() {
                              _colorSelectedValue = val;
                            });
                          },
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        Text(
                          TTexts.vehicleNumberTitle,
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: TColors.grey,
                              ),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwInputFields,
                        ),
                        TextFormField(
                          maxLines: 1,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText: TTexts.vehicleNumber,
                            hintStyle: Theme.of(context).textTheme.bodySmall,
                            fillColor: TColors.containerBackgroundColor,
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.grey,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.primary,
                              ),
                            ),
                            filled: true,
                          ),
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
                              TTexts.vehicleExteriorDemoText,
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
                              TTexts.vehicleInteriorDemoText,
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
                SaveButtonWidget(onTap: () {
                  context.go(BGDriverRouteNames.driverAccountScreen);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
