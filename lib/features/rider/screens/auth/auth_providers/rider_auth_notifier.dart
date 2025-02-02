import 'package:bglory_rides/features/rider/data/provider/rider_data_providers.dart';
import 'package:bglory_rides/features/rider/data/repository/rider_auth_repository.dart';
import 'package:bglory_rides/features/rider/screens/auth/auth_providers/auth_state.dart';
import 'package:bglory_rides/features/rider/screens/rider_verification/verification_providers/verification_notifier.dart';
import 'package:bglory_rides/routing/rider_routing.dart';
import 'package:bglory_rides/utils/notification/notification_utils.dart';
import 'package:bglory_rides/utils/secret/api_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

abstract class RiderAuthNotifier extends StateNotifier<AuthState>{
  RiderAuthNotifier({required RiderAuthRepositoryImpl authRepo, required this.ref}) :
      _authRepo = authRepo,
    super(AuthState(
            isLoading: false,
            textFieldController: TextEditingController(),
            router: RiderRouting.router,
            pageIndex: 0,
          ));

  final Ref ref;
  final RiderAuthRepositoryImpl _authRepo;



  void setPageController({required TabController controller}) {
    controller.removeListener(clearTextField);
    controller.addListener(clearTextField);
  }

  void clearTextField() {
    state.textFieldController.clear();
  }

  void updatePageIndicator(int index) {
    state = state.copyWith(pageIndex: index);
  }

  void updateLoadState(bool value) {
    state = state.copyWith(isLoading: value);
  }

  Future<bool> onAuthAction({required Map<String, String> target, Function(String)? onError, required BuildContext context});
}

class RiderSignUpState extends RiderAuthNotifier {


  RiderSignUpState({required super.authRepo, required super.ref});

  @override
  Future<bool> onAuthAction({required Map<String, String> target, Function(String p1)? onError, required BuildContext context}) async {
    assert(target["email"] != null || target["phone"] != null,
    "Enter email or phone number");
    // context.goNamed(BGRiderRouteNames.riderPhoneVerificationScreen,
    //     queryParameters: target);
    // return true;

    ///TODO: UNCOMMENT THIS
    state = state.copyWith(isLoading: true);
    final result = await _authRepo.requestSignUpOtp(data: target);
    print(result);
    state = state.copyWith(isLoading: false);
    if(result is Failure) {
      onError?.call((result).message ?? "Signup Failed");
      NotificationUtil.showErrorNotification(result.message ?? "Signup Failed");
      return false;
    } else{
      ref.read(verificationNotifier.notifier).setMode(false);
      print(result.toString());
      if(context.mounted) {
        // context.go(BGRiderRouteNames.riderPhoneVerificationScreen);
        context.goNamed(BGRiderRouteNames.riderPhoneVerificationScreen,
        queryParameters: target);
      }
      return true;
    }
  }


}

class RiderSignInState extends RiderAuthNotifier {


  RiderSignInState({required super.authRepo, required super.ref});


  @override
  Future<bool> onAuthAction({required Map<String, String> target, Function(String p1)? onError, required BuildContext context}) async {
   state = state.copyWith(isLoading: true);
   final result = await ref.read(riderAuthRepoProvider).requestSignInOtp(data: target);
   state = state.copyWith(isLoading: false);
   if(result is Failure) {
     onError?.call((result).message ?? "Sign in Failed");
     NotificationUtil.showErrorNotification(result.message ?? "Sign in Failed");
     return false;
   } else{
     ref.read(verificationNotifier.notifier).setMode(true);
     print(result.toString());
     if(context.mounted) {
       // context.go(BGRiderRouteNames.riderPhoneVerificationScreen);
       context.goNamed(BGRiderRouteNames.riderPhoneVerificationScreen,
           queryParameters: target);
     }
     return true;
   }

  }


}