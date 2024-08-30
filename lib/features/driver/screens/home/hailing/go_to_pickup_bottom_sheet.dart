import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:bglory_rides/features/driver/screens/home/hailing/pickup_bottom_sheet.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/image_strings.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/distance_animation/car_animation_screen.dart';
import '../../../../../routing/driver_routing.dart';

class GoToPickupBottomSheetScreen extends StatefulWidget {
  const GoToPickupBottomSheetScreen({super.key});

  @override
  State<GoToPickupBottomSheetScreen> createState() =>
      _GoToPickupBottomSheetScreenState();
}

class _GoToPickupBottomSheetScreenState
    extends State<GoToPickupBottomSheetScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            // driver details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundColor: TColors.white,
                      backgroundImage: AssetImage(
                        TImages.user,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          TTexts.pickupBottomSheetDriverName,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 20),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.star,
                                color: TColors.warning, size: 20),
                            const SizedBox(width: 5),
                            Text(TTexts.pickupBottomSheetDriverRating,
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                // contact buttons row
                // contact buttons row
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.push(BGRouteNames.driverCallScreen);
                      },
                      child: const CircleAvatar(
                        backgroundColor: TColors.primary,
                        child: Icon(
                          Iconsax.call_calling,
                          color: TColors.white,
                          size: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.push(BGRouteNames.driverChatScreen);
                      },
                      child: const CircleAvatar(
                        backgroundColor: TColors.primary,
                        child: Icon(
                          Iconsax.message,
                          color: TColors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // driver animation
            const CarAnimationScreen(),
            // driver pickup dynamic time
            Center(
              child: Text(
                TTexts.pickupBottomSheetDriverArrivalTime,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 15),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            // driver pickup button
            SaveButtonWidget(
              onTap: () {
                Navigator.pop(context);
                showModalBottomSheet(
                  // constraints: BoxConstraints.tight(
                  //   Size.fromHeight(height * 0.4),
                  // ),
                  isScrollControlled: false,
                  context: context,
                  builder: (BuildContext context) {
                    return const PickupBottomSheetScreen();
                  },
                );
              },
              buttonText: TTexts.goToPickupBottomSheetDriverButton,
            )
          ],
        ),
      ),
    );
  }
}
