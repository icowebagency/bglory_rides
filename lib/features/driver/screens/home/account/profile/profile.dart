import 'package:bglory_rides/features/driver/screens/home/account/drivers_document/driver_document.dart';
import 'package:bglory_rides/routing/driver_routing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          TTexts.profileTitle,
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xffF7F7F7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            // vertical: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Profile section
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: const BoxDecoration(
                          //   border: Border.all(color: TColors.grey),
                          image: DecorationImage(
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.contain,
                            image: AssetImage(TImages.user),
                          ),
                          color: TColors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      // Positioned(
                      //   bottom: 0,
                      //   right: 0,
                      //   child: GestureDetector(
                      //     onTap: () {},
                      //     child: Container(
                      //       width: 35,
                      //       height: 35,
                      //       decoration: const BoxDecoration(
                      //         shape: BoxShape.circle,
                      //         color: TColors.buttonPrimaryDeepGreen,
                      //       ),
                      //       child: IconButton(
                      //         onPressed: () {},
                      //         icon: const Icon(
                      //           Iconsax.add,
                      //           color: TColors.white,
                      //           size: 20,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                Text(
                  TTexts.profilePersonalInformation,
                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                        color: TColors.grey,
                      ),
                ),
                const SizedBox(
                  height: 5,
                ),

                /// Profile Details
                Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: TColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TTexts.fullName,
                          style: Theme.of(context).textTheme.titleLarge!.apply(
                                color: TColors.grey,
                              ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          TTexts.profileFullName,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        Text(
                          TTexts.address,
                          style: Theme.of(context).textTheme.titleLarge!.apply(
                                color: TColors.grey,
                              ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          TTexts.profileAddress,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        Text(
                          TTexts.dateOfBirth,
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: TColors.grey,
                              ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          TTexts.profileBirth,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        Text(
                          TTexts.profileGenderTitle,
                          style: Theme.of(context).textTheme.titleLarge!.apply(
                                color: TColors.grey,
                              ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          TTexts.profileGender,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        const Divider(
                          color: TColors.grey,
                          thickness: 1,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),
                        DriverEditButton(onTap: () {
                          context.go(BGRouteNames.driverProfileEdit);
                        })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
