import 'package:bglory_rides/common/widgets/app_circular_progress_indicator.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, required this.child, this.isLoading = false});

  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Visibility(
          visible: isLoading,
          child: Container(
            color: Colors.grey.withOpacity(0.4),
            child: const Center(
              child: AppCircularProgressIndicator(),
            ),
          ),
        )
      ],
    );
  }
}
