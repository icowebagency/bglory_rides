import 'package:bglory_rides/features/driver/general-widgets/save_button_general_widget.dart';
import 'package:bglory_rides/routing/driver_routing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';

class PaymentDetailsEditScreen extends StatefulWidget {
  const PaymentDetailsEditScreen({super.key});

  @override
  State<PaymentDetailsEditScreen> createState() =>
      _PaymentDetailsEditScreenState();
}

class _PaymentDetailsEditScreenState extends State<PaymentDetailsEditScreen> {
  _PaymentDetailsEditScreenState() {
    _banksSelectedValue = _nigerianBanks[0];
  }
  final List<String> _nigerianBanks = [
    'Access Bank',
    'Zenith Bank',
    'First Bank of Nigeria',
    'United Bank for Africa (UBA)',
    'Guaranty Trust Bank (GTBank)',
    'Stanbic IBTC Bank',
    'Union Bank of Nigeria',
    'Fidelity Bank',
    'Ecobank Nigeria',
    'Sterling Bank',
    'Wema Bank',
    'Polaris Bank',
    'FCMB (First City Monument Bank)',
    'Heritage Bank',
    'Unity Bank',
    'Keystone Bank',
    'Jaiz Bank',
    'SunTrust Bank Nigeria',
    'Providus Bank',
    'Titan Trust Bank',
    'Globus Bank'
  ];

  String? _banksSelectedValue = "";
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        //  vehicle payment app bar title
        title: const Text(TTexts.paymentDetailsAppBarTitle),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // vehicle payment sub title
                const Text(TTexts.paymentDetailsSubTitle),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                const Text(
                  TTexts.paymentDetailsTitle,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                // Driver payment details section edit
                Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: TColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Driver bank name edit
                        Text(
                          TTexts.paymentDetailsBankNameTitle,
                          style: Theme.of(context).textTheme.titleLarge!.apply(
                                color: TColors.grey,
                              ),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwInputFields,
                        ),
                        // Bank dropdown
                        DropdownButtonFormField(
                          isExpanded: true,
                          elevation: 0,
                          dropdownColor: TColors.containerBackgroundColor,
                          focusColor: TColors.primary,
                          decoration: const InputDecoration(
                            hintText: 'Select bank',
                            prefixIcon: Icon(
                              Iconsax.bank,
                              color: TColors.primary,
                            ),
                            filled: true,
                            fillColor: TColors.containerBackgroundColor,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.primary,
                              ),
                            ),
                          ),
                          icon: const Icon(
                            Iconsax.arrow_down_14,
                            color: TColors.primary,
                          ),
                          value: _banksSelectedValue,
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                                overflow: TextOverflow.ellipsis,
                              ),
                          items: _nigerianBanks
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                          onChanged: (val) {
                            setState(() {
                              _banksSelectedValue = val as String;
                            });
                          },
                        ),

                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        // Driver bank holder name edit
                        Text(
                          TTexts.paymentDetailsBankAccountTitle,
                          style: Theme.of(context).textTheme.titleLarge!.apply(
                                color: TColors.grey,
                              ),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwInputFields,
                        ),
                        TextFormField(
                          maxLines: 1,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText: TTexts.paymentDetailsBankAccountText,
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
                        // Driver bank account number edit
                        Text(
                          TTexts.paymentDetailsBankAccountNumberTitle,
                          style: Theme.of(context).textTheme.titleLarge!.apply(
                                color: TColors.grey,
                              ),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwInputFields,
                        ),
                        TextFormField(
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText:
                                TTexts.paymentDetailsBankAccountNumberText,
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
                        const Divider(
                          color: TColors.grey,
                          thickness: 1,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),
                        SaveGeneralButtonWidget(
                          onTap: () {
                            context.go(BGRouteNames.driverAccountScreen);
                          },
                        ),
                      ],
                    ),
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
