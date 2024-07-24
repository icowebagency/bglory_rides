import 'package:bglory_rides/routing/driver_routing.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App settings
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: TColors.white,
              ),
              child: ListTile(
                onTap: () {
                  context.push(BGRouteNames.driverAppSettingsScreen);
                },
                leading: const Icon(Iconsax.setting_2),
                title: const Text(TTexts.settingsAppSettingsText),
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
            // Notification and sound
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: TColors.white,
              ),
              child: ListTile(
                onTap: () {
                  context.push(BGRouteNames.driverNotificationAndSound);
                },
                leading: const Icon(Iconsax.notification),
                title: const Text(TTexts.settingsNotificationText),
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
            // Theme
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: TColors.white,
              ),
              child: ListTile(
                onTap: () {},
                leading: const Icon(Iconsax.path_square),
                title: const Text(TTexts.settingsThemeText),
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
            // About
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: TColors.white,
              ),
              child: ListTile(
                onTap: () {},
                leading: const Icon(Iconsax.info_circle),
                title: const Text(TTexts.settingsAboutText),
                trailing: const Icon(
                  Iconsax.arrow_right_3,
                  size: 18,
                  color: TColors.grey,
                ),
              ),
            ),

            //ToggleButtons(children: [], isSelected: List.empty())
          ],
        ),
      )),
    );
  }
}
