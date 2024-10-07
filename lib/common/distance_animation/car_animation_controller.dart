import 'package:flutter/material.dart';

class CarAnimationController {
  late AnimationController _controller;
  late Animation<double> _animation;

  CarAnimationController(TickerProvider vsync) {
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: vsync,
    )..repeat(); // Repeat the animation

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  Animation<double> get animation => _animation;

  void dispose() {
    _controller.dispose();
  }

  void setValue(double value) {
    _controller.value = value;
  }
}
