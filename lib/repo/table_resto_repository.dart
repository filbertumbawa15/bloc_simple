import 'package:denice_ti4mb/core/api_client.dart';
import 'package:denice_ti4mb/response/table_resto_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class TableRestoRepository extends ApiClient {
  Future<TableRestoResponse> getAllTableResto() async {
    try {
      final response = await dio.get('table-resto');
      debugPrint('Hasil Response: ${response.data['data']}');
      return TableRestoResponse.fromJson(response.data['data']);
    } on DioError catch (e) {
      throw e.toString();
    }
  }
}
