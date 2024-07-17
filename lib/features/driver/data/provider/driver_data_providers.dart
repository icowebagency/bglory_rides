import 'package:bglory_rides/features/driver/data/api/driver_api_client.dart';
import 'package:bglory_rides/features/driver/data/repository/driver_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final driverApiClientProvider = Provider(
  (ref) => DriverApiClientImp(),
);

final driverRepositoryProvider = Provider(
  (ref) {
    final repo = DriverRepositoryImp(
      apiClientContract: ref.read(driverApiClientProvider),
    );
    final token = ref.watch(userTokenProvider);
    repo.token = token;
    return repo;
  },
);

final userTokenProvider = StateProvider<String?>(
  (ref) => null,
);

final isTestProvider = StateProvider<bool>(
  (ref) => true,
);
