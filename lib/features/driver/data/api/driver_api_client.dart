import 'package:http/http.dart' as http;

import '../../../../utils/secret/api_request.dart';
import '../../../../utils/secret/api_secrets.dart';
import '../../../../utils/secret/handle_api_mixin.dart';

abstract class DriverApiClientContract {
  Future requestSignUpOtp({required Map<String, String> target});

  Future requestLoginOtp({required Map<String, String> target});

  Future verifyOtp({required Map<String, String> target, required String otp});

  Future getDriverProfile({required String token});

  Future completeDriverProfile({
    required Map<String, String> profileData,
    required Map<String, String> files,
    required String token,
  });

  Future getDriverEarnings({required String token});

  Future setTransactionPin(
      {required String token,
      required String transactionPin,
      required String transactionPinConfirmation});

  Future requestWithdrawal(
      {required String token,
      required String amount,
      required String transactionPin});

  Future getTransactionHistory({required String token});

  Future getTransactionInsights({required String token});

  Future getDashboardData({required String token});
  Future getTrips({required String token, required int page});
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
        MultipartApiRequest('POST', Uri.parse(driverCompleteSignUpEndpoint));
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
  Future requestSignUpOtp({required Map<String, String> target}) async {
    assert(target['phone'] != null || target['email'] != null,
        'Either phone or email must be present');
    var request =
        MultipartApiRequest('POST', Uri.parse(driverSendSignUpOtpEndpoint));
    request.fields.addAll(target);

    return handleApiCall(request);
  }

  @override
  Future verifyOtp(
      {required Map<String, String> target, required String otp}) async {
    assert(target['phone'] != null || target['email'] != null,
        'Either phone or email must be present');

    var request =
        MultipartApiRequest('POST', Uri.parse(driverVerifiyOtpEndpoint));
    request.fields.addAll({
      target.entries.first.key: target.entries.first.value,
      'otp': otp,
    });

    return handleApiCall(request);
  }

  @override
  Future requestLoginOtp({required Map<String, String> target}) {
    assert(target['phone'] != null || target['email'] != null,
        'Either phone or email must be present');
    var request =
        MultipartApiRequest('POST', Uri.parse(driverSendLoginOtpEndpoint));
    request.fields.addAll(target);

    return handleApiCall(request);
  }

  @override
  Future getDriverEarnings({required String token}) {
    var headers = {'Authorization': 'Bearer Bearer $token'};
    var request = SimpleApiRequest('GET', Uri.parse(driverEarningsEndpoint));

    request.headers.addAll(headers);

    return handleApiCall(request);
  }

  @override
  Future getTransactionHistory({required String token}) {
    var headers = {'Authorization': 'Bearer Bearer $token'};
    var request = SimpleApiRequest(
        'GET', Uri.parse(driverDriverTransactionHistoryEndpoint));

    request.headers.addAll(headers);

    return handleApiCall(request);
  }

  @override
  Future getTransactionInsights({required String token}) {
    var headers = {'Authorization': 'Bearer Bearer $token'};
    var request = SimpleApiRequest(
        'GET', Uri.parse(driverDriverTransactionInsightsEndpoint));

    request.headers.addAll(headers);

    return handleApiCall(request);
  }

  @override
  Future requestWithdrawal(
      {required String token,
      required String amount,
      required String transactionPin}) {
    var headers = {'Authorization': 'Bearer Bearer $token'};
    var request =
        MultipartApiRequest('POST', Uri.parse(driverWithdrawalEndpoint));
    final target = {
      'amount': amount,
      'transaction_pin': transactionPin,
    };
    request.fields.addAll(target);
    request.headers.addAll(headers);

    return handleApiCall(request);
  }

  @override
  Future setTransactionPin(
      {required String token,
      required String transactionPin,
      required String transactionPinConfirmation}) {
    var headers = {'Authorization': 'Bearer Bearer $token'};
    var request = MultipartApiRequest(
      'POST',
      Uri.parse(driverSetTransactionPinEndpoint),
    );
    final target = {
      'transaction_pin': transactionPin,
      'transaction_pin_confirmation': transactionPinConfirmation,
    };
    request.fields.addAll(target);
    request.headers.addAll(headers);
    return handleApiCall(request);
  }

  @override
  Future getDashboardData({required String token}) {
    var headers = {'Authorization': 'Bearer Bearer $token'};
    var request = SimpleApiRequest('GET', Uri.parse(driverDashboardEndpoint));

    request.headers.addAll(headers);

    return handleApiCall(request);
  }

  @override
  Future getTrips({required String token, required int page}) {
    var headers = {'Authorization': 'Bearer Bearer $token'};
    var request = SimpleApiRequest(
      'GET',
      Uri(
        // path: driverTripsEndpoint,
        queryParameters: {
          'page': page,
        },
      ),
    );

    request.headers.addAll(headers);

    return handleApiCall(request);
  }
}
