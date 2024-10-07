import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:bglory_rides/features/driver/general_widgets/outlined_button_widget.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import 'confirmation_pin.dart';

class AddNewCreditCardBottomSheet extends StatefulWidget {
  const AddNewCreditCardBottomSheet({super.key});

  @override
  State<AddNewCreditCardBottomSheet> createState() =>
      _AddNewCreditCardBottomSheetState();
}

class _AddNewCreditCardBottomSheetState
    extends State<AddNewCreditCardBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                TTexts.riderPaymentAndCardAppbarTitle,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                TTexts.riderAddNewCardBottomSheetNameOnCard,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 10),

              /// Name on card
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: TTexts.riderAddNewCardBottomSheetNameOnCard,
                  labelStyle: Theme.of(context).textTheme.bodySmall,
                  filled: true,
                  fillColor: TColors.containerBackgroundColor.withOpacity(0.6),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: TColors.primary,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                    borderSide: const BorderSide(
                      color: TColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                TTexts.riderAddNewCardBottomSheetCardNumber,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 10),

              /// card number
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: TTexts.riderAddNewCardBottomSheetCardNumber,
                  labelStyle: Theme.of(context).textTheme.bodySmall,
                  filled: true,
                  fillColor: TColors.containerBackgroundColor.withOpacity(0.6),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: TColors.primary,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                    borderSide: const BorderSide(
                      color: TColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TTexts.riderAddNewCardBottomSheetExpiryDate,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 10),

                        /// expiration date
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText:
                                TTexts.riderAddNewCardBottomSheetExpiryDate,
                            labelStyle: Theme.of(context).textTheme.bodySmall,
                            filled: true,
                            fillColor: TColors.containerBackgroundColor
                                .withOpacity(0.6),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.primary,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: const BorderSide(
                                color: TColors.primary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TTexts.riderAddNewCardBottomSheetCVV,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 10),

                        /// CVV
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: TTexts.riderAddNewCardBottomSheetCVV,
                            labelStyle: Theme.of(context).textTheme.bodySmall,
                            filled: true,
                            fillColor: TColors.containerBackgroundColor
                                .withOpacity(0.6),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.primary,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: const BorderSide(
                                color: TColors.primary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Add card
              SaveButtonWidget(
                onTap: () {
                  Navigator.pop(context);
                  showModalBottomSheet(
                    isScrollControlled: false,
                    context: context,
                    builder: (BuildContext context) {
                      return const RiderConfirmationPinScreen();
                    },
                  );
                },
                buttonText: TTexts.riderAddNewCardBottomSheetButton,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Cancel
              OutlinedButtonWidget(
                onTap: () {
                  Navigator.pop(context);
                },
                buttonText: TTexts.driverCancelRide,
                buttonOutlineColor: TColors.error,
                buttonTextColor: TColors.error,
              ),
              const SizedBox(height: TSizes.spaceBtwItems * 2),
            ],
          ),
        ),
      ),
    );
  }
}
