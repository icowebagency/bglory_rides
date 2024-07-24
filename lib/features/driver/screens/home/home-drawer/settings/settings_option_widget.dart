import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';

class SettingsOptionWidget extends StatelessWidget {
  const SettingsOptionWidget({
    super.key,
    required this.settingsText,
    this.settingsTextTwoSelection,
    required this.onTap,
    this.trailingIcon,
    this.leadingIcon,
  });

  final String settingsText;
  final String? settingsTextTwoSelection;
  final VoidCallback onTap;
  final IconData? trailingIcon;
  final IconData? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    leadingIcon,
                    size: 20,
                    color: TColors.darkerGrey,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    settingsText,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: TColors.darkGrey.withOpacity(0.8)),
                  ),
                ],
              ),
              // off and icon right
              Row(
                children: [
                  if (settingsTextTwoSelection != null)
                    Text(
                      settingsTextTwoSelection!,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: TColors.grey, fontSize: 15),
                    ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    trailingIcon,
                    color: TColors.grey,
                    size: 15,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Divider(
            color: TColors.grey.withOpacity(0.4),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
