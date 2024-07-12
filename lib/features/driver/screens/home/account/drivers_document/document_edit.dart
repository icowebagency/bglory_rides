import 'package:bglory_rides/common/widgets/driver_info_upload_widget.dart';
import 'package:bglory_rides/routing/driver_routing.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DocumentEditScreen extends StatefulWidget {
  const DocumentEditScreen({super.key});

  @override
  State<DocumentEditScreen> createState() => _DocumentEditScreenState();
}

class _DocumentEditScreenState extends State<DocumentEditScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(TTexts.driverProfileEditTitle),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(TTexts.driverSubDocumentText),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                const Text(TTexts.driverlicenseTitleTwo),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Container(
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: TColors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TTexts.driverlicenseNumber,
                          style: Theme.of(context).textTheme.titleLarge!.apply(
                                color: TColors.grey,
                              ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          maxLines: 1,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
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
                            hintText: TTexts.documentLicenseFormNumber,
                            hintStyle: Theme.of(context).textTheme.bodySmall,
                            filled: true,
                          ),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        Text(
                          TTexts.documentExpiryDateTitle,
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: TColors.grey,
                              ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
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
                                  hintText: TTexts.documentExpiryDateEditDay,
                                  hintMaxLines: 1,
                                  hintStyle:
                                      Theme.of(context).textTheme.bodySmall,
                                  filled: true,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: TTexts.documentExpiryDateEditMonth,
                                  hintMaxLines: 1,
                                  hintStyle:
                                      Theme.of(context).textTheme.bodySmall,
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
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: TTexts.documentExpiryDateEditYear,
                                  hintMaxLines: 1,
                                  hintStyle:
                                      Theme.of(context).textTheme.bodySmall,
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
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        Text(
                          TTexts.documentLicensePhotoDemoTitle,
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: TColors.grey,
                              ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.photo_library_outlined),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              TTexts.documentLicensePhotoDemoText,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        DriverInfoUploadWidget(
                          onTapNav: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: width,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go(BGRouteNames.driverAccountScreen);
                    },
                    child: const Text(TTexts.driverUpdateButton),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
