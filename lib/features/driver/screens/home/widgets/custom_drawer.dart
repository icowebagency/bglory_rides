import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../routing/driver_routing.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  double _currentRating = 3.5;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffF7F7F7),
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              height: MediaQuery.of(context).size.height * 0.09,
              width: double.infinity,
              decoration: BoxDecoration(
                color: TColors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: FittedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: const Image(
                          height: 50,
                          width: 50,
                          image: AssetImage(
                            TImages.user,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: TSizes.spaceBtwItems,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TTexts.driverName,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.verified,
                                  color: TColors.primary,
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  TTexts.homeVerifiedLabel,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .apply(color: TColors.primary),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                AnimatedRatingStars(
                                  starSize: 10,
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
                                  initialRating: 3.5,
                                  onChanged: (rating) {
                                    setState(() {
                                      _currentRating = rating;
                                    });
                                  },
                                  customFilledIcon: Icons.star,
                                  customEmptyIcon: Icons.star_outline,
                                  customHalfFilledIcon: Icons.star_half,
                                ),
                              ],
                            ),
                            Text(
                              _currentRating.toString(),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Profile Icon Button
                    IconButton(
                      onPressed: () {
                        context.push(BGRouteNames.driverAccountScreen);
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        size: 30,
                        color: TColors.darkGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.wallet_rounded),
              title: const Text(TTexts.homeDrawerEarnings),
              onTap: () {
                context.push(BGRouteNames.driverEarnings);
              },
            ),
            ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text(TTexts.homeDrawerTripHistory),
              onTap: () {
                context.push(BGRouteNames.driverTripHistory);
              },
            ),
            ListTile(
              leading: const Icon(Iconsax.setting_2),
              title: const Text(TTexts.homeDrawerSettings),
              onTap: () {
                context.push(BGRouteNames.driverSettings);
              },
            ),
            ListTile(
              leading: const Icon(Iconsax.security_safe),
              title: const Text(TTexts.homeDrawerSafety),
              onTap: () {
                context.push(BGRouteNames.driverSafety);
              },
            ),
            ListTile(
              leading: const Icon(Iconsax.support),
              title: const Text(TTexts.homeDrawerSupport),
              onTap: () {
                context.push(BGRouteNames.driverHelpAndSupport);
              },
            ),
          ],
        ),
      ),
    );
  }
}
