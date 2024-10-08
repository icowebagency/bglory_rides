import 'package:bglory_rides/routing/rider_routing.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../driver/screens/home/home-drawer/trip_history/bottom_sheet_shares_widget.dart';

class RiderDownloadReceiptBottomSheet extends StatefulWidget {
  const RiderDownloadReceiptBottomSheet({super.key});

  @override
  State<RiderDownloadReceiptBottomSheet> createState() =>
      _RiderDownloadReceiptBottomSheetState();
}

class _RiderDownloadReceiptBottomSheetState
    extends State<RiderDownloadReceiptBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.downloadReceiptTitle,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text(
            TTexts.downloadReceiptSubTitle,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          BottomSheetSharesWidget(
            onTap: () {
              context.push(BGRiderRouteNames.riderInvoiceScreen);
            },
            myBottomSheetIcon: Iconsax.receive_square,
            myBottomSheetText: TTexts.downloadReceiptTitle,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          BottomSheetSharesWidget(
            onTap: () {
              _resendReceiptDialog(context);
            },
            myBottomSheetIcon: Iconsax.directbox_send,
            myBottomSheetText: TTexts.resendReceiptTitle,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          BottomSheetSharesWidget(
            onTap: () {
              _shareReceiptDialog(context);
            },
            myBottomSheetIcon: Iconsax.export,
            myBottomSheetText: TTexts.shareReceiptTitle,
          ),
        ],
      ),
    );
  }

  Future<void> _downloadReceiptDialog(BuildContext context) async {
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

  /// Resend receipt
  Future<void> _resendReceiptDialog(BuildContext context) async {
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

  /// Share receipt
  Future<void> _shareReceiptDialog(BuildContext context) async {
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
}
