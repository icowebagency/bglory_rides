import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DriverSupportScreen extends StatefulWidget {
  const DriverSupportScreen({super.key});

  @override
  State<DriverSupportScreen> createState() => _DriverSupportScreenState();
}

class _DriverSupportScreenState extends State<DriverSupportScreen> {
  final TextEditingController _controller = TextEditingController();
  List<String> _suggestions = [];

  final List<Map<String, String>> faqs = [
    {
      'question': 'How do I sign-up as a driver?',
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

  Widget _buildBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.circle, size: 5, color: TColors.darkGrey),
        // Bullet point
        const SizedBox(width: 5),
        // Spacing between bullet point and text
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
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
                    _controller.clear(); // Clears the search text
                    _suggestions.clear(); // Clears the search suggestions
                    setState(() {});
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
              TTexts.faqPaymentAndEarningsHeader,
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Text(
                        TTexts.faqPaymentAndEarningsNumber,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      title: Text(
                        TTexts.faqPaymentAndEarningsTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),
                          _buildBulletPoint(TTexts.faqPaymentAndEarningsThree),
                          _buildBulletPoint(TTexts.faqPaymentAndEarningsTwo),
                          _buildBulletPoint(TTexts.faqPaymentAndEarningsOne),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    ListTile(
                      leading: Text(
                        TTexts.faqPaymentAndEarningsTwoNumber,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      title: Text(
                        TTexts.faqDriverSupportTwoHeader,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),
                          _buildBulletPoint(TTexts.faqDriverSupportTwoOne),
                          _buildBulletPoint(TTexts.faqDriverSupportTwoTwo),
                          _buildBulletPoint(TTexts.faqDriverSupportTwoThree),
                          _buildBulletPoint(TTexts.faqDriverSupportTwoFour),
                        ],
                      ),
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
