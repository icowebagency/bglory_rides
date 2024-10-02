import 'package:http/http.dart' as http;

abstract class ApiRequest {
  String get method;
  Uri get url;
  Map<String, String> get headers;
  Future<http.StreamedResponse> send();
}

class MultipartApiRequest extends http.MultipartRequest implements ApiRequest {
  MultipartApiRequest(String method, Uri url) : super(method, url);
}

class SimpleApiRequest extends http.Request implements ApiRequest {
  SimpleApiRequest(String method, Uri url) : super(method, url);
}
