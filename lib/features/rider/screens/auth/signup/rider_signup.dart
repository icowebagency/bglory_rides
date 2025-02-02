import 'package:bglory_rides/features/rider/screens/auth/auth_providers/auth_providers.dart';
import 'package:bglory_rides/features/rider/screens/auth/widgets/email_login_tab.dart';
import 'package:bglory_rides/features/rider/screens/auth/widgets/number_login_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../common/widgets/app_circular_progress_indicator.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class RiderSignup extends StatefulWidget {
  const RiderSignup({super.key});

  @override
  State<RiderSignup> createState() => _RiderSignupState();
}

class _RiderSignupState extends State<RiderSignup> {
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image(
                        width: 150,
                        height: 100,
                        image: AssetImage(
                            dark ? TImages.darkAppLogo : TImages.lightAppLogo),
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    Text(
                      TTexts.riderSignupTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      TTexts.signupDriverSubTitle,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: dark ? TColors.white : TColors.dark),
                    ),
                    // Signup Tab line
                    TabBar(
                      automaticIndicatorColorAdjustment: true,
                      unselectedLabelColor: dark
                          ? TColors.white.withOpacity(0.7)
                          : TColors.darkGrey,
                      labelColor: dark ? TColors.white : TColors.primary,
                      isScrollable: false,
                      indicatorColor: TColors.primary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      tabs: const [
                        Tab(
                          text: 'Email',
                        ),
                        Tab(
                          text: 'Phone Number',
                        ),
                      ],
                    ),
                    Expanded(
                      child: Consumer(builder: (context, ref, child) {
                        return Builder(builder: (context) {
                          ref
                              .read(riderSignUpNotifierProvider.notifier)
                              .setPageController(
                                controller: DefaultTabController.of(context),
                              );
                          return TabBarView(children: [
                            ///  Email Tab
                            LoginEmailFormTab(
                              isLogin: false,
                              riderAuthNotifier: riderSignUpNotifierProvider,
                            ),

                            ///  Phone Number Tab
                            LoginPhoneNumberFormTab(
                              riderAuthNotifier: riderSignUpNotifierProvider,
                              isLogin: false,
                            ),
                          ]);
                        });
                      }),
                    ),
                  ],
                ),
              ),
              Consumer(builder: (context, ref, child) {
                return Visibility(
                  visible: ref.watch(riderSignUpNotifierProvider.select((value) => value.isLoading)),
                  child: Container(
                    color: Colors.grey.withOpacity(0.4),
                    child: const Center(
                      child: AppCircularProgressIndicator(),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
