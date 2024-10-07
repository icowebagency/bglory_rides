import 'package:bglory_rides/features/rider/screens/home/bottomSheets_screens/add_new_credit_card.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/save_button_widget.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class PaymentAndCardsScreen extends StatefulWidget {
  const PaymentAndCardsScreen({super.key});

  @override
  State<PaymentAndCardsScreen> createState() => _PaymentAndCardsScreenState();
}

class _PaymentAndCardsScreenState extends State<PaymentAndCardsScreen> {
  // A set to keep track of selected value,
  int? selectedCardIndex;
  final List<String> cardLogos = [
    TImages.masterCard,
    TImages.visaCard,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          TTexts.riderPaymentAndCardAppbarTitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            Text(
              TTexts.riderPaymentAndCardTitle,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Column(
              children: List.generate(2, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        // Update the selected card index when a card is tapped.
                        selectedCardIndex = index;
                      },
                    );
                  },
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10), // Add some margin
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20), // Add padding inside the container
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: selectedCardIndex == index
                            ? TColors.primary
                            : TColors.grey,
                        width: 2,
                      ),
                      color: selectedCardIndex == index
                          ? TColors.accent
                              .withOpacity(0.2) // Change color if selected
                          : TColors.white, // Default color
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Radio<int>(
                              activeColor: selectedCardIndex == index
                                  ? TColors.primary
                                  : TColors.grey,
                              value: index,
                              groupValue:
                                  selectedCardIndex, // Bind to the selected index
                              onChanged: (value) {
                                setState(() {
                                  selectedCardIndex = value;
                                });
                              },
                            ),
                            Text(
                              TTexts.riderTripInAppPaymentCardDetailsTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                          ],
                        ),
                        Image(
                          height: 20,
                          fit: BoxFit.cover,
                          image: AssetImage(
                            cardLogos[index],
                          ),
                        ), // Replace with your image
                      ],
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            SaveButtonWidget(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: false,
                  context: context,
                  builder: (BuildContext context) {
                    return const AddNewCreditCardBottomSheet();
                  },
                );
              },
              buttonText: TTexts.riderPaymentAndCardButtonTitle,
            ),
          ],
        ),
      ),
    );
  }
}
