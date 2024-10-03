import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:bglory_rides/features/driver/general_widgets/outlined_button_widget.dart';
import 'package:bglory_rides/routing/rider_routing.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/image_strings.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class RiderProfileScreen extends StatefulWidget {
  const RiderProfileScreen({super.key});

  @override
  State<RiderProfileScreen> createState() => _RiderProfileScreenState();
}

class _RiderProfileScreenState extends State<RiderProfileScreen> {
  double _currentRating = 3.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          TTexts.riderProfileScreenAppBarTitle,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                context.go(BGRiderRouteNames.riderHomeScreen);
              },
              icon: const Icon(
                Iconsax.home,
                color: TColors.primary,
              ),
            ),
          ),
        ],
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
                  child: Container(
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
                    borderRadius: BorderRadius.circular(10),
                    color: TColors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TTexts.riderProfileScreenFullNameTitle,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        TTexts.riderProfileScreenRealFullNameTitle,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Text(
                        TTexts.riderProfileScreenPhoneNumberTitle,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            TTexts.riderProfileScreenRealPhoneNumberTitle,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            TTexts.riderProfileScreenVerifiedTitle,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontSize: 12,
                                  color: TColors.primary,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Text(
                        TTexts.riderProfileScreenEmailTitle,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            TTexts.riderProfileScreenRealEmailTitle,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            TTexts.riderProfileScreenNotVerifiedTitle,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: TColors.warning,
                                  fontSize: 12,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Divider(
                        color: TColors.grey.withOpacity(0.3),
                        indent: 20,
                        endIndent: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.push(
                            BGRiderRouteNames.riderProfileEditScreen,
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Iconsax.edit,
                              color: TColors.primary,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              TTexts.riderProfileScreenEditTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: TColors.primary),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                Text(
                  TTexts.riderProfileScreenSavedPlacesTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: TColors.white,
                  ),
                  child: Column(
                    children: [
                      // saved places
                      ListTile(
                        leading: const Icon(
                          Iconsax.home,
                        ),
                        title: Text(
                          TTexts.riderProfileScreenSavedPlacesHomeAddressTitle,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        subtitle: Text(
                          overflow: TextOverflow.ellipsis,
                          TTexts
                              .riderProfileScreenSavedPlacesRealHomeAddressTitle,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Iconsax.arrow_right_3),
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Divider(
                        color: TColors.grey.withOpacity(0.3),
                        indent: 20,
                        endIndent: 20,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      // fav
                      ListTile(
                        leading: const Icon(
                          Iconsax.heart,
                          color: TColors.error,
                        ),
                        title: Text(
                          TTexts.riderProfileScreenSavedPlacesAddFavTitle,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            context
                                .push(BGRiderRouteNames.riderSavedPlacesScreen);
                          },
                          icon: const Icon(Iconsax.arrow_right_3),
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                    ],
                  ),
                ),
                // Log out
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: TColors.white,
                  ),
                  child: Column(
                    children: [
                      // saved places
                      ListTile(
                        onTap: () {
                          _logOutPopUpDialog(context);
                        },
                        leading: const Icon(
                          Iconsax.logout,
                          color: TColors.error,
                        ),
                        title: Text(
                          TTexts.riderProfileScreenLogOutTitle,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: TColors.error,
                                  ),
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Divider(
                        color: TColors.grey.withOpacity(0.3),
                        indent: 20,
                        endIndent: 20,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      // fav
                      ListTile(
                        onTap: () {
                          _deleteAccountDialog(context);
                        },
                        leading: const Icon(
                          Iconsax.trash,
                          color: TColors.error,
                        ),
                        title: Text(
                          TTexts.riderProfileScreenDeleteAccountTitle,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: TColors.error,
                                  ),
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                    ],
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

void _logOutPopUpDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                TTexts.riderPopUpDialogTitle,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 20),
              ),
              Text(
                textAlign: TextAlign.center,
                TTexts.riderPopUpDialogSubTitle,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              SaveButtonWidget(
                onTap: () {},
                buttonText: TTexts.riderPopUpDialogButtonOneTitle,
                buttonColor: TColors.error,
              ),
              const SizedBox(
                height: 10,
              ),
              OutlinedButtonWidget(
                onTap: () {},
                buttonText: TTexts.riderPopUpDialogButtonTwoTitle,
                buttonTextColor: TColors.dark,
                buttonOutlineColor: TColors.dark,
              )
            ],
          ),
        ),
      );
    },
  );
}

void _deleteAccountDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.35,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                TTexts.riderDeleteAccountPopUpDialogTitle,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 20),
              ),
              Text(
                textAlign: TextAlign.center,
                TTexts.riderDeleteAccountPopUpDialogSubTitle,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              SaveButtonWidget(
                onTap: () {},
                buttonText: TTexts.riderDeleteAccountPopUpDialogButtonOneTitle,
                buttonColor: TColors.error,
              ),
              const SizedBox(
                height: 10,
              ),
              OutlinedButtonWidget(
                onTap: () {},
                buttonText: TTexts.riderPopUpDialogButtonTwoTitle,
                buttonTextColor: TColors.dark,
                buttonOutlineColor: TColors.dark,
              )
            ],
          ),
        ),
      );
    },
  );
}
