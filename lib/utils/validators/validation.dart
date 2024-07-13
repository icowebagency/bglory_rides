import 'dart:developer';

import 'package:intl_phone_field/phone_number.dart';

class TValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    // Check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character.';
    }

    return null;
  }

  static String? validatePhoneNumber(PhoneNumber? phone) {
    if (phone == null || phone.number.isEmpty) {
      return 'Phone number is required.';
    }

    // Regular expression for phone number validation (assuming a 10-digit US phone number format)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(phone.number)) {
      return 'Invalid phone number format (10 digits required).';
    }

    log('${phone.completeNumber.startsWith('+234')}');

    if (!phone.completeNumber.startsWith('+234')) {
      return 'Nigerian number only';
    }

    return null;
  }

  static String? simpleInputValidation(String? text) {
    if (text == null || text.isEmpty) {
      return 'This field is required.';
    }

    return null;
  }

  static String? validNumber(String? text) {
    if (text == null || text.isEmpty) {
      return 'This field is required.';
    }

    if (int.tryParse(text) == null) {
      return 'Enter a valid input';
    }

    return null;
  }

// Add more custom validators as needed for your specific requirements.
}
