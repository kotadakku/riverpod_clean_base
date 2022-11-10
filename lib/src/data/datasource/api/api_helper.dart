import 'package:dio/dio.dart';
import 'config/api_urls.dart';
import 'interceptors/logging_interceptor.dart';

class ApiProvider{
  Dio _dio(){
    return Dio(
        BaseOptions(
          baseUrl: ApiUrls.baseUrl,
          connectTimeout: 1000,
          receiveTimeout: 1000,
        )
    )
      ..interceptors.add(LoggingInterceptors());
  }
  Future<Response> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options}) async {
    var response =  await _dio().get(
        path,
        queryParameters: queryParameters,
        options: options,
    );
    return response;
  }

  Future<Response> post({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options }) async {
    var response =  await _dio().post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
    );
    return response;
  }

  Future<Response> request({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options}) async {
    var response = await _dio().request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options);
    return response;
  }

  Future<Response> put({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options}) async {
    var response = await _dio().put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options
    );
    return response;
  }
  Future<Response> delete({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options}) async {
    var response = await _dio().delete(
        path,
        queryParameters: queryParameters,
        options: options,
    );
    return response;
  }
}