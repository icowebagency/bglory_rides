import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      backgroundColor: const Color(0xffF7F7F7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  TTexts.profileTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
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
                          child: const Icon(
                            Iconsax.add,
                            color: TColors.white,
                            size: 20,
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
              Text(
                TTexts.profilePersonalInformation,
                style: Theme.of(context).textTheme.bodyLarge!.apply(
                      color: TColors.grey,
                    ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Container(
                // height: height * 0.45,
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
                        style: Theme.of(context).textTheme.titleLarge,
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
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Text(
                        TTexts.dateOfBirth,
                        style: Theme.of(context).textTheme.titleLarge!.apply(
                              color: TColors.grey,
                            ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        TTexts.profileBirth,
                        style: Theme.of(context).textTheme.titleLarge,
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
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),
                      const Divider(
                        color: TColors.grey,
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),
                      Center(
                        child: Text(
                          TTexts.profileEdit,
                          style: Theme.of(context).textTheme.titleLarge!.apply(
                                color: TColors.buttonPrimaryDeepGreen,
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
    );
  }
}
