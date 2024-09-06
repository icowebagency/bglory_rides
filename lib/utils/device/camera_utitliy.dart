import 'dart:io';

import 'package:bglory_rides/features/driver/screens/verification/driver_information_registration/provider/driver_registration_provider.dart';
import 'package:image_picker/image_picker.dart';

class CameraUtitliy {
 static Future<File?> takeImageFromCamera(dynamic ref) async {
    final picker = ref.read(photoPickerProvider);
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      return File(photo.path);
    }
    return null;
  }
}