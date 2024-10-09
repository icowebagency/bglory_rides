import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/text_strings.dart';

class RiderAppNotificationScreen extends StatefulWidget {
  const RiderAppNotificationScreen({super.key});

  @override
  State<RiderAppNotificationScreen> createState() =>
      _RiderAppNotificationScreenState();
}

class _RiderAppNotificationScreenState
    extends State<RiderAppNotificationScreen> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          TTexts.riderNotificationAppTitle,
          style: Theme.of(context).textTheme.titleLarge,
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
              title: Text(
                TTexts.riderAppNotificationEmail,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              trailing: Switch(
                inactiveThumbColor: TColors.white,
                inactiveTrackColor: TColors.grey,
                trackOutlineColor: const WidgetStatePropertyAll(TColors.white),
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
            Divider(
              thickness: 1,
              color: TColors.softGrey.withOpacity(0.7),
              indent: 20,
              endIndent: 20,
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(
                TTexts.riderAppNotificationPush,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              trailing: Switch(
                inactiveThumbColor: TColors.white,
                inactiveTrackColor: TColors.grey,
                trackOutlineColor: const WidgetStatePropertyAll(TColors.white),
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
            const SizedBox(height: 10),
            Divider(
              thickness: 1,
              color: TColors.softGrey.withOpacity(0.7),
              indent: 20,
              endIndent: 20,
            ),
            ListTile(
              title: Text(
                TTexts.riderAppNotificationSMS,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              trailing: Switch(
                inactiveThumbColor: TColors.white,
                inactiveTrackColor: TColors.grey,
                trackOutlineColor: const WidgetStatePropertyAll(TColors.white),
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
            const SizedBox(height: 10),
            Divider(
              thickness: 1,
              color: TColors.softGrey.withOpacity(0.7),
              indent: 20,
              endIndent: 20,
            ),
            ListTile(
              title: Text(
                TTexts.riderAppNotificationInAppMessage,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              trailing: Switch(
                inactiveThumbColor: TColors.white,
                inactiveTrackColor: TColors.grey,
                trackOutlineColor: const WidgetStatePropertyAll(TColors.white),
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
            const SizedBox(height: 10),
            Divider(
              thickness: 1,
              color: TColors.softGrey.withOpacity(0.7),
              indent: 20,
              endIndent: 20,
            ),
            ListTile(
              title: Text(
                TTexts.riderAppNotificationInAppBanners,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              trailing: Switch(
                inactiveThumbColor: TColors.white,
                inactiveTrackColor: TColors.grey,
                trackOutlineColor: const WidgetStatePropertyAll(TColors.white),
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
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
