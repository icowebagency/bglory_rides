import 'package:flutter/material.dart';

import '../../../../../../../utils/constants/text_strings.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({
    super.key,
    required this.withdrewedAmount,
    required this.withdrawalDate,
    required this.withdrawalProgress,
    required this.withdrawalIconType,
    required this.withdrawalIconProgress,
    required this.withdrawIconTypeColor,
    required this.withdrawalProgressColor,
    required this.withdrawalIconProgressColor,
  });

  final String withdrewedAmount;
  final String withdrawalDate;
  final String withdrawalProgress;
  final Color withdrawalProgressColor;
  final IconData withdrawalIconType;
  final Color withdrawIconTypeColor;
  final IconData withdrawalIconProgress;
  final Color withdrawalIconProgressColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// main row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  withdrawalIconType,
                  color: withdrawIconTypeColor,
                  size: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        TTexts.transactionHistoryEarningWithdrawalTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      withdrawalDate,
                    )
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FittedBox(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    withdrewedAmount,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                FittedBox(
                  child: Row(
                    children: [
                      Icon(
                        withdrawalIconProgress,
                        color: withdrawalIconProgressColor,
                        size: 12,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        withdrawalProgress,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: withdrawalProgressColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Divider(),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
