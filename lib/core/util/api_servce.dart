import 'package:dio/dio.dart';
import 'package:weather/core/constant/strings.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get(String endpoint) async {
    var response = await _dio.get('$baseurl$endpoint');

    print(response.data);
    return response.data;
  }
}
