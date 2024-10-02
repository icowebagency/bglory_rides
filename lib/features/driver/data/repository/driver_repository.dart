import 'package:bglory_rides/features/driver/data/api/driver_api_client.dart';
import 'package:bglory_rides/features/driver/data/model/driver_dashboard/driver_dashboard_data.dart';
import 'package:bglory_rides/features/driver/data/model/driver_data/driver_data.dart';
import 'package:bglory_rides/features/driver/data/model/driver_response/driver_response.dart';
import 'package:bglory_rides/features/driver/data/model/login_response.dart';
import 'package:bglory_rides/features/driver/data/model/transaction_insights/transaction_insights.dart';
import 'package:bglory_rides/features/driver/data/model/trip/trip.dart';

import '../../../../utils/secret/api_constants.dart';

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

  Future getDriverEarnings();

  Future setTransactionPin(
      {required String transactionPin,
      required String transactionPinConfirmation});

  Future requestWithdrawal(
      {required String amount, required String transactionPin});

  Future getTransactionHistory();

  Future getTransactionInsights();

  Future getDriverDashboardData();

  Future getTrips({required int page});
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
  Future<Object> verifyOtp({
    required Map<String, String> target,
    required String otp,
  }) async {
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

  @override
  Future<Object> getDriverEarnings() async {
    final result = await _apiClientContract.getDriverEarnings(token: token!);

    if (result is Success) {
      return Success(
        data: DriverResponse.fromJson(
          result.data['data'],
        ),
      );
    } else {
      return result as Failure;
    }
  }

  @override
  Future<Object> getTransactionHistory() async {
    final result =
        await _apiClientContract.getTransactionHistory(token: token!);

    if (result is Success) {
      return result;
    } else {
      return result as Failure;
    }
  }

  @override
  Future<Object> getTransactionInsights() async {
    final result =
        await _apiClientContract.getTransactionInsights(token: token!);

    if (result is Success) {
      return Success(
        data: TransactionInsights.fromJson(result.data['data'][0]),
      );
    } else {
      return result as Failure;
    }
  }

  @override
  Future<Object> requestWithdrawal({
    required String amount,
    required String transactionPin,
  }) async {
    final result = await _apiClientContract.requestWithdrawal(
        token: token!, amount: amount, transactionPin: transactionPin);

    if (result is Success) {
      return result;
    } else {
      return result as Failure;
    }
  }

  @override
  Future<Object> setTransactionPin({
    required String transactionPin,
    required String transactionPinConfirmation,
  }) async {
    final result = await _apiClientContract.setTransactionPin(
      token: token!,
      transactionPin: transactionPin,
      transactionPinConfirmation: transactionPinConfirmation,
    );

    if (result is Success) {
      return Success(
        data: result.data['transactions'],
      );
    } else {
      return result as Failure;
    }
  }

  @override
  Future getDriverDashboardData() async {
    final result = await _apiClientContract.getDashboardData(token: token!);

    if (result is Success) {
      final data = result.data['data'];

      return Success(
        data: DriverDashboardData.fromJson(data),
      );
    } else {
      return result as Failure;
    }
  }

  @override
  Future getTrips({required int page}) async {
    final result = await _apiClientContract.getTrips(token: token!, page: page);

    if (result is Success) {
      final jsonDataList = result.data['data']['data'] as List;

      return Success(
        data: jsonDataList.map((data) => Trip.fromJson(data)).toList(),
      );
    } else {
      return result as Failure;
    }
  }
}
