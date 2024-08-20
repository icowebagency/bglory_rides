import 'package:bglory_rides/common/distance_animation/track_painter.dart';
import 'package:bglory_rides/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import 'car_widget.dart';

class CarAnimationScreen extends StatefulWidget {
  const CarAnimationScreen({super.key});

  @override
  _CarAnimationScreenState createState() => _CarAnimationScreenState();
}

class _CarAnimationScreenState extends State<CarAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(); // Repeat the animation

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double trackWidth = constraints.maxWidth; // Full available width
        double carWidth = 50; // Approximate width of the car widget
        double carHeight = 50; // Approximate height of the car widget
        double trackHeight = carHeight + 20; // Adjust height as needed

        return SizedBox(
          width: trackWidth,
          height: trackHeight, // Adjust height to fit the track and car
          child: Stack(
            children: [
              CustomPaint(
                size: Size(trackWidth, trackHeight), // Full width
                painter: TrackPainter(),
              ),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  // Calculate car position
                  double carPosition =
                      _animation.value * (trackWidth - carWidth);

                  // Center the car vertically within the track
                  double verticalCenter = (trackHeight - carHeight) / 2;

                  return Positioned(
                    left: carPosition, // Adjusted to reach the end of the track
                    top: verticalCenter, // Center the car on the dashed line
                    child: child!,
                  );
                },
                child: const CarWidget(
                  carImage: TImages
                      .driverCarAnimation, // Path to your custom car icon
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
