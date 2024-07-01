import 'package:bglory_rides/features/driver/screens/signup/widgets/signup_email_form_tab.dart';
import 'package:bglory_rides/features/driver/screens/signup/widgets/signup_phoneNumber_form.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class DriverSignup extends StatefulWidget {
  const DriverSignup({super.key});

  @override
  State<DriverSignup> createState() => _DriverSignupState();
}

class _DriverSignupState extends State<DriverSignup> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Image(
                    width: 150,
                    height: 100,
                    image: AssetImage(TImages.driverLogo),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                Text(
                  TTexts.signupDriverTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  TTexts.signupDriverSubTitle,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: TColors.darkGrey,
                      ),
                ),
                // Signup Tab line
                const TabBar(
                  automaticIndicatorColorAdjustment: true,
                  unselectedLabelColor: TColors.darkGrey,
                  labelColor: TColors.primary,
                  isScrollable: false,
                  indicatorColor: TColors.primary,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  tabs: [
                    Tab(
                      text: 'Email',
                    ),
                    Tab(
                      text: 'Phone Number',
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(children: [
                    ///  Email Tab
                    EmailFormTab(),

                    ///  Phone Number Tab
                    PhoneNumberFormTab(),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
