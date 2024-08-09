import 'package:flutter/material.dart';

class CarWidget extends StatelessWidget {
  final String carImage;

  CarWidget({required this.carImage});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      carImage,
      width: 50,
      height: 50,
      fit: BoxFit.contain,
    );
  }
}
