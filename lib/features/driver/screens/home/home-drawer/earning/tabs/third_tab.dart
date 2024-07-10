import 'package:flutter/material.dart';

import '../../../../../../../utils/constants/colors.dart';

class ThirdTab extends StatelessWidget {
  const ThirdTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: TColors.primary,
      child: const Center(
        child: Text('Third Tab'),
      ),
    );
  }
}
