import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:bglory_rides/routing/rider_routing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class RiderCustomDrawer extends StatefulWidget {
  const RiderCustomDrawer({super.key, this.onItemTapped, this.index});

  final ValueChanged<int>? onItemTapped;
  final int? index;

  @override
  State<RiderCustomDrawer> createState() => _RiderCustomDrawerState();
}

class _RiderCustomDrawerState extends State<RiderCustomDrawer> {
  double _currentRating = 3.5;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffF7F7F7),
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            /// Driver quick profile option
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              height: MediaQuery.sizeOf(context).height * 0.09,
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
                          fit: BoxFit.cover,
                          height: 50,
                          width: 50,
                          image: AssetImage(
                            TImages.riderUser,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: TSizes.spaceBtwItems,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TTexts.riderProfileScreenRealFullNameTitle,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                AnimatedRatingStars(
                                  readOnly: true,
                                  starSize: 7,
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
                              ],
                            ),
                            Text(
                              _currentRating.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Profile Icon Button
                    IconButton(
                      onPressed: () {
                        context.push(BGRiderRouteNames.riderProfileScreen);
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

            /// Trip history
            ListTile(
              leading: const Icon(Iconsax.home),
              title: const Text(TTexts.riderHomeScreenTitle),
              onTap: () {
                // context.go(BGRiderRouteNames.riderTripHistoryScreen);
                widget.onItemTapped?.call(0);
              },
            ),

            /// Trip history
            ListTile(
              leading: const Icon(Iconsax.clock),
              title: const Text(TTexts.riderTripHistory),
              onTap: () {
                // context.go(BGRiderRouteNames.riderTripHistoryScreen);
                widget.onItemTapped?.call(1);
              },
            ),

            /// Payment and cards
            ListTile(
              leading: const Icon(Icons.wallet_rounded),
              title: const Text(TTexts.riderPaymentAndCards),
              onTap: () {
                widget.onItemTapped?.call(2);
              },
            ),

            /// Settings
            ListTile(
              leading: const Icon(Iconsax.setting_2),
              title: const Text(TTexts.riderSettings),
              onTap: () {
                widget.onItemTapped?.call(3);
              },
            ),

            /// Safety option
            ListTile(
              leading: const Icon(Iconsax.security_safe),
              title: const Text(TTexts.riderSafety),
              onTap: () {
                // context.push(BGRouteNames.driverSettings);
                widget.onItemTapped?.call(4);
              },
            ),

            /// Help and support
            ListTile(
              leading: const Icon(Iconsax.support),
              title: const Text(TTexts.riderHelpAndSupport),
              onTap: () {
                widget.onItemTapped?.call(5);
              },
            ),
            const Spacer(),

            /// Logout
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: TColors.error,
              ),
              title: const Text(TTexts.homeDrawerLogout),
              onTap: () {},
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
          ],
        ),
      ),
    );
  }
}
