import 'package:flutter/material.dart';

class RootPageState extends ChangeNotifier {
  // Search state
  bool _isSearchExpanded = false;
  bool get isSearchExpanded => _isSearchExpanded;

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  // Expand/collapse search
  void expandSearch() {
    _isSearchExpanded = true;
    notifyListeners();
  }

  void collapseSearch() {
    _isSearchExpanded = false;
    searchFocusNode.unfocus();
    notifyListeners();
  }

  // Clear search
  void clearSearch() {
    searchController.clear();
    collapseSearch();
  }

  // For bottom sheet animation
  double get bottomSheetHeight => _isSearchExpanded ? 400.0 : 120.0;

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }
}

class SearchProvider extends ChangeNotifier {
  // Recent searches list
  final List<String> _recentSearches = [];
  List<String> get recentSearches => _recentSearches;

  // Add search to history
  void addSearch(String query) {
    if (query.isNotEmpty) {
      // Remove if already exists (to avoid duplicates)
      _recentSearches.remove(query);

      // Add to the beginning of the list
      _recentSearches.insert(0, query);

      // Keep list at a reasonable size
      if (_recentSearches.length > 10) {
        _recentSearches.removeLast();
      }

      notifyListeners();
    }
  }

  // Clear search history
  void clearSearchHistory() {
    _recentSearches.clear();
    notifyListeners();
  }

  // Remove a specific search from history
  void removeSearch(String query) {
    _recentSearches.remove(query);
    notifyListeners();
  }
}