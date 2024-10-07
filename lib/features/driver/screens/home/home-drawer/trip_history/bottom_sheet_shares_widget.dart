import 'package:flutter/material.dart';

class BottomSheetSharesWidget extends StatelessWidget {
  const BottomSheetSharesWidget({
    super.key,
    required this.myBottomSheetIcon,
    required this.myBottomSheetText,
    required this.onTap,
  });

  final IconData myBottomSheetIcon;
  final String myBottomSheetText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(myBottomSheetIcon),
          const SizedBox(width: 20),
          Text(
            myBottomSheetText,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
