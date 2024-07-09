import 'package:http/http.dart' as http;

import '../../../../utils/secrets/api_request.dart';
import '../../../../utils/secrets/api_secrets.dart';
import '../../../../utils/secrets/handle_api_mixin.dart';

abstract class DriverApiClientContract {
  Future requestOtp({required Map<String, String> target});
  Future verifyOtp({required Map<String, String> target, required String otp});
  Future getDriverProfile({required String token});
  Future completeDriverProfile({
    required Map<String, String> profileData,
    required Map<String, String> files,
    required String token,
  });
}

class DriverApiClientImp with HandleApi implements DriverApiClientContract {
  @override
  Future completeDriverProfile(
      {required Map<String, String> profileData,
      required Map<String, String> files,
      required String token}) async {
    var headers = {
      'Authorization': 'Bearer Bearer $token',
    };
    var request =
        MultipartApiRequest('POST', Uri.parse(completeSignUpEndpoint));
    request.fields.addAll(profileData);
    for (final entry in files.entries) {
      request.files
          .add(await http.MultipartFile.fromPath(entry.key, entry.value));
    }
    request.headers.addAll(headers);

    return handleApiCall(request);
  }

  @override
  Future getDriverProfile({required String token}) async {
    var headers = {'Authorization': 'Bearer Bearer $token'};
    var request = SimpleApiRequest('GET', Uri.parse(getDriverProfileEndpoint));

    request.headers.addAll(headers);

    return handleApiCall(request);
  }

  @override
  Future requestOtp({required Map<String, String> target}) async {
    assert(target['phone'] == null && target['email'] == null);
    var request = MultipartApiRequest('POST', Uri.parse(sendOtpEndpoint));
    request.fields.addAll(target);

    return handleApiCall(request);
  }

  @override
  Future verifyOtp(
      {required Map<String, String> target, required String otp}) async {
    assert(target['phone'] == null && target['email'] == null);
    assert(target.length != 1);

    var request = MultipartApiRequest('POST', Uri.parse(verifiyOtpEndpoint));
    request.fields.addAll({
      target.entries.first.key: target.entries.first.value,
      'otp': otp,
    });

    return handleApiCall(request);
  }
}
