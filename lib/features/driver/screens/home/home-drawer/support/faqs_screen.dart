import 'package:bglory_rides/features/driver/screens/home/home-drawer/support/widgets/faq_title_component.dart';
import 'package:bglory_rides/routing/driver_routing.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({super.key});

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  final TextEditingController _controller = TextEditingController();
  List<String> _suggestions = [];

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

  void _updateSuggestions(String input) {
    setState(() {
      _suggestions = faqs
          .where((faq) =>
              faq['question']!.toLowerCase().contains(input.toLowerCase()))
          .map((faq) => faq['question']!)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: TColors.white,
        ),
        backgroundColor: TColors.appBarBackgroundColor,
        centerTitle: true,
        automaticallyImplyLeading: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
            child: TextFormField(
              controller: _controller,
              autocorrect: true,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: TColors.white,
                  ),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    _controller.clear(); // Clear the search text
                    _suggestions.clear(); // Clear the search suggestions
                    setState(() {}); // Refresh the UI to reflect the changes
                  },
                  icon: Icon(
                    Icons.cancel_outlined,
                    color: TColors.white.withOpacity(0.6),
                  ),
                ),
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
              onChanged: (value) {
                _updateSuggestions(value);
              },
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _suggestions.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _suggestions.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_suggestions[index]),
                          onTap: () {
                            _controller.text = _suggestions[index];
                            _suggestions.clear();
                            setState(() {});
                            // Handle the suggestion tap here
                          },
                        );
                      },
                    ),
                  )
                : const SizedBox.shrink(),

            /// Body section
            Text(
              textAlign: TextAlign.center,
              TTexts.faqHeader,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: TColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  FaqSubHeadings(
                    faqTitle: TTexts.faqGettingStarted,
                    faqOnTap: () {
                      context.push(BGRouteNames.driverFaqGettingStartedScreen);
                    },
                  ),
                  FaqSubHeadings(
                    faqTitle: TTexts.faqUsingTheApp,
                    faqOnTap: () {
                      context.push(BGRouteNames.driverFaqUsingTheAppScreen);
                    },
                  ),
                  FaqSubHeadings(
                    faqTitle: TTexts.faqPaymentAndEarnings,
                    faqOnTap: () {
                      context.push(
                          BGRouteNames.driverFaqPaymentsAndEarningsScreen);
                    },
                  ),
                  FaqSubHeadings(
                    faqTitle: TTexts.faqDriverSupport,
                    faqOnTap: () {
                      context.push(BGRouteNames.driverFaqDriverSupportScreen);
                    },
                  ),
                  FaqSubHeadings(
                    faqTitle: TTexts.faqAccountAndSettings,
                    faqOnTap: () {
                      context.push(
                          BGRouteNames.driverFaqDAccountAndSettingsScreen);
                    },
                  ),
                  FaqSubHeadings(
                    faqTitle: TTexts.faqGeneralQuestions,
                    faqOnTap: () {
                      context
                          .push(BGRouteNames.driverFaqGeneralQuestionsScreen);
                    },
                    showDivider: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
