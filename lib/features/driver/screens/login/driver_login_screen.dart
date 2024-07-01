import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../signup/widgets/login_emailFormTab.dart';
import '../signup/widgets/login_phoneNumberTab.dart';

class DriverLoginScreen extends StatefulWidget {
  const DriverLoginScreen({super.key});

  @override
  State<DriverLoginScreen> createState() => _DriverLoginScreenState();
}

class _DriverLoginScreenState extends State<DriverLoginScreen> {
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
                  TTexts.loginDriverTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  TTexts.loginDriverSubTitle,
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
                    LoginEmailFormTab(),

                    ///  Phone Number Tab
                    LoginPhoneNumberFormTab(),
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
