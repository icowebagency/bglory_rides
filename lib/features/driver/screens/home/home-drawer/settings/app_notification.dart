import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/text_strings.dart';

class AppNotificationScreen extends StatefulWidget {
  const AppNotificationScreen({super.key});

  @override
  State<AppNotificationScreen> createState() => _AppNotificationScreenState();
}

class _AppNotificationScreenState extends State<AppNotificationScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(TTexts.appNotificationTitle),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            // Email
            Container(
              decoration: BoxDecoration(
                color: TColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                onTap: () {},
                title: const Text(TTexts.appNotificationEmailTitle),
                trailing: Switch(
                  inactiveThumbColor: TColors.white,
                  inactiveTrackColor: TColors.grey,
                  trackOutlineColor:
                      const WidgetStatePropertyAll(TColors.white),
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeTrackColor: TColors.primary,
                  activeColor: TColors.white,
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            // Push
            Container(
              decoration: BoxDecoration(
                color: TColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                onTap: () {},
                title: const Text(TTexts.appNotificationPushTitle),
                trailing: Switch(
                  inactiveThumbColor: TColors.white,
                  inactiveTrackColor: TColors.grey,
                  trackOutlineColor:
                      const WidgetStatePropertyAll(TColors.white),
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeTrackColor: TColors.primary,
                  activeColor: TColors.white,
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            // SMS
            Container(
              decoration: BoxDecoration(
                color: TColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                onTap: () {},
                title: const Text(TTexts.appNotificationSmsTitle),
                trailing: Switch(
                  inactiveThumbColor: TColors.white,
                  inactiveTrackColor: TColors.grey,
                  trackOutlineColor:
                      const WidgetStatePropertyAll(TColors.white),
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeTrackColor: TColors.primary,
                  activeColor: TColors.white,
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            // In-app message
            Container(
              decoration: BoxDecoration(
                color: TColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                onTap: () {},
                title: const Text(TTexts.appNotificationInAppMessageTitle),
                trailing: Switch(
                  inactiveThumbColor: TColors.white,
                  inactiveTrackColor: TColors.grey,
                  trackOutlineColor:
                      const WidgetStatePropertyAll(TColors.white),
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeTrackColor: TColors.primary,
                  activeColor: TColors.white,
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            // In-app banners
            Container(
              decoration: BoxDecoration(
                color: TColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                onTap: () {},
                title: const Text(TTexts.appNotificationInAppBannerTitle),
                trailing: Switch(
                  inactiveThumbColor: TColors.white,
                  inactiveTrackColor: TColors.grey,
                  trackOutlineColor:
                      const WidgetStatePropertyAll(TColors.white),
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeTrackColor: TColors.primary,
                  activeColor: TColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
