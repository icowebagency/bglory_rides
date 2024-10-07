import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class RiderTripPriceScreen extends StatefulWidget {
  const RiderTripPriceScreen({super.key});

  @override
  State<RiderTripPriceScreen> createState() => _RiderTripPriceScreenState();
}

class _RiderTripPriceScreenState extends State<RiderTripPriceScreen> {
  int? selectedRadio;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Add price options widgets here
              buildRadioButton(
                value: 1,
                title: TTexts.riderHomeScreenChooseRidePremiumTitle,
                subtitle: TTexts.riderHomeScreenChooseRidePremiumSubTitle,
                price: TTexts.riderHomeScreenChooseRidePremiumPriceTitle,
              ),
              buildRadioButton(
                value: 2,
                title: TTexts.riderHomeScreenChooseRidePremiumTitle,
                subtitle: TTexts.riderHomeScreenChooseRidePremiumSubTitle,
                price: TTexts.riderHomeScreenChooseRidePremiumPriceTitle,
              ),
              buildRadioButton(
                value: 3,
                title: TTexts.riderHomeScreenChooseRidePremiumTitle,
                subtitle: TTexts.riderHomeScreenChooseRidePremiumSubTitle,
                price: TTexts.riderHomeScreenChooseRidePremiumPriceTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRadioButton({
    required int value,
    required String title,
    required String subtitle,
    String? price,
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
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                        height: 8.0), // Space between subtitle and price
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  TTexts.nairaSymbol,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: isSelected ? TColors.success : TColors.dark,
                        fontSize: 18,
                        fontFamily: 'Notosans',
                        fontWeight: FontWeight.w900,
                      ),
                ),
                Text(
                  price!,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: isSelected ? TColors.success : TColors.dark,
                        fontSize: 18,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
