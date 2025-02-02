import 'dart:async';
import 'package:bglory_rides/utils/secret/handle_api_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../utils/secret/api_request.dart';
import '../../../../utils/secret/api_secrets.dart';



abstract class RiderApiClientContract {

  Future requestSignUpOtp({required Map<String, String> data});

  Future verifySignUpOtp({required Map<String, String> data});

  Future requestLoginOtp({required Map<String, String> data});

  Future verifyLoginOtp({required Map<String, String> data, required String otp});

  Future completeRiderSignUp({required Map<String, String> profileData, required Map<String, dynamic> files, required String token});

  Future getRiderProfile({required String token});

}

class RiderApiClientImpl with HandleApi implements RiderApiClientContract {
  @override
  Future completeRiderSignUp({required Map<String, String> profileData, required Map<String, dynamic> files, required String token}) async {
    var headers = {
      'Authorization': 'Bearer Bearer $token',
    };
    var request =  MultipartApiRequest('POST', Uri.parse(sendRiderSignInOtp));
    request.fields.addAll(profileData);
    for(var entry in files.entries) {
      print(entry.key);
      print(entry.value);
      request.files.add(
          await http.MultipartFile.fromPath(entry.key, entry.value)
      );
    }
    request.headers.addAll(headers);
    return handleApiCall(request);
  }

  @override
  Future getRiderProfile({required String token}) {
    var headers = {'Authorization': 'Bearer Bearer $token'};
    var request = SimpleApiRequest('GET', Uri.parse(getRiderProfileEndpoint));
    request.headers.addAll(headers);
    return handleApiCall(request);
  }

  @override
  Future requestLoginOtp({required Map<String, String> data}) {
    assert(data['phone'] != null || data['email'] != null,
    'Either phone or email must be present');
    final request = MultipartApiRequest('POST', Uri.parse(sendRiderSignInOtp));
    request.fields.addAll(data);
    return handleApiCall(request);
  }

  @override
  Future requestSignUpOtp({required Map<String, String> data}) {
    assert(data['phone'] != null || data['email'] != null,
    'Either phone or email must be present');
    final request = MultipartApiRequest('POST', Uri.parse(sendRiderSignUpOtp));
    request.fields.addAll(data);
    return handleApiCall(request);
  }

  @override
  Future verifyLoginOtp({required Map<String, String> data, required String otp}) {
    assert(data['phone'] != null || data['email'] != null,
    'Either phone or email must be present');
    final request = MultipartApiRequest('POST', Uri.parse(verifyRiderSignInOtp));
    request.fields.addAll(data);
    return handleApiCall(request);
  }

  @override
  Future verifySignUpOtp({required Map<String, String> data}) {
    assert(data['phone'] != null || data['email'] != null,
    'Either phone or email must be present');
    final request = MultipartApiRequest('POST', Uri.parse(verifyRiderSignUpOtp));
    request.fields.addAll(data);
    return handleApiCall(request);
  }

}