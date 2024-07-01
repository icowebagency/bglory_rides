import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class DriverBox extends StatelessWidget {
  const DriverBox({
    super.key,
    required this.boxTitle,
    required this.boxSubTitle,
    required this.boxIcon,
    this.boxOnTap,
    this.useFittedBox = true,
  });
  final String boxTitle;
  final String boxSubTitle;
  final IconData boxIcon;
  final VoidCallback? boxOnTap;
  final bool useFittedBox;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: boxOnTap,
      child: Container(
        margin: const EdgeInsets.all(5),
        //  padding: const EdgeInsets.all(5),

        decoration: BoxDecoration(
          color: TColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                overflow: TextOverflow.ellipsis,
                boxTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Spacer(),
              if (useFittedBox)
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            boxIcon,
                            color: TColors.grey,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            boxSubTitle,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right_rounded,
                      ),
                    ],
                  ),
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          boxIcon,
                          color: TColors.grey,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          boxSubTitle,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: TSizes.spaceBtwItems,
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right_rounded,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
