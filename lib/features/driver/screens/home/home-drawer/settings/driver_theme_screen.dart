import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';

class DriverThemeScreen extends StatefulWidget {
  const DriverThemeScreen({super.key});

  @override
  State<DriverThemeScreen> createState() => _DriverThemeScreenState();
}

class _DriverThemeScreenState extends State<DriverThemeScreen> {
  int _selectedRadio = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TTexts.driverThemeAppBarTitle),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: TColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                onTap: () {},
                title: const Text(TTexts.driverThemeSystemDefault),
                trailing: Radio(
                  activeColor: TColors.primary,
                  value: 1,
                  groupValue: _selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadio = value!;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: TColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                onTap: () {},
                title: const Text(TTexts.driverThemeDark),
                trailing: Radio(
                  activeColor: TColors.primary,
                  value: 1,
                  groupValue: _selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadio = value!;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: TColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                onTap: () {},
                title: const Text(TTexts.driverThemeLight),
                trailing: Radio(
                  activeColor: TColors.primary,
                  value: 1,
                  groupValue: _selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadio = value!;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
          ],
        ),
      ),
    );
  }
}
