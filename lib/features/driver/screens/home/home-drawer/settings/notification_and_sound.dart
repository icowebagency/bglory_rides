import 'package:bglory_rides/routing/driver_routing.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../utils/constants/colors.dart';

class NotificationAndSoundScreen extends StatefulWidget {
  const NotificationAndSoundScreen({super.key});

  @override
  State<NotificationAndSoundScreen> createState() =>
      _NotificationAndSoundScreenState();
}

class _NotificationAndSoundScreenState
    extends State<NotificationAndSoundScreen> {
  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.sizeOf(context).width;
    // final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text(TTexts.appNotificationAndSoundTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App notification
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: TColors.white,
                ),
                child: ListTile(
                  onTap: () {
                    context.push(BGRouteNames.driverAppNotification);
                  },
                  title: const Text(TTexts.appNotificationTitle),
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
                    context.push(BGRouteNames.driverSoundScreen);
                  },
                  title: const Text(TTexts.appNotificationAndSoundTwoTitle),
                  trailing: const Icon(
                    Iconsax.arrow_right_3,
                    size: 18,
                    color: TColors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
