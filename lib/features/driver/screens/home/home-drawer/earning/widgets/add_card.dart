import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/constants/text_strings.dart';
import '../../../../../../../utils/validators/validation.dart';
import '../../../../../general_widgets/custom_drop_down.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({
    super.key,
    required this.formKey,
    required String? banksSelectedValue,
    required List<String> nigerianBanks,
    required TextEditingController bankAccountName,
    required TextEditingController bankAccountNumber,
    required this.onSelectBank,
  })  : _banksSelectedValue = banksSelectedValue,
        _nigerianBanks = nigerianBanks,
        _bankAccountName = bankAccountName,
        _bankAccountNumber = bankAccountNumber;

  final GlobalKey<FormState> formKey;
  final String? _banksSelectedValue;
  final List<String> _nigerianBanks;
  final TextEditingController _bankAccountName;
  final TextEditingController _bankAccountNumber;
  final ValueChanged<String?> onSelectBank;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                TTexts.driverPaymentDetailsTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            /// Bank Name
            Text(
              TTexts.driverBankName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            ValidatedDropdown(
              dropdownColor: TColors.grey,
              isExpanded: true,
              decoration: const InputDecoration(
                hintText: 'Select one',
                prefixIcon: Icon(
                  Iconsax.bank,
                  color: TColors.primary,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: TColors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: TColors.primary),
                ),
                filled: true,
                fillColor: TColors.containerBackgroundColor,
              ),
              icon: Icon(
                Iconsax.arrow_down_14,
                color: TColors.primary.withOpacity(0.4),
              ),
              initialValue: _banksSelectedValue,
              items: _nigerianBanks,
              onChanged: (val) {
                onSelectBank(val);
              },
              validator: TValidator.simpleInputValidation,
            ),

            /// Bank account holder name
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              TTexts.driverBankAccountHolderNameTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              controller: _bankAccountName,
              validator: TValidator.simpleInputValidation,
              decoration: InputDecoration(
                hintText: TTexts.driverBankHolderNameHint,
                hintStyle: Theme.of(context).textTheme.bodySmall,
                fillColor: TColors.containerBackgroundColor,
                filled: true,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: TColors.grey,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: TColors.primary),
                ),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            /// Bank account number
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              TTexts.driverBankAccountHolderNumberTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            TextFormField(
              controller: _bankAccountNumber,
              keyboardType: TextInputType.number,
              validator: TValidator.validNumber,
              decoration: InputDecoration(
                hintText: TTexts.driverBankHolderNumberHint,
                hintStyle: Theme.of(context).textTheme.bodySmall,
                fillColor: TColors.containerBackgroundColor,
                filled: true,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: TColors.grey,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: TColors.primary),
                ),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            Expanded(
              child: SaveButtonWidget(
                onTap: () {},
                buttonText: TTexts.driverChangePaymentBottomSheetSave,
                buttonTextColor: TColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
