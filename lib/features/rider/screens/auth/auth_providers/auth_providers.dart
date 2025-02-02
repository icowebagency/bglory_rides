import 'package:bglory_rides/features/rider/data/provider/rider_data_providers.dart';
import 'package:bglory_rides/features/rider/screens/auth/auth_providers/rider_auth_notifier.dart';
import 'package:bglory_rides/features/rider/screens/auth/auth_providers/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final riderLoginNotifierProvider =
  StateNotifierProvider.autoDispose<RiderAuthNotifier, AuthState>(
        (ref) => RiderSignInState(
          authRepo: ref.watch(riderAuthRepoProvider), ref: ref
        ),
  );

final riderSignUpNotifierProvider =
StateNotifierProvider.autoDispose<RiderAuthNotifier, AuthState>(
      (ref) => RiderSignUpState(
      authRepo: ref.watch(riderAuthRepoProvider), ref: ref
  ),
);