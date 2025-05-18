import 'package:flutter/material.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/sizes.dart';

class SearchField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String hintText;
  final Function(String)? onChanged;
  final VoidCallback? onFocus;
  final Function()? onClear;
  final bool isExpanded;
  final bool autofocus;
  final bool enabled;
  final Widget? prefixIcon;

  const SearchField({
    Key? key,
    this.controller,
    this.focusNode,
    this.hintText = 'Search...',
    this.onChanged,
    this.onFocus,
    this.onClear,
    this.isExpanded = false,
    this.autofocus = false,
    this.enabled = true,
    this.prefixIcon,
  }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();

    _controller.addListener(_handleTextChange);
    _focusNode.addListener(_handleFocusChange);

    if (widget.autofocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        FocusScope.of(context).requestFocus(_focusNode);
      });
    }
  }

  void _handleTextChange() {
    setState(() {});
    if (widget.onChanged != null) {
      widget.onChanged!(_controller.text);
    }
  }

  void _handleFocusChange() {
    if (_focusNode.hasFocus && widget.onFocus != null) {
      widget.onFocus!();
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    _controller.removeListener(_handleTextChange);
    _focusNode.removeListener(_handleFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: isDark ? TColors.darkContainer : TColors.white,
        borderRadius: BorderRadius.circular(widget.isExpanded ? 8 : TSizes.buttonRadius),
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
        enabled: widget.enabled,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: isDark ? TColors.grey : TColors.darkGrey,
            fontSize: 16,
          ),
          prefixIcon: widget.isExpanded
              ? IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: isDark ? TColors.white : TColors.dark,
            ),
            onPressed: widget.onClear,
          )
              : widget.prefixIcon ?? Icon(
            Icons.search,
            color: isDark ? TColors.grey : TColors.darkGrey,
          ),
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
            icon: Icon(
              Icons.close,
              color: isDark ? TColors.grey : TColors.darkGrey,
            ),
            onPressed: () {
              _controller.clear();
              if (widget.onClear != null) {
                widget.onClear!();
              }
            },
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
        textInputAction: TextInputAction.search,
      ),
    );
  }
}