import 'package:bglory_rides/routing/driver_routing.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../utils/constants/text_strings.dart';

class DriverCallOptionSheetScreen extends StatefulWidget {
  const DriverCallOptionSheetScreen({
    super.key,
  });

  @override
  State<DriverCallOptionSheetScreen> createState() =>
      _DriverCallOptionSheetScreenState();
}

class _DriverCallOptionSheetScreenState
    extends State<DriverCallOptionSheetScreen> {
  int _selectedIndex = -1; // -1 means no selection

  void _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _dialNumber(String number) async {
    final Uri url = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      // Handle the error if the device cannot dial the number
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cannot dial the number $number')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.driverCallOptionSheetTitle,
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 25),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          GestureDetector(
            onTap: () {
              _onSelected(0);
              context.go(BGRouteNames.driverCallScreen);
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height * 0.07,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: TColors.white,
                border: Border.all(
                    color: _selectedIndex == 0 ? TColors.primary : TColors.grey,
                    width: _selectedIndex == 0 ? 2 : 1),
              ),
              child: Row(
                children: [
                  Icon(
                    Iconsax.call_incoming,
                    color: _selectedIndex == 0 ? TColors.primary : TColors.grey,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Text(
                    TTexts.driverCallOptionSheetInAppCallTitle,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _onSelected(1);
              _dialNumber(
                  '+234 703 085 0395'); // Replace with the actual number
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height * 0.07,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: TColors.white,
                border: Border.all(
                    color: _selectedIndex == 1 ? TColors.primary : TColors.grey,
                    width: _selectedIndex == 1 ? 2 : 1),
              ),
              child: Row(
                children: [
                  Icon(
                    Iconsax.call_outgoing,
                    color: _selectedIndex == 1 ? TColors.primary : TColors.grey,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Text(
                    TTexts.driverCallOptionSheetPhoneCarrierCallTitle,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
