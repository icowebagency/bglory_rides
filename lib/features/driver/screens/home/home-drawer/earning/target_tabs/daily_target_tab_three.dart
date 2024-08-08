import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class DailyTargetTabThree extends StatefulWidget {
  const DailyTargetTabThree({super.key});

  @override
  State<DailyTargetTabThree> createState() => _DailyTargetTabThreeState();
}

class _DailyTargetTabThreeState extends State<DailyTargetTabThree> {
  // Controller to keep track of the text in the TextFormField
  final TextEditingController _textController = TextEditingController();

  String _buttonText = "Set"; // Initial text for the button

  @override
  void initState() {
    super.initState();

    // Listen to changes in the TextFormField
    _textController.addListener(() {
      setState(() {
        // Update the button text with "Set" and the input from the TextFormField
        _buttonText = "Set ${_textController.text}";
      });
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TTexts.earningsDailyTargetTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _textController,
              style: Theme.of(context).textTheme.titleSmall,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: TColors.primary,
                  ),
                ),
                prefixText: TTexts.nairaSymbol,
                labelText: TTexts.earningsDailyTargetAmount,
                labelStyle: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            SaveButtonWidget(
              onTap: () {},
              buttonText: _buttonText,
            ),
          ],
        ),
      ),
    );
  }
}
