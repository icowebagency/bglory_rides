
import 'dart:async';

import 'package:bglory_rides/common/google_maps/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../common/google_maps/model/prediction.dart';
import '../../../../../utils/secret/api_constants.dart';

class SearchLocationState {
  final List<Prediction> predictions;

  SearchLocationState({required this.predictions});

  SearchLocationState copyWith({List<Prediction>? predications}) {
    return SearchLocationState(
      predictions: predications ?? predictions,
    );
  }
}

class SearchLocationNotifier extends Notifier<SearchLocationState> {
  @override
  SearchLocationState build() => SearchLocationState(predictions: []);

  Timer? _debounceTimer;
  static const int _debounceDuration = 500; // debounce duration in milliseconds

  void onTextChanged(String query) {
    // Cancel the previous timer if it's still running
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer?.cancel();
    }

    if (query.isEmpty) {
      state = state.copyWith(predications: []);
    }
    // Set a new timer to fetch suggestions after a delay
    _debounceTimer = Timer(const Duration(milliseconds: _debounceDuration), () {
      getPredictionFromSearch(query);
    });
  }

  void getPredictionFromSearch(String input) async {
    if (input.isEmpty || input.length < 3) {
      return;
    }
    final result = await ref.read(googleServiceProvider).searchPlace(input);
    if (result is Success) {
      state = state.copyWith(predications: (result.data as List<Prediction>));
    }
  }

  void clearState() {
    state = state.copyWith(predications: []);
  }
}

final searchLocationProvider =
NotifierProvider<SearchLocationNotifier, SearchLocationState>(
        () => SearchLocationNotifier());
