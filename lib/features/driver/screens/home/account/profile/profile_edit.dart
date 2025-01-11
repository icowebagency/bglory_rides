import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../routing/driver_routing.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(TTexts.driverProfileEditTitle),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                /// Profile Photo change section
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
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: TColors.buttonPrimaryDeepGreen,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Iconsax.add,
                                color: TColors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                /// Profile Details form
                Text(TTexts.profilePersonalInformation,
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
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
                        // Full name
                        Text(
                          TTexts.fullName,
                          style: Theme.of(context).textTheme.titleLarge!.apply(
                                color: TColors.grey,
                              ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          maxLines: 1,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText: TTexts.profileFullName,
                            hintStyle: Theme.of(context).textTheme.bodySmall,
                            fillColor: TColors.containerBackgroundColor,
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.grey,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.primary,
                              ),
                            ),
                            filled: true,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        // Address
                        Text(
                          TTexts.address,
                          style: Theme.of(context).textTheme.titleLarge!.apply(
                                color: TColors.grey,
                              ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),

                        TextFormField(
                          maxLines: 3,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            hintText: TTexts.profileAddress,
                            hintStyle: Theme.of(context).textTheme.bodySmall,
                            fillColor: TColors.containerBackgroundColor,
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.grey,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.primary,
                              ),
                            ),
                            filled: true,
                          ),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        // Date of birth
                        Text(
                          TTexts.phoneNo,
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: TColors.grey,
                              ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          maxLines: 1,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: TTexts.driverEditPhoneNumber,
                            hintStyle: Theme.of(context).textTheme.bodySmall,
                            fillColor: TColors.containerBackgroundColor,
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.grey,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.primary,
                              ),
                            ),
                            filled: true,
                          ),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        Text(
                          TTexts.email,
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: TColors.grey,
                              ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          maxLines: 1,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: TTexts.driverEmail,
                            hintStyle: Theme.of(context).textTheme.bodySmall,
                            fillColor: TColors.containerBackgroundColor,
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.grey,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.primary,
                              ),
                            ),
                            filled: true,
                          ),
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
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: TTexts.driverDay,
                                  hintMaxLines: 1,
                                  hintStyle:
                                      Theme.of(context).textTheme.bodySmall,
                                  fillColor: TColors.containerBackgroundColor,
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: TColors.grey,
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: TColors.primary,
                                    ),
                                  ),
                                  filled: true,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: TTexts.driverMonth,
                                  hintMaxLines: 1,
                                  hintStyle:
                                      Theme.of(context).textTheme.bodySmall,
                                  fillColor: TColors.containerBackgroundColor,
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: TColors.grey,
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: TColors.primary,
                                    ),
                                  ),
                                  filled: true,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  fillColor: TColors.containerBackgroundColor,
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: TColors.grey,
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: TColors.primary,
                                    ),
                                  ),
                                  hintText: TTexts.driverYear,
                                  hintMaxLines: 1,
                                  hintStyle:
                                      Theme.of(context).textTheme.bodySmall,
                                  filled: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        // Gender
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
                        Center(
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                context
                                    .go(BGDriverRouteNames.driverAccountScreen);
                              },
                              child: Text(
                                TTexts.driverUpdateButton,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .apply(
                                      color: TColors.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
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
