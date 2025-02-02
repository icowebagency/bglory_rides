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
          message: error['message'],
        );
      }
    } on HttpException {
      log('HttpException');

      return Failure(code: NO_INTERNET, message: serverError);
    } on FormatException catch(e) {
      log('FormatException $e');

      return Failure(code: USER_INVALID_RESPONSE, message: invalidFormat);
    } on SocketException {
      log('SocketException');

      return Failure(code: USER_INVALID_RESPONSE, message: internetError);
    } on TimeoutException {
      log('TimeoutException');

      return Failure(code: TIME_OUT, message: timeoutError);
    } catch (e) {
      log('$e');

      return Failure(code: UNKNOWN_ERROR, message: e.toString());
    }
  }
}
