import 'package:denice_ti4mb/core/api_client.dart';
import 'package:denice_ti4mb/params/register_user_params.dart';
import 'package:denice_ti4mb/response/register_user_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AuthRepository extends ApiClient {
  Future<RegisterUserResponse> registerWaitress(RegisterUserParam param) async {
    try {
      
      final response = await dio.post('v1/register', data: param.toJson());
      debugPrint("POST Register: ${response.data}");
      return RegisterUserResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}
