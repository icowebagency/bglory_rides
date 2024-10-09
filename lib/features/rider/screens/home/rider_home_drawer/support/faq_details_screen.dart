import 'package:bglory_rides/features/rider/screens/home/rider_home_drawer/support/faq_details_component.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/constants/text_strings.dart';

class RiderFaqDetailsScreen extends StatefulWidget {
  const RiderFaqDetailsScreen({super.key});

  @override
  State<RiderFaqDetailsScreen> createState() => _RiderFaqDetailsScreenState();
}

class _RiderFaqDetailsScreenState extends State<RiderFaqDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TTexts.riderFAQsDetailsTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: TColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  children: [
                    RiderFaqDetailsComponent(
                      faqTitle: TTexts.riderFaqsOneTitle,
                      faqDetail: TTexts.riderFaqsOneDetailsTitle,
                    ),
                    RiderFaqDetailsComponent(
                      faqTitle: TTexts.riderFaqsTwoTitle,
                      faqDetail: TTexts.riderFaqsTwoDetailsTitle,
                    ),
                    RiderFaqDetailsComponent(
                      faqTitle: TTexts.riderFaqsThreeTitle,
                      faqDetail: TTexts.riderFaqsThreeDetailsTitle,
                    ),
                    RiderFaqDetailsComponent(
                      faqTitle: TTexts.riderFaqsFourTitle,
                      faqDetail: TTexts.riderFaqsFourDetailsTitle,
                    ),
                    RiderFaqDetailsComponent(
                      faqTitle: TTexts.riderFaqsFiveTitle,
                      faqDetail: TTexts.riderFaqsFiveDetailsTitle,
                    ),
                    RiderFaqDetailsComponent(
                      faqTitle: TTexts.riderFaqsSixTitle,
                      faqDetail: TTexts.riderFaqsSixDetailsTitle,
                    ),
                    RiderFaqDetailsComponent(
                      faqTitle: TTexts.riderFaqsSevenTitle,
                      faqDetail: TTexts.riderFaqsSevenDetailsTitle,
                    ),
                    RiderFaqDetailsComponent(
                      faqTitle: TTexts.riderFaqsEightTitle,
                      faqDetail: TTexts.riderFaqsEightDetailsTitle,
                    ),
                    RiderFaqDetailsComponent(
                      faqTitle: TTexts.riderFaqsNineTitle,
                      faqDetail: TTexts.riderFaqsNineDetailsTitle,
                    ),
                    RiderFaqDetailsComponent(
                      faqTitle: TTexts.riderFaqsTenTitle,
                      faqDetail: TTexts.riderFaqsTenDetailsTitle,
                    ),
                    RiderFaqDetailsComponent(
                      faqTitle: TTexts.riderFaqsElevenTitle,
                      faqDetail: TTexts.riderFaqsElevenDetailsTitle,
                    ),
                    RiderFaqDetailsComponent(
                      faqTitle: TTexts.riderFaqsTwelveTitle,
                      faqDetail: TTexts.riderFaqsTwelveDetailsTitle,
                    ),
                    RiderFaqDetailsComponent(
                      faqTitle: TTexts.riderFaqsThirteenTitle,
                      faqDetail: TTexts.riderFaqsThirteenDetailsTitle,
                      showDivider: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
