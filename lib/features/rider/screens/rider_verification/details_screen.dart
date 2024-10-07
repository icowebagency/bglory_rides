import 'package:bglory_rides/common/widgets/save_button_widget.dart';
import 'package:bglory_rides/routing/rider_routing.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';

class RiderDetailsScreen extends StatefulWidget {
  const RiderDetailsScreen({super.key});

  @override
  State<RiderDetailsScreen> createState() => _RiderDetailsScreenState();
}

class _RiderDetailsScreenState extends State<RiderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TTexts.riderDetailsScreenTitle,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 20),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TTexts.firstName,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        TextFormField(
                          maxLines: 1,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText:
                                TTexts.riderDetailsScreenYourFirstNameHintTitle,
                            hintStyle: Theme.of(context).textTheme.bodySmall,
                            fillColor: TColors.containerBackgroundColor,
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.grey,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.primary,
                              ),
                            ),
                            filled: true,
                          ),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        Text(
                          TTexts.lastName,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        TextFormField(
                          maxLines: 1,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText:
                                TTexts.riderDetailsScreenYourLastNameHintTitle,
                            hintStyle: Theme.of(context).textTheme.bodySmall,
                            fillColor: TColors.containerBackgroundColor,
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.grey,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.primary,
                              ),
                            ),
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SaveButtonWidget(
                    onTap: () {
                      context.push(
                          BGRiderRouteNames.riderProfilePhotoUploadScreen);
                    },
                    buttonText: TTexts.driverProceedButton,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
