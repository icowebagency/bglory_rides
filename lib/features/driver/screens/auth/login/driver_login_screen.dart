import 'package:bglory_rides/features/driver/screens/auth/login/driver_login_provider.dart';
import 'package:bglory_rides/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../common/widgets/app_circular_progress_indicator.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../widgets/login_emailFormTab.dart';
import '../widgets/login_phoneNumberTab.dart';

class DriverLoginScreen extends StatefulWidget {
  const DriverLoginScreen({super.key});

  @override
  State<DriverLoginScreen> createState() => _DriverLoginScreenState();
}

class _DriverLoginScreenState extends State<DriverLoginScreen> {
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
                    /// Logo
                    Center(
                      child: Image(
                        width: 150,
                        height: 100,
                        image: AssetImage(
                          dark ? TImages.darkAppLogo : TImages.lightAppLogo,
                        ),
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
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: dark ? TColors.white : TColors.dark,
                          ),
                    ),
                    // Signup Tab line
                    TabBar(
                      automaticIndicatorColorAdjustment: true,
                      unselectedLabelColor:
                          dark ? TColors.white.withOpacity(0.8) : TColors.dark,
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
                    Builder(builder: (context) {
                      return Consumer(builder: (context, ref, child) {
                        ref
                            .read(driverLoginStateNotifierProvider.notifier)
                            .setPageController(
                              controller: DefaultTabController.of(context),
                            );
                        return Expanded(
                          child: TabBarView(children: [
                            ///  Email Tab
                            LoginEmailFormTab(
                              driverAuthProvider:
                                  driverLoginStateNotifierProvider,
                              isLogin: true,
                            ),

                            ///  Phone Number Tab
                            LoginPhoneNumberFormTab(
                              driverAuthProvider:
                                  driverLoginStateNotifierProvider,
                              isLogin: true,
                            ),
                          ]),
                        );
                      });
                    }),
                  ],
                ),
              ),
              Consumer(builder: (context, ref, child) {
                return Visibility(
                  visible: ref.watch(
                    driverLoginStateNotifierProvider.select(
                      (value) => value.isLoading,
                    ),
                  ),
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
