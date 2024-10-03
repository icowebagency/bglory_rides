import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class RiderTripHisotryWidget extends StatelessWidget {
  const RiderTripHisotryWidget({
    super.key,
    required this.tripTitle,
    required this.tripSubTitle,
    this.onTap,
  });
  final String tripTitle;
  final String tripSubTitle;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
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
                  tripSubTitle,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: TColors.grey,
                      ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        const Divider(
          thickness: 1,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
      ],
    );
  }
}
