import 'package:bglory_rides/features/rider/data/api/rider_api_client.dart';
import 'package:bglory_rides/utils/secret/api_constants.dart';

class RiderAuthRepositoryImpl {

  final RiderApiClientContract _apiClientContract;

  RiderAuthRepositoryImpl({required RiderApiClientContract apiContract})
      : _apiClientContract = apiContract;

  Future requestSignInOtp({required Map<String, String> data}) async {
    final result = await _apiClientContract.requestLoginOtp(data: data);
    if(result is Success) {
      return result;
    } else {
      return result as Failure;
    }
  }

  Future requestSignUpOtp({required Map<String, String> data}) async {
    final result = await _apiClientContract.requestSignUpOtp(data: data);
    if(result is Success) {
      return result;
    } else {
      return result as Failure;
    }
  }

  Future completeSignUp({
    required Map<String, String> profileData,
    required Map<String, String> files, required String token}) async {
    final result = await _apiClientContract.completeRiderSignUp(profileData: profileData, files: files, token: token);
    return result;
  }

  Future verifyLoginOtp({required Map<String, String> data, required String otp}) async {
    final result = await _apiClientContract.verifyLoginOtp(data: data, otp: otp);
    return result;
  }

  Future verifySignUpOtp({required Map<String, String> data,}) async {
    final result = await _apiClientContract.verifySignUpOtp(data: data);
    if(result is Success) {
      final data = result.data["data"];
      return Success(data: data);
    } else {
      return result;
    }
  }


}