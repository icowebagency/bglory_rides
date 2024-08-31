import 'package:bglory_rides/common/custom_shapes/curved_edges.dart';
import 'package:bglory_rides/routing/driver_routing.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/image_strings.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/custom_shapes/tcircular_container.dart';

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({super.key});

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: TCustomCurvedEdges(),
              child: Container(
                padding: const EdgeInsets.all(0),
                color: TColors.primary,
                child: SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      const Positioned(
                        top: -150,
                        right: -250,
                        child: TCircularContainer(
                          backgroundColor: TColors.white,
                        ),
                      ),
                      const Positioned(
                        top: 100,
                        right: -300,
                        child: TCircularContainer(
                          backgroundColor: TColors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 30,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 50,
                                  width: 100,
                                  child: Image(
                                    fit: BoxFit.contain,
                                    image: AssetImage(TImages.darkAppLogo),
                                  ),
                                ),
                                Text(
                                  TTexts.supportWelcomeName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: TColors.secondary,
                                        fontSize: 25,
                                      ),
                                ),
                                Text(
                                  TTexts.supportSubText,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: TColors.white,
                                        fontSize: 20,
                                      ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                context.go(BGRouteNames.driverHomePageScreen);
                              },
                              icon: const Icon(
                                Iconsax.close_circle,
                                color: TColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Main content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Text(
                    TTexts.supportTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: TColors.white,
                    ),
                    child: ListTile(
                      onTap: () {
                        context.push(BGRouteNames.driverChatScreen);
                      },
                      leading: const Icon(
                        Iconsax.sms_tracking,
                        size: 18,
                      ),
                      title: const Text(TTexts.supportSendMessageTitle),
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
                        context.push(BGRouteNames.driverCallUsScreen);
                      },
                      leading: const Icon(
                        Iconsax.call_outgoing,
                        size: 18,
                      ),
                      title: const Text(TTexts.supportCallTitle),
                      trailing: const Icon(
                        Iconsax.arrow_right_3,
                        size: 18,
                        color: TColors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),
                  Text(
                    TTexts.supportGetHelpTitle,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: TColors.white,
                    ),
                    child: ListTile(
                      onTap: () {
                        context.push(BGRouteNames.driverFaqsScreen);
                      },
                      leading: const Icon(
                        Iconsax.search_status,
                        size: 18,
                      ),
                      title: const Text(TTexts.supportExploreFAQsTitle),
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
          ],
        ),
      ),
    );
  }
}
