
import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio;

  ApiServices(this._dio);
  Future<List<dynamic>> get({required String url}) async {
    var res = await _dio.get("$url");
    return res.data;
  }
}