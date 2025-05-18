import 'dart:math';

import 'package:flutter/material.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/device/device_utility.dart';

class ExpandableSearchField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final VoidCallback? onClear;
  final List<RecentTrip> recentTrips;
  final Function(RecentTrip)? onTripSelected;

  const ExpandableSearchField({
    Key? key,
    this.hintText = 'Search for a destination',
    this.controller,
    this.onChanged,
    this.onClear,
    this.recentTrips = const [],
    this.onTripSelected,
  }) : super(key: key);

  @override
  State<ExpandableSearchField> createState() => _ExpandableSearchFieldState();
}

class _ExpandableSearchFieldState extends State<ExpandableSearchField> with SingleTickerProviderStateMixin {
  late final TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();
  late AnimationController _animationController;
  late Animation<double> _sheetAnimation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();

    // Setup animation
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _sheetAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    // Add listeners
    _focusNode.addListener(_handleFocusChange);
    _controller.addListener(_handleTextChange);
  }

  void _handleFocusChange() {
    if (_focusNode.hasFocus && !_isExpanded) {
      _expandSheet();
    }
  }

  void _handleTextChange() {
    setState(() {}); // Rebuild to update the clear button visibility
    if (widget.onChanged != null) {
      widget.onChanged!(_controller.text);
    }
  }

  void _expandSheet() {
    setState(() {
      _isExpanded = true;
    });
    _animationController.forward();
  }

  void _collapseSheet() {
    _animationController.reverse().then((_) {
      setState(() {
        _isExpanded = false;
      });
    });
    _focusNode.unfocus();
  }

  void _clearSearch() {
    _controller.clear();
    if (widget.onClear != null) {
      widget.onClear!();
    }
  }

  void _handleTripSelection(RecentTrip trip) {
    _controller.text = trip.destination;
    _collapseSheet();
    if (widget.onTripSelected != null) {
      widget.onTripSelected!(trip);
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = TDeviceUtils.getScreenWidth(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        // Expanded background overlay (if expanded)
        if (_isExpanded)
          GestureDetector(
            onTap: _collapseSheet,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black54,
            ),
          ),

        // Search field container
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.md,
                  vertical: TSizes.sm
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Search field
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: isDark ? TColors.darkContainer : TColors.white,
                      borderRadius: BorderRadius.circular(TSizes.buttonRadius),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        hintText: widget.hintText,
                        hintStyle: TextStyle(
                            color: isDark ? TColors.grey : TColors.darkGrey,
                            fontSize: 16
                        ),
                        prefixIcon: Icon(
                            Icons.search,
                            color: isDark ? TColors.grey : TColors.darkGrey
                        ),
                        suffixIcon: _controller.text.isNotEmpty || _isExpanded
                            ? IconButton(
                          icon: Icon(
                            Icons.close,
                            color: isDark ? TColors.grey : TColors.darkGrey,
                          ),
                          onPressed: _isExpanded ? _collapseSheet : _clearSearch,
                        )
                            : null,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: TSizes.md,
                          vertical: TSizes.sm,
                        ),
                      ),
                      style: TextStyle(
                        color: isDark ? TColors.white : TColors.dark,
                        fontSize: 16,
                      ),
                      onTap: () {
                        if (!_isExpanded) {
                          _expandSheet();
                        }
                      },
                      textInputAction: TextInputAction.search,
                    ),
                  ),

                  // Recent trips container (animated)
                  AnimatedBuilder(
                    animation: _sheetAnimation,
                    builder: (context, child) {
                      return ClipRect(
                        child: Container(
                          height: _sheetAnimation.value * min(screenHeight * 0.6, 400),
                          margin: const EdgeInsets.only(top: TSizes.xs),
                          decoration: BoxDecoration(
                            color: isDark ? TColors.darkContainer : TColors.white,
                            borderRadius: BorderRadius.circular(TSizes.buttonRadius),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Opacity(
                            opacity: _sheetAnimation.value,
                            child: child,
                          ),
                        ),
                      );
                    },
                    child: _buildRecentTripsList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecentTripsList() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.all(TSizes.md),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Trips',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Handle clear all action
                },
                child: Text(
                  'Clear All',
                  style: TextStyle(
                    color: TColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Divider
        Divider(
          height: 1,
          thickness: 1,
          color: isDark ? TColors.darkGrey.withOpacity(0.3) : TColors.grey.withOpacity(0.3),
        ),

        // List of recent trips
        Expanded(
          child: widget.recentTrips.isEmpty
              ? Center(
            child: Text(
              'No recent trips',
              style: TextStyle(
                color: isDark ? TColors.grey : TColors.darkGrey,
              ),
            ),
          )
              : ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: TSizes.sm),
            itemCount: widget.recentTrips.length,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              thickness: 1,
              indent: 72,
              color: isDark ? TColors.darkGrey.withOpacity(0.3) : TColors.grey.withOpacity(0.3),
            ),
            itemBuilder: (context, index) {
              final trip = widget.recentTrips[index];
              return ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: TColors.lightGrey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.history,
                    color: TColors.primary,
                  ),
                ),
                title: Text(
                  trip.destination,
                  style: TextStyle(
                    color: isDark ? TColors.white : TColors.dark,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  trip.address,
                  style: TextStyle(
                    color: isDark ? TColors.grey : TColors.darkGrey,
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text(
                  trip.formattedTime,
                  style: TextStyle(
                    color: isDark ? TColors.grey : TColors.darkGrey,
                    fontSize: 12,
                  ),
                ),
                onTap: () => _handleTripSelection(trip),
              );
            },
          ),
        ),
      ],
    );
  }
}

// Model class for recent trips
class RecentTrip {
  final String destination;
  final String address;
  final DateTime time;

  RecentTrip({
    required this.destination,
    required this.address,
    required this.time,
  });

  String get formattedTime {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}