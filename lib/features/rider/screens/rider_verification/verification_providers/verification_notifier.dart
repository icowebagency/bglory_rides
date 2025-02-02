import 'package:bglory_rides/features/rider/data/provider/rider_data_providers.dart';
import 'package:bglory_rides/features/rider/screens/rider_verification/verification_providers/verification_state.dart';
import 'package:bglory_rides/utils/secret/api_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../../utils/notification/notification_utils.dart';

final verificationNotifier = NotifierProvider.autoDispose<VerificationNotifier, VerificationState>(
    () => VerificationNotifier()
);

class VerificationNotifier extends AutoDisposeNotifier<VerificationState> {
  @override
  VerificationState build() {
    return VerificationState(
      isLoading: false,
      isLogin: true,
      firstName: TextEditingController(),
      lastName: TextEditingController(),
      transactionPin: TextEditingController(),
      confirmPin: TextEditingController(),
      profileImg: '',
    );
  }

  final pref = const  FlutterSecureStorage();
  String token = "";

  bool validatePins() {
    if(state.transactionPin.text == state.confirmPin.text) {
      return true;
    } else {
      NotificationUtil.showErrorNotification("Transaction pin does not match");
      return false;
    }
  }

  void updateProfile(String path) {
    state = state.copyWith(profileImg: path);
  }

  void completeSignUp() async {
    try{
      if(validatePins()) {
        state = state.copyWith(isLoading: true);
        print(state.profileData());
        print(state.pfpFile());
        final result = await ref.read(riderAuthRepoProvider).completeSignUp(profileData: state.profileData(), files: state.pfpFile() , token: token);
        if(result is Failure) {
          NotificationUtil.showErrorNotification(result.message ?? "An unexpected error occurred");
        }
        state = state.copyWith(isLoading: false);
      }
    } catch(e) {
      state = state.copyWith(isLoading: false);
    }
  }

  void setMode(bool isLogin) {
    state = state.copyWith(isLogin: isLogin);
  }

  Future resendCode(Map<String, String> target, VoidCallback onSuccess,) async {
    dynamic result;
    if(state.isLogin) {
      print('GET LOGIN OTP');
      result = await ref.read(riderAuthRepoProvider).requestSignInOtp(
          data: target);
    } else {
      result = await ref.read(riderAuthRepoProvider).requestSignUpOtp(data: target);
    }
    print(result);
    if(result is Success) {
      onSuccess();
    } else {
      NotificationUtil.showErrorNotification(result.message ?? "An unexpected error occurred");
    }
  }

  Future<bool> verifyOtp(
      {required Map<String, String> target, Function(String)? onError, required String otp}) async {
    assert(target['phone'] != null || target['email'] != null,
    'Either phone or email must be present');
    state = state.copyWith(isLoading: true);
    final data = Map<String, String>.from(target);
    data["otp"] = otp;
    print(data);
    final result = await ref.read(riderAuthRepoProvider).verifySignUpOtp(data: data);
    state = state.copyWith(isLoading: false);
    if(result is Failure) {
      NotificationUtil.showErrorNotification(result.message ?? "An unexpected error occurred");
      return false;
    } else {
      print(result.toString());
      print((result as Success).data["token"]);
      token = (result).data["token"];
      await pref.write(key: "token", value: token);
      ref.read(riderProfileProvider).getRiderProfile(token);
      return true;
    }

  }

}