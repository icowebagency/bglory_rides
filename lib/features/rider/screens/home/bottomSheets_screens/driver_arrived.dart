import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/distance_animation/car_animation_screen.dart';
import '../../../../../routing/driver_routing.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/text_strings.dart';

class DriverArrivedBottomSheet extends StatefulWidget {
  const DriverArrivedBottomSheet({super.key});

  @override
  State<DriverArrivedBottomSheet> createState() =>
      _DriverArrivedBottomSheetState();
}

class _DriverArrivedBottomSheetState extends State<DriverArrivedBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: TColors.accent.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: FittedBox(
              child: Row(
                children: [
                  // user image and details
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: TColors.dark),
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(TImages.riderUser),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                TTexts.riderDriverFoundBottomSheetDriverName,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: TColors.warning,
                                    size: 15,
                                  ),
                                  Text(
                                    TTexts
                                        .riderDriverFoundBottomSheetDriverRating,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(fontSize: 13),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                TTexts.riderDriverFoundBottomSheetDriverCarName,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Text(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                TTexts
                                    .riderDriverFoundBottomSheetDriverCarPlatNumber,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  // phone call icons
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.push(BGDriverRouteNames.driverCallScreen);
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
                          context.push(BGDriverRouteNames.driverChatScreen);
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
            ),
          ),
          const CarAnimationScreen(),
          Text(
            TTexts.riderDriverFoundBottomSheetDriverArrivedTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 13,
          ),
          SaveButtonWidget(
            onTap: () {},
            buttonText:
                TTexts.riderDriverFoundBottomSheetDriverConfirmTripTitle,
          ),
        ],
      ),
    );
  }
}
