import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({super.key});

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  final List<Map<String, String>> faqs = [
    {
      'question': 'Getting started',
      'answer':
          'Flutter is an open-source UI software development kit created by Google.',
    },
    {
      'question': 'Using the app',
      'answer':
          'You can install Flutter by following the instructions on the official Flutter website.',
    },
    {
      'question': 'Driver support',
      'answer': 'Yes, Flutter can be used to develop web applications as well.',
    },
    {
      'question': 'Account and settings',
      'answer': 'Yes, Flutter can be used to develop web applications as well.',
    },
    {
      'question': 'General questions',
      'answer': 'Yes, Flutter can be used to develop web applications as well.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.appBarBackgroundColor,
        centerTitle: true,
        automaticallyImplyLeading: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
            child: TextFormField(
              autocorrect: true,
              decoration: InputDecoration(
                hintText: TTexts.appBarSearchFormHintText,
                hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: TColors.white.withOpacity(0.5),
                    ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: TColors.appBarSearchBarBackgroundColor,
                  ),
                ),
                filled: true,
                fillColor: TColors.appBarSearchBarBackgroundColor,
                prefixIcon: const Icon(
                  Iconsax.search_normal,
                  color: TColors.white,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          TTexts.faqsAppBarTitle,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: TColors.white,
              ),
        ),
      ),
    );
  }
}
