// Packages
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ruaa_task/core/constants.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get(
      {required String endPoint, int page = 1}) async {
    var response =
        await _dio.get('${AppConstants.baseUrl}$endPoint?page=$page',queryParameters: {
          'orderby' : 'created_at'
        });
    log('${AppConstants.baseUrl}$endPoint?page=$page');
    return response.data;
  }

  Future<Map<String, dynamic>> post({required FormData data}) async {
    var response = await _dio.request(
      "${AppConstants.baseUrl}${AppConstants.adsEndpoint}",
      options: Options(
        method: 'POST',
        headers: {
          "Content-Type": "multipart/form-data",
          "Accept": "application/json",
        },
        validateStatus: (status) {
          return status! < 500; // Accept all status codes under 500
        },
      ),
      data: data,
    );
    return response.data;
  }
}
