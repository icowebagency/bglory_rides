import 'package:flutter/material.dart';
import 'package:bglory_rides/common/widgets/custom_search_bar.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';
import 'package:bglory_rides/utils/constants/text_strings.dart';

class SearchBottomSheet extends StatefulWidget {
  const SearchBottomSheet({Key? key}) : super(key: key);

  @override
  State<SearchBottomSheet> createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<SearchBottomSheet> with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _heightAnimation;
  bool _isExpanded = false;

  // Example recent trips data
  final List<Map<String, String>> _recentTrips = [
    {
      'location': 'Shoprite Mall',
      'address': 'Lekki, Lagos',
      'time': '2 hours ago',
    },
    {
      'location': '18, Chief Dominic Street',
      'address': 'Surulere, Lagos',
      'time': 'Yesterday',
    },
    {
      'location': 'Ikeja City Mall',
      'address': 'Ikeja, Lagos',
      'time': '3 days ago',
    },
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _heightAnimation = Tween<double>(
      begin: 70.0, // Initial height for just the search bar
      end: 400.0,  // Expanded height showing recent trips
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.addListener(() {
      setState(() {});
    });
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: _heightAnimation.value,
      decoration: BoxDecoration(
        color: isDark ? TColors.darkContainer : TColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(TSizes.buttonRadius),
          topRight: Radius.circular(TSizes.buttonRadius),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Drag handle
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(top: TSizes.sm),
            decoration: BoxDecoration(
              color: isDark ? TColors.grey : TColors.darkGrey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Search bar
          Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: CustomSearchBar(
              controller: _searchController,
              hintText: TTexts.riderAddCardTitle,
              isExpanded: _isExpanded,
              onFocus: () {
                if (!_isExpanded) {
                  _toggleExpanded();
                }
              },
              onClear: () {
                if (_isExpanded) {
                  _toggleExpanded();
                }
              },
            ),
          ),

          // Recent trips (only visible when expanded)
          if (_isExpanded)
            Expanded(
              child: Opacity(
                opacity: _animationController.value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.md,
                        vertical: TSizes.sm,
                      ),
                      child: Text(
                        'Recent Trips',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Divider(
                      height: 1,
                      thickness: 1,
                      color: isDark ? TColors.darkGrey.withOpacity(0.3) : TColors.grey.withOpacity(0.3),
                    ),

                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: TSizes.sm),
                        itemCount: _recentTrips.length,
                        separatorBuilder: (context, index) => Divider(
                          height: 1,
                          thickness: 1,
                          indent: 72,
                          color: isDark ? TColors.darkGrey.withOpacity(0.3) : TColors.grey.withOpacity(0.3),
                        ),
                        itemBuilder: (context, index) {
                          final trip = _recentTrips[index];
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
                              trip['location']!,
                              style: TextStyle(
                                color: isDark ? TColors.white : TColors.dark,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(
                              trip['address']!,
                              style: TextStyle(
                                color: isDark ? TColors.grey : TColors.darkGrey,
                                fontSize: 12,
                              ),
                            ),
                            trailing: Text(
                              trip['time']!,
                              style: TextStyle(
                                color: isDark ? TColors.grey : TColors.darkGrey,
                                fontSize: 12,
                              ),
                            ),
                            onTap: () {
                              _searchController.text = trip['location']!;
                              _toggleExpanded();
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Action buttons (when not expanded)
          if (!_isExpanded)
            Padding(
              padding: const EdgeInsets.all(TSizes.md),
              child: Row(
                children: [
                  _buildQuickActionButton(
                    icon: Icons.home_outlined,
                    label: 'Home',
                    onTap: () {},
                  ),
                  _buildQuickActionButton(
                    icon: Icons.work_outline_outlined,
                    label: 'Work',
                    onTap: () {},
                  ),
                  _buildQuickActionButton(
                    icon: Icons.star_outline,
                    label: 'Saved',
                    onTap: () {},
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildQuickActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: TColors.lightGrey,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Icon(
                icon,
                color: TColors.primary,
              ),
            ),
            const SizedBox(height: TSizes.xs),
            Text(
              label,
              style: TextStyle(
                color: isDark ? TColors.white : TColors.dark,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}