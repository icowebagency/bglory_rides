import 'package:flutter/material.dart';

import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';

class TabTableWidget extends StatelessWidget {
  const TabTableWidget({
    super.key,
    required this.firstText,
    required this.lastText,
    this.dividerColor,
    this.subText,
  });

  final String firstText;
  final String lastText;
  final Color? dividerColor;
  final String? subText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  firstText,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                if (subText != null)
                  FittedBox(
                    child: Text(
                      subText!,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: TColors.grey,
                            fontSize: 10,
                          ),
                    ),
                  ),
              ],
            ),
            Text(
              lastText,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontFamily: 'Notosans',
                  ),
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),
        Divider(
          color: dividerColor,
        ),
      ],
    );
  }
}
