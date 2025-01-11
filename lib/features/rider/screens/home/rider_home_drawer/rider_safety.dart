import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../routing/rider_routing.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class RiderSafetyScreen extends StatefulWidget {
  const RiderSafetyScreen({super.key});

  @override
  State<RiderSafetyScreen> createState() => _RiderSafetyScreenState();
}

class _RiderSafetyScreenState extends State<RiderSafetyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          TTexts.riderSafetyAppBarTitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Text(
              TTexts.riderSafetySubTitle,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: TColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const Icon(
                      Iconsax.danger,
                      color: TColors.error,
                    ),
                    title: Text(
                      TTexts.riderSafetyEmergencyTitle,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: TColors.error,
                          ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        _emergencyDialog(context);
                      },
                      icon: const Icon(
                        Iconsax.arrow_right_3,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: TColors.softGrey.withOpacity(0.7),
                    indent: 20,
                    endIndent: 20,
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(
                      Iconsax.share,
                    ),
                    title: Text(
                      TTexts.riderSafetyShareTrip,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        context.push(
                            BGRiderRouteNames.riderSafetyShareDetailsScreen);
                      },
                      icon: const Icon(
                        Iconsax.arrow_right_3,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Popup
Future<void> _emergencyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button to close
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
          child: Text(
            TTexts.driverSafetyOptionOneTitle,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        backgroundColor: TColors.dragableBottomSheetColor,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              TTexts.driverPopupExactLocationTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              TTexts.driverPopupExactLocationAddress,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            Text(
              TTexts.driverPopupVehicleDetailsTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              TTexts.driverPopupVehicleDetails,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: TColors.popupColor,
              ),
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  TTexts.driverPopupSubText,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            GestureDetector(
              onTap: () {
                _emergencyDialog(context);
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: TColors.error,
                ),
                child: Center(
                  child: Text(
                    TTexts.driverPopupPhoneNumberTitle,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: TColors.white,
                        ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}
