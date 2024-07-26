import 'package:bglory_rides/features/driver/general-widgets/save_button_widget.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/image_strings.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'bottom_sheet_shares_widget.dart';

class DownloadReceiptScreen extends StatefulWidget {
  const DownloadReceiptScreen({super.key});

  @override
  State<DownloadReceiptScreen> createState() => _DownloadReceiptScreenState();
}

class _DownloadReceiptScreenState extends State<DownloadReceiptScreen> {
  Future<void> _showPopupDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button to close
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: TColors.dragableBottomSheetColor,
          content: SizedBox(
            height: 100,
            width: double.infinity,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    TTexts.receiptSentTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    TTexts.receiptSentSubTitle,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text(TTexts.invoiceReceiptInvoiceTitle),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // logo and date
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Image(
                          fit: BoxFit.cover,
                          width: 100,
                          height: 40,
                          image: AssetImage(
                            TImages.lightAppLogo,
                          ),
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          TTexts.invoiceReceiptDate,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    // invoice title and invoice number
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          TTexts.invoiceReceiptInvoiceTitle,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: TColors.primary),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          TTexts.invoiceReceiptNumber,
                          style: Theme.of(context).textTheme.bodyMedium!,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                // Driver's name
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Driver's name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TTexts.invoiceReceiptNameTitle,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const Text(
                          TTexts.invoiceReceiptName,
                        ),
                      ],
                    ),
                    // Driver's number
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TTexts.invoiceReceiptNumberTitle,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const Text(
                          TTexts.invoiceReceiptPassengerPhoneNumber,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                Text(
                  TTexts.invoiceReceiptPassengerDetailsTitle,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: TColors.secondary),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Driver's name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TTexts.invoiceReceiptPassengerNameTitle,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const Text(
                          TTexts.invoiceReceiptPassengerName,
                        ),
                      ],
                    ),
                    // Driver's number
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TTexts.invoiceReceiptPassengerPhoneTitle,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const Text(
                          TTexts.invoiceReceiptPassengerPhoneNumber,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Driver's name
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TTexts.invoiceReceiptPickUpTitle,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                TTexts.invoiceReceiptPickUpDetails,
                              ),
                              Text(
                                TTexts.invoiceReceiptPickUpTime,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      // Driver's number
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TTexts.invoiceReceiptDestinationTitle,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                TTexts.invoiceReceiptDestinationDetails,
                              ),
                              Text(
                                TTexts.invoiceReceiptDestinationTime,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      TTexts.invoiceReceiptPaymentTitle,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Ride fare
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              TTexts.invoiceReceiptRideFareTitle,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              TTexts.invoiceReceiptRideFareAmount,
                              style: TextStyle(fontFamily: 'Notosans'),
                            ),
                          ],
                        ),
                        // Booking fee
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              TTexts.invoiceReceiptBookingFeeTitle,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              TTexts.invoiceReceiptBookingFeeAmount,
                              style: TextStyle(fontFamily: 'Notosans'),
                            ),
                          ],
                        ),
                        // Discount
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              TTexts.invoiceReceiptDiscountTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: TColors.error,
                                  ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              TTexts.invoiceReceiptDiscountAmount,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: TColors.error,
                                    fontFamily: 'Notosans',
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(TTexts.invoiceReceiptTotalTitle,
                            style: Theme.of(context).textTheme.titleLarge),
                        Text(
                          TTexts.invoiceReceiptTotalSubText,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 10,
                                  ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          TTexts.invoiceReceiptTotalAmount,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontFamily: 'Notosans',
                                  ),
                        ),
                        Text(
                          TTexts.invoiceReceiptTotalSubAmount,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 10,
                                    fontFamily: 'Notosans',
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                SaveButtonWidget(
                  onTap: () {
                    showModalBottomSheet(
                      constraints: BoxConstraints.tight(
                        Size.fromHeight(height * 0.3),
                      ),
                      elevation: 10,
                      showDragHandle: true,
                      isScrollControlled: false,
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                TTexts.downloadReceiptTitle,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              const SizedBox(height: TSizes.spaceBtwItems),
                              BottomSheetSharesWidget(
                                myBottomSheetIcon: Iconsax.receive_square,
                                onTap: () {
                                  _showPopupDialog(context);
                                },
                                myBottomSheetText: TTexts.downloadReceiptTitle,
                              ),
                              const SizedBox(height: TSizes.spaceBtwItems),
                              BottomSheetSharesWidget(
                                  myBottomSheetIcon: Iconsax.directbox_send,
                                  myBottomSheetText: TTexts.resendReceiptTitle,
                                  onTap: () {}),
                              const SizedBox(height: TSizes.spaceBtwItems),
                              BottomSheetSharesWidget(
                                  myBottomSheetIcon: Iconsax.export,
                                  myBottomSheetText: TTexts.shareReceiptTitle,
                                  onTap: () {}),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  buttonText: TTexts.invoiceReceiptTotalButtonText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
