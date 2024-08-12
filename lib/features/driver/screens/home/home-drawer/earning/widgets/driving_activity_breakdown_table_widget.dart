import 'package:flutter/material.dart';

class DrivingActivityTableWidget extends StatelessWidget {
  const DrivingActivityTableWidget({
    super.key,
    required this.title,
    required this.percentage,
  });

  final String title;
  final String percentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          percentage,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
