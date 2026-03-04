import 'user_model.dart';

class LoginResponse {
  final String accessToken;
  final String refreshToken;
  final bool status;
  final User user;

  LoginResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.status,
    required this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      status: json['status'],
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'status': status,
      'user': user.toJson(),
    };
  }
}