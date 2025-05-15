import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TrackPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = TColors.secondary
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    // Draw a dashed horizontal track using the full width
    double dashWidth = 10, dashSpace = 5, startX = 0; // Start from 0
    final space = (dashWidth + dashSpace);
    while (startX < size.width - 10) {
      // Ensure the dashes fill the entire width
      canvas.drawLine(Offset(startX, size.height / 2),
          Offset(startX + dashWidth, size.height / 2), paint);
      startX += space;
    }

    // Draw the outer green dot at the end of the track
    final outerDotPaint = Paint()..color = TColors.secondary;
    canvas.drawCircle(
        Offset(size.width - 10, size.height / 2), 12, outerDotPaint);

    // Draw the inner white dot to create the border effect
    final innerDotPaint = Paint()..color = TColors.white;
    canvas.drawCircle(
        Offset(size.width - 10, size.height / 2), 7, innerDotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}