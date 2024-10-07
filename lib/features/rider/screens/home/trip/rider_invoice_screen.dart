import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/image_strings.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class RiderInvoiceScreen extends StatefulWidget {
  const RiderInvoiceScreen({super.key});

  @override
  State<RiderInvoiceScreen> createState() => _RiderInvoiceScreenState();
}

class _RiderInvoiceScreenState extends State<RiderInvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    double width = size.width;
    double height = size.height;
    return Scaffold(
      backgroundColor: TColors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: TColors.white,
        ),
        backgroundColor: TColors.primary,
        centerTitle: false,
        title: Text(
          TTexts.riderInvoiceTitle,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: TColors.white,
              ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.receive_square,
              color: TColors.white,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.directbox_send,
              color: TColors.white,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.export,
              color: TColors.white,
              size: 20,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 50,
                    width: 100,
                    child: Image(
                      image: AssetImage(
                        TImages.lightAppLogo,
                      ),
                    ),
                  ),
                  Text(
                    TTexts.riderInvoiceNameTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),

              /// DAte and invoice
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    TTexts.riderInvoiceDateTitle,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Row(
                    children: [
                      Text(
                        TTexts.riderInvoiceNameTitle,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        TTexts.riderInvoiceNumber,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Passenger's name
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TTexts.riderInvoicePassengerNameTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        TTexts.riderInvoiceDriverRealNameTitle,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TTexts.riderInvoiceDriverTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        TTexts.riderInvoicePassengerRealPhoneTitle,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Driver's name
              Text(
                TTexts.riderInvoiceDriverDetailsTitle,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: TColors.secondary,
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TTexts.riderInvoiceDriverNameTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        TTexts.riderInvoiceDriverRealNameTitle,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TTexts.riderInvoicePassengerPhoneTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        TTexts.riderInvoicePassengerRealPhoneTitle,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Pick up and destination row
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TTexts.riderInvoiceDriverPickupTitle,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: TColors.secondary,
                                  ),
                        ),
                        Text(
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          TTexts.riderInvoiceDriverPickupContentTitle,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          TTexts.riderInvoiceDriverPickupTimeTitle,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: TSizes.spaceBtwItems,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TTexts.riderInvoiceDriverDestinationTitle,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: TColors.secondary,
                                  ),
                        ),
                        Text(
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          TTexts.riderInvoiceDriverDestinationContentTitle,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          TTexts.riderInvoiceDriverDestinationTimeTitle,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Payment details
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    TTexts.riderInvoicePaymentTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TTexts.riderInvoiceRideFareTitle,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            TTexts.riderInvoiceBookingFeeTitle,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            TTexts.riderInvoiceDiscountTitle,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: TColors.error.withOpacity(0.5),
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TTexts.riderInvoiceRideFareAmountTitle,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontFamily: 'Notosans',
                                ),
                          ),
                          Text(
                            TTexts.riderInvoiceBookingFeeAmountTitle,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontFamily: 'Notosans',
                                ),
                          ),
                          Text(
                            TTexts.riderInvoiceDiscountAmountTitle,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: TColors.error.withOpacity(0.5),
                                  fontFamily: 'Notosans',
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    TTexts.riderInvoiceTotalTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    TTexts.riderInvoiceTotalAmountTitle,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontFamily: 'Notosans'),
                  ),
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    TTexts.riderInvoiceCardTypeTitle,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    TTexts.riderInvoiceCardTypeAmountTitle,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
