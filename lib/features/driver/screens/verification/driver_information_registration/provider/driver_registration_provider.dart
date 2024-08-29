// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:bglory_rides/features/driver/data/provider/driver_data_providers.dart';
import 'package:bglory_rides/features/driver/data/repository/driver_repository.dart';
import 'package:bglory_rides/utils/secrets/api_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'driver_registration_provider.g.dart';

final driverRegistrationDetailsProvider = StateProvider<Map<String, String>>(
  (ref) => {},
);

final driverRegistrationFilesProvider = StateProvider<Map<String, String>>(
  (ref) => {},
);

final photoPickerProvider = Provider<ImagePicker>(
  (ref) => ImagePicker(),
);

@riverpod
class RegistrationNotifier extends _$RegistrationNotifier {
  @override
  bool build() => false;

  Future<bool> onRegister(
      {required Map<String, String> profileData,
      required Map<String, String> files,
      Function(String)? onError}) async {
    state = true;

    final result = await ref
        .read(driverRepositoryProvider)
        .completeDriverProfile(profileData: profileData, files: files);

    state = false;

    if (result is Failure) {
      onError?.call('Registration Failed');
      return false;
    } else {
      return true;
    }
  }
}
