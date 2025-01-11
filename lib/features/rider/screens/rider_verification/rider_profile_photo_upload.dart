import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:bglory_rides/features/driver/general_widgets/outlined_button_widget.dart';
import 'package:bglory_rides/routing/rider_routing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class RiderProfilePhotoUploadScreen extends StatefulWidget {
  const RiderProfilePhotoUploadScreen({super.key});

  @override
  State<RiderProfilePhotoUploadScreen> createState() =>
      _RiderProfilePhotoUploadScreenState();
}

class _RiderProfilePhotoUploadScreenState
    extends State<RiderProfilePhotoUploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TTexts.riderProfilePictureUploadTitle,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 20,
                      ),
                ),
                Text(
                  TTexts.riderProfilePictureUploadSubTitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: TColors.primary,
                    ),
                    color: TColors.grey.withOpacity(0.5),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.fiber_manual_record_rounded,
                        color: TColors.dark,
                        size: 14,
                      ),
                      title: Text(
                        TTexts.riderProfilePictureUploadTermsOne,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: TColors.error,
                            ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.fiber_manual_record_rounded,
                        color: TColors.dark,
                        size: 14,
                      ),
                      title: Text(
                        TTexts.riderProfilePictureUploadTermsTwo,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: TColors.error,
                            ),
                      ),
                    ),
                    //Todo: Once the user Uploads a photo, this text should show up and the other texts above hides off.
                    Text(
                      textAlign: TextAlign.center,
                      TTexts.riderProfilePictureUploadTermsAndCondition,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: TColors.error,
                          ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircularIconContainer(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.15,
                        onTap: () {},
                        color: TColors.grey.withOpacity(0.5),
                        icon: const Icon(
                          Icons.refresh,
                          color: TColors.dark,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: const BoxDecoration(
                            color: TColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(
                              Iconsax.camera,
                              color: TColors.white,
                            ),
                          ),
                        ),
                      ),
                      CircularIconContainer(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.15,
                        onTap: () {},
                        color: TColors.grey.withOpacity(0.5),
                        icon: const Icon(
                          Iconsax.flash_slash,
                          color: TColors.dark,
                        ),
                      ),
                    ],
                  ),
                ),
                //Todo:  Once the user Uploads a photo, this button should show up and the other buttons hides off.
                SaveButtonWidget(
                  onTap: () {
                    context.push(BGRiderRouteNames.riderAddCard);
                  },
                  buttonText: TTexts.driverConfirm,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                OutlinedButtonWidget(
                  onTap: () {},
                  buttonText: TTexts.generalRetakeTitle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CircularIconContainer extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final Icon icon;
  final VoidCallback onTap;

  const CircularIconContainer({
    Key? key,
    required this.height,
    required this.width,
    required this.color,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
