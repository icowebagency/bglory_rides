import 'package:bglory_rides/features/rider/data/api/rider_api_client.dart';
import 'package:bglory_rides/features/rider/data/repository/rider_auth_repository.dart';
import 'package:bglory_rides/features/rider/data/repository/rider_profile_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final riderApiClientProvider = Provider(
      (ref) => RiderApiClientImpl(),
);

final riderAuthRepoProvider = Provider(
    (ref) => RiderAuthRepositoryImpl(apiContract: ref.read(riderApiClientProvider))
);

final riderProfileProvider = Provider(
    (ref) => RiderProfileRepository(clientContract: ref.read(riderApiClientProvider))
);