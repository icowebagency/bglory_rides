import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';


class TTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final bool isLoading;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final VoidCallback? onTap;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final FocusNode? focusNode;
  final bool showCursor;
  final bool autofocus;
  final bool enabled;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final TextInputAction? textInputAction;
  final String? errorText;
  final Color? fillColor;
  final bool filled;
  final TextStyle? labelStyle; // Added labelStyle property

  const TTextFormField({
    Key? key,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.isLoading = false,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.padding,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.readOnly = false,
    this.onTap,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.focusNode,
    this.showCursor = true,
    this.autofocus = false,
    this.enabled = true,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.textInputAction,
    this.errorText,
    this.fillColor,
    this.filled = true,
    this.labelStyle, // Added to constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: padding ?? const EdgeInsets.only(bottom: TSizes.spaceBtwInputFields),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        readOnly: readOnly || isLoading,
        onTap: onTap,
        maxLines: maxLines,
        minLines: minLines,
        expands: expands,
        focusNode: focusNode,
        showCursor: showCursor,
        autofocus: autofocus,
        enabled: enabled && !isLoading,
        textCapitalization: textCapitalization,
        textAlign: textAlign,
        textInputAction: textInputAction,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          errorText: errorText,
          filled: filled,
          fillColor: fillColor ?? (isDark ? TColors.darkContainer : TColors.lightContainer),
          prefixIcon: prefixIcon,
          suffixIcon: isLoading
              ? SizedBox(
            width: 24, height: 24,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: TColors.primary,
              ),
            ),
          )
              : suffixIcon,
          labelStyle: labelStyle, // Use the provided labelStyle
          // Add better floating label behavior
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          // Add more padding to create space for the label
          contentPadding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
            borderSide: BorderSide(color: isDark ? TColors.darkGrey : TColors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
            borderSide: BorderSide(color: isDark ? TColors.darkGrey : TColors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
            borderSide: BorderSide(color: TColors.primary),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
            borderSide: BorderSide(color: TColors.error),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
            borderSide: BorderSide(color: TColors.error, width: 2),
          ),
        ),
      ),
    );
  }
}