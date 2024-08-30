import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:bglory_rides/routing/driver_routing.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/image_strings.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PassengerRaatingScreen extends StatefulWidget {
  const PassengerRaatingScreen({super.key});

  @override
  State<PassengerRaatingScreen> createState() => _PassengerRaatingScreenState();
}

class _PassengerRaatingScreenState extends State<PassengerRaatingScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: TColors.white,
                  backgroundImage: AssetImage(
                    TImages.user,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  TTexts.driverPassengerRatingRiderTitle,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 15,
                      ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Container(
                  height: height * 0.2,
                  width: width,
                  decoration: BoxDecoration(
                    color: TColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            TTexts.driverPassengerRatingTitle,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: 23,
                                ),
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems),
                          const FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: TColors.warning,
                                  size: 30,
                                ),
                                Icon(
                                  Icons.star,
                                  color: TColors.warning,
                                  size: 30,
                                ),
                                Icon(
                                  Icons.star,
                                  color: TColors.warning,
                                  size: 30,
                                ),
                                Icon(
                                  Icons.star,
                                  color: TColors.warning,
                                  size: 30,
                                ),
                                Icon(
                                  Icons.star_border_rounded,
                                  color: TColors.warning,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            TTexts.driverPassengerRating,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: 23,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Container(
                  height: height * 0.2,
                  width: width,
                  decoration: BoxDecoration(
                    color: TColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            TTexts.driverPassengerRatingAdditionalCommentsTitle,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontSize: 17,
                                ),
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems),
                          Text(
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            TTexts.driverPassengerRatingAdditionalComments,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                SaveButtonWidget(
                  onTap: () {
                    context.go(BGRouteNames.driverHomePageScreen);
                  },
                  buttonText: TTexts.driverPassengerRatingButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
