import 'dart:io';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';
import 'package:bglory_rides/utils/device/camera_utitliy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TakePhotoButtons extends ConsumerWidget {
  const TakePhotoButtons(
      {super.key, required this.photo, required this.onUpdatePhoto});

  final ValueChanged<File> onUpdatePhoto;

  final File? photo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: [
      Builder(
        builder: (context) {
          if (photo == null) {
            return SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  CameraUtitliy.takeImageFromCamera(ref).then(
                    (value) {
                      if (value != null) {
                        onUpdatePhoto(value);
                      }
                      return;
                    },
                  );
                },
                child: const Text(TTexts.driverTakePhotoButton),
              ),
            );
          } else {
            return SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(photo);
                },
                child: const Text(TTexts.driverConfirm),
              ),
            );
          }
        },
      ),
      const SizedBox(
        height: TSizes.spaceBtwSections / 2,
      ),
      if (photo != null)
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              CameraUtitliy.takeImageFromCamera(ref).then(
                (value) {
                  if (value != null) {
                    onUpdatePhoto(value);
                  }
                  return;
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: TColors.white,
            ),
            child: const Text(
              TTexts.driverTakeAgain,
              style: TextStyle(
                color: TColors.primary,
              ),
            ),
          ),
        ),
      const SizedBox(
        height: TSizes.spaceBtwSections,
      ),
    ]);
  }
}
