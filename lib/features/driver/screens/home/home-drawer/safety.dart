import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../routing/driver_routing.dart';
import '../../../../../utils/constants/colors.dart';

class SafetyScreen extends StatefulWidget {
  const SafetyScreen({super.key});

  @override
  State<SafetyScreen> createState() => _SafetyScreenState();
}

class _SafetyScreenState extends State<SafetyScreen> {
  Future<void> _showPopupDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button to close
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text(TTexts.driverSafetyOptionOneTitle)),
          backgroundColor: TColors.dragableBottomSheetColor,
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  TTexts.driverPopupExactLocationTitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 15),
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
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 15),
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
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: TColors.popupColor,
                  ),
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      TTexts.driverPopupSubText,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                GestureDetector(
                  onTap: () {},
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
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(TTexts.driverSafetyAppBarTitle),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Text(
                TTexts.driverSafetySubTitle,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: TColors.white,
                ),
                child: ListTile(
                  onTap: () {
                    _showPopupDialog(context);
                  },
                  leading: const Icon(
                    Iconsax.danger,
                    color: TColors.error,
                    size: 18,
                  ),
                  title: const Text(TTexts.driverSafetyOptionOneTitle),
                  trailing: const Icon(
                    Iconsax.arrow_right_3,
                    size: 18,
                    color: TColors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: TColors.white,
                ),
                child: ListTile(
                  onTap: () {
                    context
                        .push(BGRouteNames.driverSafetyShareTripDetailsScreen);
                  },
                  leading: const Icon(
                    Iconsax.wifi_square,
                    color: TColors.primary,
                    size: 18,
                  ),
                  title: const Text(TTexts.driverSafetyOptionTwoTitle),
                  trailing: const Icon(
                    Iconsax.arrow_right_3,
                    size: 18,
                    color: TColors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
