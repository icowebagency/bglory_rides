import 'package:dio/dio.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:bglory_rides/common/google_maps/model/place.dart';
import 'package:bglory_rides/common/google_maps/model/prediction.dart';
import '../../utils/secret/api_constants.dart';

class GoogleMapsService {
  final Dio dio;
  final String apiKey;

  GoogleMapsService({required this.dio, required this.apiKey});

  // Search places based on input
  Future<ApiResponse> searchPlace(String input) async {
    if (input.isEmpty) return Failure(message: 'Empty Input');

    final url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&fields=place_id,description,geometry&key=$apiKey';

    try {
      final response = await dio.get(url.toString());

      if (response.statusCode == 200) {
        final data = response.data;
        print(data);
        final rawListOfPredictions = data['predictions'] as List;

        return Success(
          data: rawListOfPredictions
              .map((json) => Prediction.fromJson(json))
              .toList(),
        );
      } else {
        return Failure(
          message: response.data.toString(),
        );
      }
    } on DioException catch (e) {
      return Failure(
        message: e.error.toString(),
      );
    }
  }

  // Get detailed information of a place by its ID
  Future<ApiResponse> getPlaceDetails(String placeId) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey';
    try {
      final response = await dio.get(url.toString());

      if (response.statusCode == 200) {
        final data = response.data;
        print(data["result"]["geometry"]);
        return Success(data: Place.fromJson(data['result']));
      } else {
        return Failure(
          message: response.data.toString(),
        );
      }
    } on DioException catch (e) {
      return Failure(
        message: e.error.toString(),
      );
    }
  }

  // Get place details from latitude and longitude
  Future<ApiResponse> getPlaceDetailsFromCoordinates(
      double latitude, double longitude) async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey';
    try {
      final response = await dio.get(url.toString());
      if (response.statusCode == 200) {
        final data = response.data;
        if(data["status"] == "OK") {
          return Success(data: Place.fromJson(data['results'][0]));
        } else {
          return Failure(
            message: "An error occurred",
          );
        }
      } else {
        return Failure(
          message: response.data.toString(),
        );
      }
    } on DioException catch (e) {
      return Failure(
        message: e.error.toString(),
      );
    }
  }
  //
  // // Calculate distance between two points using the Distance Matrix API
  // Future<ApiResponse> getDistance(
  //     double lat1, double lon1, double lat2, double lon2) async {
  //   final url =
  //       'https://maps.googleapis.com/maps/api/distancematrix/json?origins=$lat1,$lon1&destinations=$lat2,$lon2&key=$apiKey&units=metric';
  //
  //   try {
  //     final response = await dio.get(url.toString());
  //
  //     if (response.statusCode == 200) {
  //       final data = response.data;
  //       // final distance = data['rows'][0]['elements'][0]['distance']
  //       //     ['value']; // distance in meters
  //       // final distanceInKm = distance / 1000; // Convert meters to kilometers
  //       // return Success(data: distanceInKm);
  //       return Success(data: data);
  //     } else {
  //       return Failure(
  //         message: response.data.toString(),
  //       );
  //     }
  //   } on DioException catch (e) {
  //     return Failure(
  //       message: e.error.toString(),
  //     );
  //   }
  // }

  Future<PolylineResult> fetchRoute(
      {required Coordinate sourceLocation,
        required Coordinate destinationLocation}) async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: apiKey,
      request: PolylineRequest(
        origin: PointLatLng(
            sourceLocation.lat.toDouble(), sourceLocation.lng.toDouble()),
        destination: PointLatLng(
          destinationLocation.lat.toDouble(),
          destinationLocation.lng.toDouble(),
        ),
        mode: TravelMode.driving,
      ),
    );
    return result;
  }
}
