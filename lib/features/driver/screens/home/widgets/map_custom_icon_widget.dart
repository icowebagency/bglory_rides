import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class MapCustomIcons extends StatelessWidget {
  const MapCustomIcons({
    super.key,
    this.scaffoldKey,
    required this.myMargin,
    this.onTap,
    required this.containerIcon,
  });

  final GlobalKey<ScaffoldState>? scaffoldKey;
  final EdgeInsetsGeometry myMargin;
  final VoidCallback? onTap;
  final IconData containerIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: myMargin,
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: TColors.white,
        boxShadow: [
          BoxShadow(
            color: TColors.black.withOpacity(0.1), // Soft shadow color
            blurRadius: 10, // Softness of the shadow
            offset: const Offset(0, 5), // Position of the shadow
          ),
        ],
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(
          containerIcon,
          color: TColors.buttonPrimaryDeepGreen,
        ),
      ),
    );
  }
}
