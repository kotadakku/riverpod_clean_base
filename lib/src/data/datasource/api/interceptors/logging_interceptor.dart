import 'package:dio/dio.dart';

class LoggingInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("--> REQUEST ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"" + (options.path)}");
    print("Headers:");
    options.headers.forEach((k, v) => print('$k: $v'));
    print("queryParameters:");
    options.queryParameters.forEach((k, v) => print('$k: $v'));
    if (options.data != null) {
      print("Body: ${options.data}");
    }
    print(
        "--> END REQUEST ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError dioError, ErrorInterceptorHandler handler) async {
    print("<-- ERROR ${dioError.message} ${(dioError.response?.requestOptions != null ?
    dioError.response?.requestOptions.path : 'URL')}");
    print(
        "${dioError.response?.statusCode ?? 'STATUS'} ${dioError.response != null ? dioError.response?.data : 'Unknown Error'}");
    print("<-- END ERROR");
    return handler.next(dioError);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        "<-- RESPONSE ${response.statusCode} ${(response.redirects != null ? response.requestOptions.path : 'URL')}");
    print("Headers:");
    response.headers.forEach((k, v) => print('$k: $v'));
    print("Response: ${response.data}");
    print("<-- END HTTP");
    return super.onResponse(response, handler);
  }
}