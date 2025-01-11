import 'package:bglory_rides/routing/rider_routing.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/text_strings.dart';

class RiderSettingsScreen extends StatefulWidget {
  const RiderSettingsScreen({super.key});

  @override
  State<RiderSettingsScreen> createState() => _RiderSettingsScreenState();
}

class _RiderSettingsScreenState extends State<RiderSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: TColors.containerBackgroundColor,
        centerTitle: true,
        title: const Text(
          TTexts.riderSettingsAppBarTitle,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                Iconsax.notification,
              ),
              title: Text(
                TTexts.riderSettingsNotificationTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              trailing: IconButton(
                onPressed: () {
                  context
                      .push(BGRiderRouteNames.riderNotificationsAndSoundScreen);
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
                Iconsax.path_square,
              ),
              title: Text(
                TTexts.riderSettingsThemeTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              trailing: IconButton(
                onPressed: () {
                  context.push(BGRiderRouteNames.riderThemeScreen);
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
                Iconsax.info_circle,
              ),
              title: Text(
                TTexts.riderSettingsAboutTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              trailing: IconButton(
                onPressed: () {
                  context.push(BGRiderRouteNames.riderAboutScreen);
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
    );
  }
}
