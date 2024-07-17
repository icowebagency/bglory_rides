import 'package:bglory_rides/features/driver/data/api/driver_api_client.dart';
import 'package:bglory_rides/features/driver/data/model/driver_data/driver_data.dart';
import 'package:bglory_rides/features/driver/data/model/login_response.dart';

import '../../../../utils/secrets/apiConstants.dart';

abstract class DriverRepositoryContract {
  String? token;
  Future<Object> completeDriverProfile({
    required Map<String, String> profileData,
    required Map<String, String> files,
  });

  Future<Object> getDriverProfile();

  Future<Object> requestSignUpOtp({required Map<String, String> target});
  Future<Object> requestLoginOtp({required Map<String, String> target});

  Future<Object> verifyOtp(
      {required Map<String, String> target, required String otp});
}

class DriverRepositoryImp implements DriverRepositoryContract {
  final DriverApiClientContract _apiClientContract;

  @override
  String? token;

  DriverRepositoryImp({required DriverApiClientContract apiClientContract})
      : _apiClientContract = apiClientContract;

  @override
  Future<Object> completeDriverProfile({
    required Map<String, String> profileData,
    required Map<String, String> files,
  }) async {
    final response = await _apiClientContract.completeDriverProfile(
      token: token!,
      profileData: profileData,
      files: files,
    );

    if (response is Success) {
      return Success(
        data: DriverData.fromJson(
          response.data['data']['driver_data'],
        ),
      );
    } else {
      return response as Failure;
    }
  }

  @override
  Future<Object> getDriverProfile() async {
    final result = await _apiClientContract.getDriverProfile(token: token!);

    if (result is Success) {
      return Success(
        data: DriverData.fromJson(
          result.data['data']['profile'],
        ),
      );
    } else {
      return result as Failure;
    }
  }

  @override
  Future<Object> requestSignUpOtp({required Map<String, String> target}) async {
    final result = await _apiClientContract.requestSignUpOtp(target: target);

    if (result is Success) {
      return result;
    } else {
      return result as Failure;
    }
  }

  @override
  Future<Object> requestLoginOtp({required Map<String, String> target}) async {
    final result = await _apiClientContract.requestLoginOtp(target: target);

    if (result is Success) {
      return result;
    } else {
      return result as Failure;
    }
  }

  @override
  Future<Object> verifyOtp(
      {required Map<String, String> target, required String otp}) async {
    final result = await _apiClientContract.verifyOtp(target: target, otp: otp);
    if (result is Success) {
      return Success(
        data: LoginResponse.fromJson(
          result.data,
        ),
      );
    } else {
      final failure = result as Failure;
      return failure;
    }
  }
}
