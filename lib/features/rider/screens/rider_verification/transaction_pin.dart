import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:bglory_rides/features/rider/screens/rider_verification/verification_providers/verification_notifier.dart';
import 'package:bglory_rides/routing/rider_routing.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../../../utils/constants/text_strings.dart';

class TransactionPinScreen extends ConsumerStatefulWidget {
  const TransactionPinScreen({super.key});

  @override
  ConsumerState<TransactionPinScreen> createState() => _TransactionPinScreenState();
}

class _TransactionPinScreenState extends ConsumerState<TransactionPinScreen> {

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(verificationNotifier);
    final notifier = ref.watch(verificationNotifier.notifier);
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
              Form(
                key: _formKey,
                child: Pinput(
                  // key: _formKey,
                  // onTap: () {},
                  controller: state.transactionPin,
                  onCompleted: (val) {
                    FocusScope.of(context).unfocus();
                  },
                  validator: (value) => value?.length != 4 ? "Input pin" : null,
                  length: 4,
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SaveButtonWidget(
                onTap: () {
                  if(_formKey.currentState!.validate()) {
                    context
                        .push(
                        BGRiderRouteNames.riderConfirmTransactionPinScreen);
                  }
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
