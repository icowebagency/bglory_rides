import 'package:bglory_rides/common/widgets/loading_widget.dart';
import 'package:bglory_rides/features/rider/screens/rider_verification/verification_providers/verification_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';

import '../../../../common/widgets/save_button_widget.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class ConfirmTransactionPinScreen extends ConsumerStatefulWidget {
  const ConfirmTransactionPinScreen({super.key});

  @override
  ConsumerState<ConfirmTransactionPinScreen> createState() =>
      _ConfirmTransactionPinScreenState();
}

class _ConfirmTransactionPinScreenState
    extends ConsumerState<ConfirmTransactionPinScreen> {

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
        child: LoadingWidget(
          isLoading: ref.watch(verificationNotifier.select((val) => val.isLoading)),
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
                Form(
                  key: _formKey,
                  child: Pinput(
                    controller: state.confirmPin,
                    length: 4,
                    validator: (value) => value?.length != 4 ? "Input pin" : null,
                    onCompleted: (val) {
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                SaveButtonWidget(
                  onTap: () {
                    if(_formKey.currentState!.validate()) {
                      notifier.completeSignUp();
                    }
                  },
                  buttonText: TTexts.riderConfirmTransactionPinButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
