import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class FaqSubHeadings extends StatelessWidget {
  const FaqSubHeadings({
    super.key,
    required this.faqTitle,
    required this.faqOnTap,
    this.showDivider = true,
  });

  final String faqTitle;
  final VoidCallback faqOnTap;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: faqOnTap,
          title: Text(
            faqTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          trailing: const Icon(
            Iconsax.arrow_right_3,
            size: 20,
          ),
        ),
        if (showDivider)
          const Divider(
            endIndent: 15,
            indent: 15,
          ),
      ],
    );
  }
}
