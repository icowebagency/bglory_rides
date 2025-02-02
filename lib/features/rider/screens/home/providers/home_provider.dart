import 'package:bglory_rides/common/google_maps/model/place.dart';
import 'package:bglory_rides/features/rider/screens/home/providers/map_provider.dart';
import 'package:bglory_rides/utils/secret/api_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../common/google_maps/provider.dart';

class HomeState {
  final Place? pickUp;
  final Place? dropOff;
  final bool isLoading;
  final bool isDraggableSheetVisible;
  final TextEditingController source;

  HomeState({required this.pickUp, required this.dropOff, required this.isLoading, required this.source, required this.isDraggableSheetVisible});

  HomeState copyWith({
    Place? pickUp,
    Place? dropOff,
    bool? isLoading,
    TextEditingController? source,
    bool? isDraggableSheetVisible
}) {
    return HomeState(pickUp: pickUp ?? this.pickUp, dropOff: dropOff ?? this.dropOff, isLoading: isLoading?? this.isLoading, source: source ?? this.source, isDraggableSheetVisible: isDraggableSheetVisible ?? this.isDraggableSheetVisible);
  }
}


class HomeNotifier extends Notifier<HomeState> {
  @override
  HomeState build() {
    return HomeState(pickUp: null, dropOff: null, isLoading: false, source: TextEditingController(), isDraggableSheetVisible: true);
  }

  void setDestination(String placeId) async {
    final place = await ref.read(googleServiceProvider).getPlaceDetails(placeId);
    if(place is Success) {
      state = state.copyWith(pickUp: place.data);
      ref.read(userMapProvider.notifier).setDropOffMarker(place: place.data as Place);
      // ref.read(userMapProvider.notifier).setPickupMarker(latitude: (place.data as Place).geometry!.location.lat.toDouble(), longitude: (place.data as Place).geometry!.location.lng.toDouble(),
      // info: (place.data as Place).name);
    }

  }

  void setPickup(Place place) {
    print(place.formattedAddress);
    state = state.copyWith(
      pickUp: place,
      source: TextEditingController(text: place.formattedAddress)
    );
    print(state.source.text);
  }

}

final homeProvider = NotifierProvider<HomeNotifier, HomeState>(
        () => HomeNotifier());