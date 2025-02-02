import 'package:geolocator/geolocator.dart';

class LocationManager {

  static Future<bool> init() async {

    print("init");
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
        // return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      final settings = await Geolocator.openAppSettings();
      print(settings);
      if(settings) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
          return Future.error('Location permissions are denied');
          // return false;
        }
        return true;
      }
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return true;
  }

  static Future<Position> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(locationSettings: LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    ));
    return position;
  }

}