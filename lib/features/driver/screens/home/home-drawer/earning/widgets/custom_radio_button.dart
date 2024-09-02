import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomRadioButton({
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isSelected
              ? TColors.white
              : TColors.containerBackgroundColor.withOpacity(0.4),
          border: Border.all(
            color: isSelected ? TColors.primary : TColors.grey,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: isSelected ? TColors.primary : Colors.grey,
            ),
            Flexible(
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                TTexts.withdrawPaymentHint,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: isSelected ? Colors.black : Colors.grey,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
