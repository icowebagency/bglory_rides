
import 'package:flutter/cupertino.dart';

class VerificationState {
  final bool isLoading;
  final bool isLogin;
  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController transactionPin;
  final TextEditingController confirmPin;
  final String profileImg;

  VerificationState({required this.isLoading, required this.firstName, required this.lastName, required this.transactionPin, required this.confirmPin, required this.profileImg, required this.isLogin});

  VerificationState copyWith({
      bool? isLoading,
      bool? isLogin,
      TextEditingController? firstName,
      TextEditingController? lastName,
      TextEditingController? transactionPin,
      TextEditingController? confirmPin,
      String? profileImg
      }) {
    return VerificationState(
      isLoading: isLoading?? this.isLoading,
      isLogin: isLogin ?? this.isLogin,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      transactionPin: transactionPin ?? this.transactionPin,
      confirmPin: confirmPin ?? this.confirmPin,
      profileImg: profileImg ?? this.profileImg,
    );
  }


  Map<String, String> profileData() {
    return {
      "first_name": firstName.text.trim(),
      "last_name": lastName.text.trim(),
      "transaction_pin": transactionPin.text.trim(),
      "transaction_pin_confirmation": confirmPin.text.trim(),
    };
  }

  Map<String, String> pfpFile() {
    return {
      "profile_image" : profileImg
    };
  }

}