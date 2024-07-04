import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../routing/driver_routing.dart';
import '../../../../../utils/constants/colors.dart';
import '../widgets/account_widget.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    double currentRating = 3.5;
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              TTexts.driverName,
              style: Theme.of(context).textTheme.titleLarge,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                            .bodySmall!
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
                            currentRating = rating;
                          });
                        },
                        customFilledIcon: Icons.star,
                        customEmptyIcon: Icons.star_outline,
                        customHalfFilledIcon: Icons.star_half,
                      ),
                    ],
                  ),
                  Text(
                    ' ${currentRating.toString()}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Iconsax.setting,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              AccountWidget(
                containerBtn: () {
                  context.push(BGRouteNames.driverProfile);
                },
                containerText: TTexts.tAccount,
              ),
              AccountWidget(
                containerText: TTexts.tDriverDocument,
                containerBtn: () {
                  context.push(BGRouteNames.driverDocumentScreen);
                },
              ),
              AccountWidget(
                containerText: TTexts.tVehicleInformation,
                containerBtn: () {
                  context.push(BGRouteNames.vehicleInformation);
                },
              ),
              AccountWidget(
                containerText: TTexts.tPaymentDetails,
                containerBtn: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
