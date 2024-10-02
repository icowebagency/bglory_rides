import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({
    super.key,
    this.width = double.infinity,
    this.heightFraction = 0.07,
    required this.containerText,
    required this.containerBtn,
  });

  final double? width;
  final double heightFraction;
  final String containerText;
  final VoidCallback containerBtn;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double containerHeight = screenHeight * heightFraction;

    return GestureDetector(
      onTap: containerBtn,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        width: width,
        height: containerHeight,
        decoration: BoxDecoration(
          color: TColors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                containerText,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .apply(color: TColors.black),
              ),
            ),
            const Icon(Icons.keyboard_arrow_right_rounded),
          ],
        ),
      ),
    );
  }
}
