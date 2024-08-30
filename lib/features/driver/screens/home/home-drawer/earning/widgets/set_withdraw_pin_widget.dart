import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../../../../../../common/widgets/save_button_widget.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/constants/text_strings.dart';
import '../../../../../general_widgets/outlined_button_widget.dart';

class SetWithdrawPinWidget extends StatefulWidget {
  const SetWithdrawPinWidget({
    super.key,
    this.isConfirmation = false,
  });

  final bool isConfirmation;

  @override
  State<SetWithdrawPinWidget> createState() => _SetWithdrawPinWidgetState();
}

class _SetWithdrawPinWidgetState extends State<SetWithdrawPinWidget> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();

    _startListening();
    super.initState();
  }

  @override
  void dispose() {
    _stopListening();
    _controller.dispose();
    super.dispose();
  }

  void _startListening() {
    _controller.addListener(
      _rebuild,
    );
  }

  void _stopListening() {
    _controller.removeListener(_rebuild);
  }

  void _rebuild() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var pinTheme = PinTheme(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: TColors.white,
        border: Border.all(
          color: TColors.grey,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
    );
    const pinLength = 4;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.isConfirmation
                ? TTexts.setWithdrawModalTitleConfirm
                : TTexts.setWithdrawModalTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Text(
            widget.isConfirmation
                ? TTexts.setWithdrawModalTextConfirmation
                : TTexts.setWithdrawModalText,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Center(
            child: Pinput(
              controller: _controller,
              length: pinLength,
              autofocus: true,
              defaultPinTheme: pinTheme,
              focusedPinTheme: pinTheme.copyDecorationWith(
                border: Border.all(color: TColors.primary),
              ),
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: OutlinedButtonWidget(
                  buttonOutlineColor: TColors.primary,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  buttonText: TTexts.withdrawButtonCancelText,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: SaveButtonWidget(
                  onTap: _controller.text.length < pinLength
                      ? null
                      : () {
                          context.pop(_controller.text);
                        },
                  buttonText: widget.isConfirmation
                      ? TTexts.driverConfirm
                      : TTexts.driverProceedButton,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
