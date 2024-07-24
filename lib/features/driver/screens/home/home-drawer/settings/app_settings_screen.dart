import 'package:bglory_rides/routing/driver_routing.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../utils/constants/colors.dart';

class AppSettingsScreen extends StatefulWidget {
  const AppSettingsScreen({super.key});

  @override
  State<AppSettingsScreen> createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends State<AppSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text(TTexts.appSettingsAppBarTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Auto accept
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: TColors.white,
                ),
                child: ListTile(
                  onTap: () {
                    context.push(BGRouteNames.driverAutoAccept);
                  },
                  leading: const Icon(Iconsax.check),
                  title: const Text(TTexts.appSettingsAutoAcceptTitle),
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
                  onTap: () {},
                  leading: const Icon(Iconsax.language_square),
                  title: const Text(TTexts.appSettingsLanguageTitle),
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
              Text(
                TTexts.appSettingsSubTitle,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
