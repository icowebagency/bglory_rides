import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';

class RiderAddCardScreen extends StatefulWidget {
  const RiderAddCardScreen({super.key});

  @override
  State<RiderAddCardScreen> createState() => _RiderAddCardScreenState();
}

class _RiderAddCardScreenState extends State<RiderAddCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        actions: [
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    TTexts.skip,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: TColors.primary,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TTexts.riderAddCardTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Text(
              TTexts.riderAddCardNameOnCardTitle,
              style: Theme.of(context).textTheme.titleLarge!.apply(
                    color: TColors.grey,
                  ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TextFormField(
              maxLines: 1,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: TTexts.paymentDetailsBankAccountText,
                hintStyle: Theme.of(context).textTheme.bodySmall,
                fillColor: TColors.containerBackgroundColor,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: TColors.grey,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: TColors.primary,
                  ),
                ),
                filled: true,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              TTexts.riderAddCardCardNumberTitle,
              style: Theme.of(context).textTheme.titleLarge!.apply(
                    color: TColors.grey,
                  ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TextFormField(
              maxLines: 1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: TTexts.riderAddCardCardNumberTitle,
                hintStyle: Theme.of(context).textTheme.bodySmall,
                fillColor: TColors.containerBackgroundColor,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: TColors.grey,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: TColors.primary,
                  ),
                ),
                filled: true,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TTexts.riderAddCardExpirationDateTitle,
                        style: Theme.of(context).textTheme.titleLarge!.apply(
                              color: TColors.grey,
                            ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwInputFields,
                      ),
                      TextFormField(
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: TTexts.riderAddCardExpirationDate,
                          hintStyle: Theme.of(context).textTheme.bodySmall,
                          fillColor: TColors.containerBackgroundColor,
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: TColors.grey,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: TColors.primary,
                            ),
                          ),
                          filled: true,
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
                      FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              TTexts.riderAddCardCVVTitle,
                              style:
                                  Theme.of(context).textTheme.titleLarge!.apply(
                                        color: TColors.grey,
                                      ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwInputFields,
                      ),
                      TextFormField(
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: TTexts.riderAddCardCVVTitle,
                          hintStyle: Theme.of(context).textTheme.bodySmall,
                          fillColor: TColors.containerBackgroundColor,
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: TColors.grey,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: TColors.primary,
                            ),
                          ),
                          filled: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SaveButtonWidget(
              onTap: () {},
              buttonText: TTexts.driverProceedButton,
            ),
          ],
        ),
      ),
    );
  }
}
