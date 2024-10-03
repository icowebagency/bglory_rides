// ignore_for_file: constant_identifier_names

class Success {
  int? code;
  Object? response;
  String? message;
  dynamic data;
  Success({
    this.code,
    this.response,
    this.data,
    this.message,
  });
  @override
  String toString() {
    return 'Success{code: $code, response: $response, message: $message, data: $data}';
  }
}

class Failure {
  int? code;
  String? errorResponse;
  Failure({this.code, this.errorResponse});

  @override
  String toString() {
    return 'Failure{code: $code, errorResponse: $errorResponse}';
  }
}

const USER_INVALID_RESPONSE = 101;
const NO_INTERNET = 102;
const INVALID_FORMAT = 103;
const UNKNOWN_ERROR = 104;
const TIME_OUT = 104;
const success_code = 200;
const success_code2 = 201;

const success_codes = [success_code, success_code2];

const TimeOut = 50;

const dynamic serverError = "Internal server error";
const dynamic internetError = "No internet connection";
const dynamic invalidFormat = "Invalid format error";
const dynamic timeoutError = "server time out";
const dynamic error = "Error";
