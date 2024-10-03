import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:bglory_rides/routing/rider_routing.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../../../utils/constants/text_strings.dart';

class TransactionPinScreen extends StatefulWidget {
  const TransactionPinScreen({super.key});

  @override
  State<TransactionPinScreen> createState() => _TransactionPinScreenState();
}

class _TransactionPinScreenState extends State<TransactionPinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                TTexts.riderTransactionPinTitle,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 25),
              ),
              Text(
                textAlign: TextAlign.center,
                TTexts.riderTransactionPinSubTitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Pinput(
                onTap: () {},
                length: 4,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SaveButtonWidget(
                onTap: () {
                  context
                      .push(BGRiderRouteNames.riderConfirmTransactionPinScreen);
                },
                buttonText: TTexts.driverProceedButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
