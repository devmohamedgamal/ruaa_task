// Packages
import 'package:dio/dio.dart';
import 'package:ruaa_task/core/constants.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('${AppConstants.baseUrl}$endPoint');
    return response.data;
  }

  
}
