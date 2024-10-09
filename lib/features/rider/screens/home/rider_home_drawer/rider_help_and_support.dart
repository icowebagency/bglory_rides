import 'package:bglory_rides/common/custom_shapes/curved_edges.dart';
import 'package:bglory_rides/routing/rider_routing.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/image_strings.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/custom_shapes/tcircular_container.dart';

class RiderHelpAndSupportScreen extends StatefulWidget {
  const RiderHelpAndSupportScreen({super.key});

  @override
  State<RiderHelpAndSupportScreen> createState() =>
      _RiderHelpAndSupportScreenState();
}

class _RiderHelpAndSupportScreenState extends State<RiderHelpAndSupportScreen> {
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
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 50,
                                  width: 80,
                                  child: Image(
                                    fit: BoxFit.contain,
                                    image: AssetImage(TImages.darkAppLogo),
                                  ),
                                ),
                                Text(
                                  TTexts.riderProfileScreenRealFullNameTitle,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        color: TColors.secondary,
                                      ),
                                ),
                                Text(
                                  TTexts.supportSubText,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: TColors.white,
                                      ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                context.go(
                                  BGRiderRouteNames.riderHomeScreen,
                                );
                              },
                              icon: const Icon(
                                Iconsax.close_circle,
                                color: TColors.white,
                                size: 20,
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

            /// Main content
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
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {
                            context.push(BGRiderRouteNames.riderChatScreen);
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
                        const Divider(
                          thickness: 1,
                          color: TColors.softGrey,
                          indent: 20,
                          endIndent: 20,
                        ),
                        ListTile(
                          onTap: () {
                            context.push(BGRiderRouteNames.riderCallUsScreen);
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
                        const Divider(
                          thickness: 1,
                          color: TColors.softGrey,
                          indent: 20,
                          endIndent: 20,
                        ),
                        ListTile(
                          onTap: () {
                            context.push(BGRiderRouteNames.riderFaqsScreen);
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
                      ],
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
