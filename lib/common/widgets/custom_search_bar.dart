import 'package:flutter/material.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';

class CustomSearchBar extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final VoidCallback? onFocus;
  final VoidCallback? onClear;
  final bool autofocus;
  final bool isExpanded;

  const CustomSearchBar({
    Key? key,
    this.hintText = 'Search...',
    this.controller,
    this.onChanged,
    this.onFocus,
    this.onClear,
    this.autofocus = false,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late final TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_handleTextChange);
    _focusNode.addListener(_handleFocusChange);

    // Auto focus if needed
    if (widget.autofocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        FocusScope.of(context).requestFocus(_focusNode);
      });
    }
  }

  void _handleTextChange() {
    setState(() {}); // Update UI to show/hide clear button
    if (widget.onChanged != null) {
      widget.onChanged!(_controller.text);
    }
  }

  void _handleFocusChange() {
    if (_focusNode.hasFocus && widget.onFocus != null) {
      widget.onFocus!();
    }
  }

  void _clearText() {
    _controller.clear();
    if (widget.onClear != null) {
      widget.onClear!();
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    _controller.removeListener(_handleTextChange);
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? TColors.darkContainer : TColors.white;
    final shadowColor = Colors.black.withOpacity(0.1);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: 56,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
            widget.isExpanded ? TSizes.buttonRadius / 2 : TSizes.buttonRadius
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Back button (only when expanded)
          if (widget.isExpanded)
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: isDark ? TColors.white : TColors.dark,
              ),
              onPressed: () {
                _focusNode.unfocus();
                if (widget.onClear != null) {
                  widget.onClear!();
                }
              },
            ),

          // Search icon
          if (!widget.isExpanded)
            Padding(
              padding: const EdgeInsets.only(left: TSizes.md),
              child: Icon(
                Icons.search,
                color: isDark ? TColors.grey : TColors.darkGrey,
              ),
            ),

          // Search field
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: isDark ? TColors.grey : TColors.darkGrey,
                  fontSize: 16,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                  left: widget.isExpanded ? 0 : TSizes.md,
                  right: TSizes.md,
                ),
              ),
              style: TextStyle(
                color: isDark ? TColors.white : TColors.dark,
                fontSize: 16,
              ),
              textInputAction: TextInputAction.search,
            ),
          ),

          // Clear button (only when there's text or when expanded)
          if (_controller.text.isNotEmpty || widget.isExpanded)
            IconButton(
              icon: Icon(
                Icons.close,
                color: isDark ? TColors.grey : TColors.darkGrey,
              ),
              onPressed: _clearText,
            ),
        ],
      ),
    );
  }
}