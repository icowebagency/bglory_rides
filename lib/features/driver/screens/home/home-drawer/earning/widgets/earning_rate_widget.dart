import 'package:flutter/material.dart';

class EarningRateWidget extends StatelessWidget {
  const EarningRateWidget({
    super.key,
    required this.earningRateText,
    required this.earningColor,
    required this.percentageText,
  });
  final String earningRateText;
  final Color earningColor;
  final String percentageText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: earningColor,
              shape: BoxShape.circle,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Text(earningRateText),
              ),
              Text(
                percentageText,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
