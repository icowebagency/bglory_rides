import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/text_strings.dart';

class AutoAcceptScreen extends StatefulWidget {
  const AutoAcceptScreen({super.key});

  @override
  State<AutoAcceptScreen> createState() => _AutoAcceptScreenState();
}

class _AutoAcceptScreenState extends State<AutoAcceptScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: TColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                onTap: () {},
                title: const Text(TTexts.appSettingsAutoAcceptTitle),
                trailing: Switch(
                  inactiveThumbColor: TColors.white,
                  inactiveTrackColor: TColors.grey,
                  trackOutlineColor:
                      const WidgetStatePropertyAll(TColors.white),
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeTrackColor: TColors.primary,
                  activeColor: TColors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              TTexts.appSettingsSubTitle,
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
