import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../routing/driver_routing.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../drivers_document/driver_document.dart';

class PaymentDetailsScreen extends StatefulWidget {
  const PaymentDetailsScreen({super.key});

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        //  vehicle payment app bar title
        title: const Text(TTexts.paymentDetailsAppBarTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // vehicle payment sub title
            const Text(TTexts.paymentDetailsSubTitle),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            const Text(
              TTexts.paymentDetailsTitle,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            // Driver payment details section
            Container(
              width: width,
              decoration: BoxDecoration(
                color: TColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Driver bank name
                    Text(
                      TTexts.paymentDetailsBankNameTitle,
                      style: Theme.of(context).textTheme.titleLarge!.apply(
                            color: TColors.grey,
                          ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    // license number
                    Text(
                      TTexts.paymentDetailsBankNameText,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),

                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    // Driver bank holder name
                    Text(
                      TTexts.paymentDetailsBankAccountTitle,
                      style: Theme.of(context).textTheme.titleLarge!.apply(
                            color: TColors.grey,
                          ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    Text(
                      TTexts.paymentDetailsBankAccountText,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    // Driver bank account number
                    Text(
                      TTexts.paymentDetailsBankAccountNumberTitle,
                      style: Theme.of(context).textTheme.titleLarge!.apply(
                            color: TColors.grey,
                          ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    Text(
                      TTexts.paymentDetailsBankAccountNumberText,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),

                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    const Divider(
                      color: TColors.grey,
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    DriverEditButton(
                      onTap: () {
                        context.go(BGRouteNames.driverPaymentDetailsEditScreen);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
