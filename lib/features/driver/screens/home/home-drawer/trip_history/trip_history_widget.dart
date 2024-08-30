import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../utils/constants/colors.dart';

class TripHistoryWidget extends StatelessWidget {
  const TripHistoryWidget({
    super.key,
    this.onTap,
    required this.tripTitle,
    required this.tripLocation,
    required this.tripPrice,
    required this.tripDate,
  });

  final String tripTitle;
  final String tripLocation;
  final String tripPrice;
  final String tripDate;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Icon, location title, and location state
              Row(
                children: [
                  // icon section
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: TColors.grey.withOpacity(0.2),
                    ),
                    child: Icon(
                      Iconsax.routing,
                      color: TColors.darkGrey.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        tripTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        tripLocation,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: TColors.grey,
                            ),
                      ),
                    ],
                  )
                ],
              ),

              // trip price and date
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Price
                    Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      tripPrice,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontFamily: 'Notosans',
                          ),
                    ),
                    // Date
                    Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      tripDate,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: TColors.grey,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Divider(
            thickness: 1,
            color: TColors.grey.withOpacity(0.4),
          ),
        ],
      ),
    );
  }
}
