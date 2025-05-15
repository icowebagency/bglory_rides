import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class TDropdown<T> extends StatelessWidget {
  final String? labelText;
  final String hintText;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final void Function(T?)? onChanged;
  final bool isLoading;
  final String? Function(T?)? validator;
  final EdgeInsetsGeometry? padding;
  final Widget? prefixIcon;

  const TDropdown({
    Key? key,
    this.labelText,
    required this.hintText,
    required this.items,
    this.value,
    required this.onChanged,
    this.isLoading = false,
    this.validator,
    this.padding,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: padding ?? const EdgeInsets.only(bottom: TSizes.spaceBtwInputFields),
      child: DropdownButtonFormField<T>(
        value: value,
        items: items,
        onChanged: isLoading ? null : onChanged,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          filled: true,
          fillColor: isDark ? TColors.darkContainer : TColors.lightContainer,
          prefixIcon: prefixIcon,
          suffixIcon: isLoading
              ? const SizedBox(
            width: 24, height: 24,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: TColors.primary,
              ),
            ),
          )
              : null,
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
            borderSide: const BorderSide(color: TColors.primary),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
            borderSide: const BorderSide(color: TColors.error),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
            borderSide: const BorderSide(color: TColors.error, width: 2),
          ),
        ),
        isExpanded: true,
        icon: Icon(Icons.arrow_drop_down, color: isDark ? TColors.white : TColors.dark),
        dropdownColor: isDark ? TColors.dark : TColors.white,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}