import 'package:bglory_rides/common/google_maps/google_maps_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const gapiKey = "AIzaSyD6ysBfnoOV7B28zqb5Ukr7Q-GnmBx2ud4";

final googleServiceProvider = Provider((ref) {
  return GoogleMapsService(dio: Dio(), apiKey: gapiKey);
});