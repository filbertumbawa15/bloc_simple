import '../models/user_models.dart';

class RegisterUserResponse {
  final UserModel? userModel;
  final String message;

  RegisterUserResponse({required this.userModel, required this.message});

  factory RegisterUserResponse.fromJson(Map<String, dynamic> json) {
    UserModel? userModel;
    return RegisterUserResponse(
      userModel:
          json['data'] != null ? UserModel.fromJson(json['data']) : userModel,
      message: json['message'],
    );
  }
}
