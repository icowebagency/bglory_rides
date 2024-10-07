import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class RiderPaymentBottomSheet extends StatefulWidget {
  const RiderPaymentBottomSheet({super.key});

  @override
  State<RiderPaymentBottomSheet> createState() =>
      _RiderPaymentBottomSheetState();
}

class _RiderPaymentBottomSheetState extends State<RiderPaymentBottomSheet> {
  int? selectedRadio;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add price options widgets here
          paymentBuildRadioButton(
            value: 0,
            title: TTexts.riderPaymentTypeBottomSheetDebitTitle,
          ),
          paymentBuildRadioButton(
            value: 1,
            title: TTexts.riderPaymentTypeBottomSheetCashTitle,
          ),
        ],
      ),
    );
  }

  Widget paymentBuildRadioButton({
    required int value,
    required String title,
  }) {
    bool isSelected = selectedRadio == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRadio = value;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: TColors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: isSelected ? TColors.primary : TColors.grey.withOpacity(0.3),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Radio<int>(
                  value: value,
                  groupValue: selectedRadio,
                  onChanged: (int? newValue) {
                    setState(() {
                      selectedRadio =
                          newValue; // Update the selected radio value
                    });
                  },
                  activeColor: isSelected
                      ? TColors.primary
                      : TColors.grey, // Change radio color
                ),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleLarge),
                    // Space between subtitle and price
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
