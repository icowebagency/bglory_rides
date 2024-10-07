class LoginResponse {
  final String status;
  final String message;
  final LoginData data;

  const LoginResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json['status'] as String,
        message: json['message'] as String,
        data: LoginData.fromJson(json['data'] as Map<String, dynamic>),
      );
}

class LoginData {
  final String accessToken;
  final String tokenType;

  const LoginData({
    required this.accessToken,
    required this.tokenType,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        accessToken: json['access_token'] as String,
        tokenType: json['token_type'] as String,
      );
}
