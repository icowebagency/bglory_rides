import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ValidatedDropdown extends FormField<String> {
  ValidatedDropdown({
    Key? key,
    required List<String> items,
    String? initialValue,
    required FormFieldValidator<String> validator,
    String? hintText,
    FormFieldSetter<String>? onSaved,
    required void Function(String?)? onChanged,
    Color dropdownColor = Colors.grey, // Default dropdown color
    InputDecoration decoration = const InputDecoration(), // Default decoration
    bool isExpanded = false,
    Widget? prefixIcon, // Optional prefix icon
    Widget? icon, // Optional dropdown icon
  }) : super(
    key: key,
    initialValue: initialValue,
    validator: validator,
    onSaved: onSaved,
    builder: (FormFieldState<String> field) {
      return DropdownButtonFormField(
        value: field.value,
        isExpanded: isExpanded,
        items: items
            .map((item) => DropdownMenuItem(
          value: item,
          child: Text(item),
        ))
            .toList(),
        onChanged: (String? value) {
          field.didChange(value);
          onChanged?.call(value);
        },
        dropdownColor: dropdownColor,
        icon: icon,
        elevation: 0, // Remove default elevation
        decoration: decoration.copyWith(
          hintText: hintText,
          errorText: field.errorText, // Display validation errors
          prefixIcon: prefixIcon, // Apply prefixIcon if provided
          filled: true,
          fillColor: TColors.grey.withOpacity(0.4), // Updated to TColors
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              // Fixed cascade notation issue and updated to TColors
              color: TColors.primary.withOpacity(0.3),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              // Updated to TColors
              color: TColors.primary.withOpacity(0.3),
            ),
          ),
        ),
      );
    },
  );
}