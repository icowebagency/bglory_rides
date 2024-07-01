import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../routing/driver_routing.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class DriverOptionScreen extends StatefulWidget {
  const DriverOptionScreen({super.key});

  @override
  State<DriverOptionScreen> createState() => _DriverOptionScreenState();
}

class _DriverOptionScreenState extends State<DriverOptionScreen> {
  // Variable to keep track of the selected container
  int _selectedIndex = -1;

  // Navigation method based on the selected index
  void _navigateToOption() {
    if (_selectedIndex == 0) {
      context.go(BGRouteNames
          .driverUploadInformation); // Navigate to the car option screen
    } else if (_selectedIndex == 1) {
      context.go(BGRouteNames
          .driverMotorcycleInformation); // Navigate to the motorcycle option screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              const Center(
                child: Image(
                  width: 150,
                  height: 100,
                  image: AssetImage(TImages.driverLogo),
                ),
              ),
              Text(
                TTexts.driverOptionTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 0; // Update the selected index
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.13,
                  decoration: BoxDecoration(
                    color: TColors.grey.withOpacity(0.3),
                    border: Border.all(
                      color:
                          _selectedIndex == 0 ? TColors.darkGrey : TColors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          TTexts.driverBoxTitle,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          TTexts.driverBoxTripTitle,
                          style:
                              Theme.of(context).textTheme.headlineSmall!.apply(
                                    color: TColors.darkGrey.withOpacity(0.6),
                                  ),
                        ),
                        Text(
                          TTexts.driverBoxCarTitle,
                          style:
                              Theme.of(context).textTheme.headlineSmall!.apply(
                                    color: TColors.darkGrey.withOpacity(0.6),
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 1; // Update the selected index
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.13,
                  decoration: BoxDecoration(
                    color: TColors.grey.withOpacity(0.3),
                    border: Border.all(
                      color:
                          _selectedIndex == 1 ? TColors.darkGrey : TColors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          TTexts.driverMotorcycleTitle,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          TTexts.driverMakeDelivery,
                          style:
                              Theme.of(context).textTheme.headlineSmall!.apply(
                                    color: TColors.darkGrey.withOpacity(0.6),
                                  ),
                        ),
                        Text(
                          TTexts.driverSubTitle,
                          style:
                              Theme.of(context).textTheme.headlineSmall!.apply(
                                    color: TColors.darkGrey.withOpacity(0.6),
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // context.go(BGRouteNames.driverUploadInformation);
                    _navigateToOption();
                  },
                  child: const Text(TTexts.driverProceedButton),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
