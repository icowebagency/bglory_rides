import 'package:bglory_rides/features/driver/data/provider/driver_data_providers.dart';
import 'package:bglory_rides/features/driver/data/repository/driver_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../utils/secrets/api_constants.dart';

final driverRegistrationDetailsProvider = StateProvider<Map<String, String>>(
  (ref) => {},
);

final driverRegistrationFilesProvider = StateProvider<Map<String, String>>(
  (ref) => {},
);

final photoPickerProvider = Provider<ImagePicker>(
  (ref) => ImagePicker(),
);

final driverRegistrationProvider =
    StateNotifierProvider<RegistrionStateNotifier, bool>(
  (ref) => RegistrionStateNotifier(
    driverRepositoryContract: ref.watch(driverRepositoryProvider),
    ref: ref,
  ),
);

class RegistrionStateNotifier extends StateNotifier<bool> {
  final DriverRepositoryContract driverRepositoryContract;

  bool Function()? validate;
  final Ref ref;

  RegistrionStateNotifier(
      {required this.driverRepositoryContract, required this.ref})
      : super(false);

  Future<bool> onRegister(
      {required Map<String, String> profileData,
      required Map<String, String> files,
      Function(String)? onError}) async {
    state = true;

    final result = await driverRepositoryContract.completeDriverProfile(
        profileData: profileData, files: files);
    state = false;

    if (result is Failure) {
      onError?.call('Registration Failed');
      return false;
    } else {
      return true;
    }
  }
}
