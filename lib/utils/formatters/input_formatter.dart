import 'package:bglory_rides/utils/formatters/formatter.dart';
import 'package:flutter/services.dart';

class MoneyTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // If input is empty, return the empty value
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Remove any non-digit characters
    final String newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Convert the new text to a double value to format it correctly
    double value = double.parse(newText) / 100;

    // Format the value using the currency formatter
    String newFormattedText = TFormatter.formatCurrency(value);

    // Return the formatted value as a new TextEditingValue
    return newValue.copyWith(
      text: newFormattedText,
      selection: TextSelection.collapsed(offset: newFormattedText.length),
    );
  }
}
