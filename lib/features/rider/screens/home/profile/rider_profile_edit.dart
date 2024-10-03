import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:bglory_rides/routing/rider_routing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class RiderProfileEditScreen extends StatefulWidget {
  const RiderProfileEditScreen({super.key});

  @override
  State<RiderProfileEditScreen> createState() => _RiderProfileEditScreenState();
}

class _RiderProfileEditScreenState extends State<RiderProfileEditScreen> {
  double _currentRating = 3.5;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          TTexts.riderProfileScreenEditAppBarTitle,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      // Profile image
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 10,
                            color: TColors.grey.withOpacity(0.4),
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: const CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage(
                            TImages.riderUser,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: TColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Iconsax.edit,
                                color: TColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Center(
                  child: Text(
                    TTexts.riderProfileScreenRealFullNameTitle,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 20),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedRatingStars(
                      readOnly: true,
                      starSize: 15,
                      displayRatingValue: true,
                      minRating: 0.0,
                      maxRating: 5.0,
                      emptyColor: Colors.grey,
                      interactiveTooltips: true,
                      filledIcon: Icons.star,
                      filledColor: TColors.warning,
                      emptyIcon: Icons.star_outlined,
                      halfFilledIcon: Icons.star_half,
                      animationCurve: Curves.easeInOut,
                      animationDuration: const Duration(
                        milliseconds: 500,
                      ),
                      initialRating: 3.7,
                      onChanged: (rating) {
                        setState(
                          () {
                            _currentRating = rating;
                          },
                        );
                      },
                      customFilledIcon: Icons.star,
                      customEmptyIcon: Icons.star_outline,
                      customHalfFilledIcon: Icons.star_half,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      _currentRating.toString(),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                Text(
                  TTexts.riderProfileScreenPersonalInfoTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: TColors.white,
                  ),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: firstNameController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                firstNameController.clear();
                              },
                              icon: const Icon(
                                Iconsax.close_circle,
                                size: 18,
                                color: TColors.grey,
                              ),
                            ),
                            labelText: TTexts.firstName,
                            labelStyle: Theme.of(context).textTheme.bodySmall,
                            filled: true,
                            fillColor: TColors.containerBackgroundColor
                                .withOpacity(0.6),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.primary,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: TColors.grey,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: lastNameController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                lastNameController.clear();
                              },
                              icon: const Icon(
                                Iconsax.close_circle,
                                size: 18,
                                color: TColors.grey,
                              ),
                            ),
                            labelText: TTexts.lastName,
                            labelStyle: Theme.of(context).textTheme.bodySmall,
                            filled: true,
                            fillColor: TColors.containerBackgroundColor
                                .withOpacity(0.6),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.primary,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: TColors.grey,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: phoneNumberController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                phoneNumberController.clear();
                              },
                              icon: const Icon(
                                Iconsax.close_circle,
                                size: 18,
                                color: TColors.grey,
                              ),
                            ),
                            labelText: TTexts.phoneNo,
                            labelStyle: Theme.of(context).textTheme.bodySmall,
                            filled: true,
                            fillColor: TColors.containerBackgroundColor
                                .withOpacity(0.6),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.primary,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: TColors.grey,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                emailController.clear();
                              },
                              icon: const Icon(
                                Iconsax.close_circle,
                                size: 18,
                                color: TColors.grey,
                              ),
                            ),
                            labelText: TTexts.email,
                            labelStyle: Theme.of(context).textTheme.bodySmall,
                            filled: true,
                            fillColor: TColors.containerBackgroundColor
                                .withOpacity(0.6),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.primary,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: TColors.grey,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems * 3,
                        ),
                        SaveButtonWidget(
                          onTap: () {
                            context.go(BGRiderRouteNames.riderProfileScreen);
                          },
                          buttonText:
                              TTexts.riderProfileScreenEditButtonTextTitle,
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
