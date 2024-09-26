import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../../common/widgets/save_button_widget.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class ConfirmTransactionPinScreen extends StatefulWidget {
  const ConfirmTransactionPinScreen({super.key});

  @override
  State<ConfirmTransactionPinScreen> createState() =>
      _ConfirmTransactionPinScreenState();
}

class _ConfirmTransactionPinScreenState
    extends State<ConfirmTransactionPinScreen> {
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
                TTexts.riderConfirmTransactionPinTitle,
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
                onTap: () {},
                buttonText: TTexts.riderConfirmTransactionPinButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
