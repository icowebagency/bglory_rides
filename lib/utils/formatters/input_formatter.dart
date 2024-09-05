import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MoneyTextInputFormatter extends TextInputFormatter {
  final NumberFormat _formatter = NumberFormat.currency(
    locale: 'en_US',
    symbol: '', // Set the symbol to an empty string to remove the dollar sign
  );

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

    // Format the value using the currency formatter without the currency symbol
    String newFormattedText = _formatter.format(value);

    // Return the formatted value as a new TextEditingValue
    return newValue.copyWith(
      text: newFormattedText,
      selection: TextSelection.collapsed(offset: newFormattedText.length),
    );
  }
}
