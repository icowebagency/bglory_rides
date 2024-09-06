import 'package:bglory_rides/routing/driver_routing.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../common/widgets/save_button_widget.dart';
import '../../../../../../../utils/constants/text_strings.dart';
import '../../../../../general_widgets/outlined_button_widget.dart';
import 'custom_radio_button.dart';

class ChangePaymentScreen extends StatefulWidget {
  const ChangePaymentScreen({super.key});

  @override
  State<ChangePaymentScreen> createState() => _ChangePaymentScreenState();
}

class _ChangePaymentScreenState extends State<ChangePaymentScreen> {
  int _selectedIndex = 0;

  void _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    TTexts.driverChangePaymentBottomSheetTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                  /// Add new card
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      context.push(BGRouteNames.driverAddCardScreen);
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Iconsax.add_circle,
                          color: TColors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          TTexts.driverChangePaymentBottomSheetAddButtonTitle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Add the custom radio buttons below the SizedBox
              Column(
                children: List.generate(
                  3,
                  (index) {
                    return CustomRadioButton(
                      index: index,
                      isSelected: _selectedIndex == index,
                      onTap: () => _onSelected(index),
                    );
                  },
                ),
              ),
              // Buttons
              const SizedBox(height: TSizes.spaceBtwSections),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: OutlinedButtonWidget(
                      onTap: () {},
                      buttonOutlineColor: TColors.dark,
                      buttonText:
                          TTexts.driverChangePaymentBottomSheetCancelButtonText,
                      //width: double.infinity,
                      buttonTextColor: TColors.dark,
                    ),
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Expanded(
                    child: SaveButtonWidget(
                      onTap: () {},
                      buttonTextColor: TColors.white,
                      buttonText: TTexts
                          .driverChangePaymentBottomSheetConfirmButtonText,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
