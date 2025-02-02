

import 'dart:async';
import 'dart:ffi';

import 'package:bglory_rides/common/google_maps/location.dart';
import 'package:bglory_rides/common/google_maps/model/place.dart';
import 'package:bglory_rides/common/google_maps/provider.dart';
import 'package:bglory_rides/features/rider/screens/home/providers/home_provider.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/secret/api_constants.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapState {
  final List<LatLng> polylineCoordinates;
  final Set<Polyline> polylines;
  final Set<Marker> markers;

  const MapState({
    this.polylineCoordinates = const [],
    this.polylines = const {},
    this.markers = const {},
  });

  MapState copyWith({
    List<LatLng>? polylineCoordinates,
    Set<Polyline>? polylines,
    Set<Marker>? markers,
    String? eta
  }) {
    return MapState(
        polylineCoordinates: polylineCoordinates ?? this.polylineCoordinates,
        polylines: polylines ?? this.polylines,
        markers: markers ?? this.markers,
    );
  }
}

class HomeMapNotifier extends Notifier<MapState> {
  late Completer<GoogleMapController> _mapController;
  BitmapDescriptor fromIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor toIcon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);
  List<LatLng> polyLines = [];

  Future<void> initializeMap(GoogleMapController mapController) async {
    _mapController = Completer();
    _mapController.complete(mapController);
    bool perm = await LocationManager.init();
    if(perm) {
      initLocation();
    }

    print("completed");
  }

  void initLocation() async {
    Position position = await LocationManager.getLocation();
    // final result = await ref.read(googleServiceProvider).getPlaceDetailsFromCoordinates(6.4681174, 3.6395689);
    final result = await ref.read(googleServiceProvider).getPlaceDetailsFromCoordinates(position.latitude, position.longitude);
    if(result is Success) {
      ref.read(homeProvider.notifier).setPickup(result.data as Place);
      setPickupMarker(latitude: position.latitude, longitude: position.longitude, info: (result.data as Place).formattedAddress);
      // setPickupMarker(latitude: 6.4681174, longitude: 3.6395689, info: (result.data as Place).formattedAddress);
    }
  }

  void setPickUpkMarkers({required LatLng driverLocation, required LatLng pickupLocation, bool animate = true}) async {
    final markers = <Marker>{
      Marker(
        markerId: const MarkerId('driver'),
        position: driverLocation,
        infoWindow: const InfoWindow(title: 'driver location'),
        icon: fromIcon,
      ),
      Marker(
        markerId: const MarkerId('pickup'),
        position: pickupLocation,
        infoWindow: const InfoWindow(title: 'Pickup Location'),
        icon: toIcon,
      ),
    };
    state = state.copyWith(markers: markers);
    if(animate == true) {
      _setBoundsForLocations(
          sourceLocation: driverLocation, destinationLocation: pickupLocation);
    }
  }

  void setPickupMarker({required double latitude, required double longitude, String? info}) {
    final marker = <Marker> {
      Marker(
        markerId: const MarkerId('source'),
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(title: info ?? 'pickup location'),
        icon: fromIcon,
      ),
    };
    state = state.copyWith(markers: marker);
    _mapController.future.then(
          (value) => value.animateCamera(
        CameraUpdate.newLatLng(LatLng(latitude, longitude)),
      ),
    );
    print("DONNEEEE");
  }

  void setDropOffMarker({required Place place}) {
    final drop = state.markers.firstWhere(
        (markers) => markers.markerId.value == "destination",
      orElse: () => Marker(markerId: const MarkerId("destination"),icon: toIcon)
    );
    final newMarker = drop.copyWith(
      positionParam: LatLng(place.geometry!.location.lat.toDouble(), place.geometry!.location.lng.toDouble(),),
      infoWindowParam: InfoWindow(title: place.name ?? "destination")
    );
    state = state.copyWith(
      markers: {...state.markers, newMarker}
    );
    _setBoundsForLocations(sourceLocation: state.markers.elementAt(0).position, destinationLocation: newMarker.position);
    setUpPolyLines(
      source: Coordinate(lat: state.markers.elementAt(0).position.latitude, lng: state.markers.elementAt(0).position.longitude),
      destination: Coordinate(lat: newMarker.position.latitude, lng: newMarker.position.longitude),
    );
  }

  void updateMarkers({required LatLng driverLocation, required LatLng pickupLocation}) async {
    final markers = <Marker>{
      Marker(
        markerId: const MarkerId('driver'),
        position: driverLocation,
        infoWindow: const InfoWindow(title: 'driver location'),
        icon: fromIcon,
      ),
      Marker(
        markerId: const MarkerId('pickup'),
        position: pickupLocation,
        infoWindow: const InfoWindow(title: 'Pickup Location'),
        icon: toIcon,
      ),
    };
    state = state.copyWith(markers: markers);
    // _setBoundsForLocations(sourceLocation: driverLocation, destinationLocation: pickupLocation);
  }


  void setUpPolyLines({required Coordinate source, required Coordinate destination,}) async  {
    PolylineResult result = await ref.read(googleServiceProvider).fetchRoute(
      sourceLocation: source,
      destinationLocation: destination,
    );
    if (result.points.isNotEmpty) {
      final polylineCoordinates = result.points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();
      // polyLines = polylineCoordinates;
      final polylines = <Polyline>{
        Polyline(
          polylineId: const PolylineId('route'),
          color: TColors.primary,
          width: 4,
          points: polylineCoordinates,
        ),
      };
      state = state.copyWith(
        polylineCoordinates: polylineCoordinates,
        polylines: polylines,
      );
    }
  }





  void addCustomIcon() {
    // BitmapDescriptor.fromAssetImage(
    //     const ImageConfiguration(), 'assets/green_marker.png')
    //     .then((value) => toIcon = value,);
    // BitmapDescriptor.fromAssetImage(
    //     const ImageConfiguration(), 'assets/red_marker.png')
    //     .then((value) => fromIcon = value);
  }

  void _setBoundsForLocations(
      {required LatLng sourceLocation, required LatLng destinationLocation}) {
    final LatLngBounds bounds = LatLngBounds(
      southwest: LatLng(
        sourceLocation.latitude < destinationLocation.latitude
            ? sourceLocation.latitude
            : destinationLocation.latitude,
        sourceLocation.longitude < destinationLocation.longitude
            ? sourceLocation.longitude
            : destinationLocation.longitude,
      ),
      northeast: LatLng(
        sourceLocation.latitude > destinationLocation.latitude
            ? sourceLocation.latitude
            : destinationLocation.latitude,
        sourceLocation.longitude > destinationLocation.longitude
            ? sourceLocation.longitude
            : destinationLocation.longitude,
      ),
    );

    _mapController.future.then(
          (value) => value.animateCamera(
        CameraUpdate.newLatLngBounds(bounds, 100),
      ),
    );
  }


  @override
  MapState build() => const MapState();
}

final userMapProvider = NotifierProvider<HomeMapNotifier, MapState>(() {
  return HomeMapNotifier();
});
