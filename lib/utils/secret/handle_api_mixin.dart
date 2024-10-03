import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'api_constants.dart';
import 'api_request.dart';

mixin HandleApi {
  final _timeout = 30;
  Future<Object> handleApiCall(ApiRequest request) async {
    try {
      http.StreamedResponse response = await request.send().timeout(
            Duration(seconds: _timeout),
          );
      final responseData = await response.stream.bytesToString();
      log(responseData);

      if (success_codes.contains(response.statusCode)) {
        return Success(
          data: jsonDecode(responseData),
        );
      } else {
        final error = jsonDecode(responseData);
        return Failure(
          errorResponse: error['message'],
        );
      }
    } on HttpException {
      log('HttpException');

      return Failure(code: NO_INTERNET, errorResponse: serverError);
    } on FormatException {
      log('FormatException');

      return Failure(code: USER_INVALID_RESPONSE, errorResponse: invalidFormat);
    } on SocketException {
      log('SocketException');

      return Failure(code: USER_INVALID_RESPONSE, errorResponse: internetError);
    } on TimeoutException {
      log('TimeoutException');

      return Failure(code: TIME_OUT, errorResponse: timeoutError);
    } catch (e) {
      log('$e');

      return Failure(code: UNKNOWN_ERROR, errorResponse: e.toString());
    }
  }
}
