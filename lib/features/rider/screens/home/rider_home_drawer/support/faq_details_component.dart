import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class RiderFaqDetailsComponent extends StatelessWidget {
  const RiderFaqDetailsComponent({
    super.key,
    required this.faqTitle,
    this.showDivider = true,
    required this.faqDetail,
  });

  final String faqTitle;

  final bool showDivider;
  final String faqDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            faqTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(
            faqDetail,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        if (showDivider)
          const Divider(
            thickness: 0.7,
            endIndent: 15,
            indent: 15,
            color: TColors.softGrey,
          ),
      ],
    );
  }
}
