import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final driverRegistrationDetailsProvider =
    StateProvider<Map<String, String>>(
  (ref) => {},
);

final driverRegistrationFilesProvider =
    StateProvider<Map<String, String>>(
  (ref) => {},
);

final photoPickerProvider = Provider<ImagePicker>(
  (ref) => ImagePicker(),
);
