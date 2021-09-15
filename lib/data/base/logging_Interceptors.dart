

import 'dart:developer';

import 'package:dio/dio.dart';

class LoggingInterceptors extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log(
        "--> ${options.method.toUpperCase()} ${options.baseUrl + options.path}");
    log("Headers:");
    options.headers.forEach((k, v) => log('$k: $v'));
    log("queryParameters:");
    options.queryParameters.forEach((k, v) => log('$k: $v'));
    if (options.data != null) {
      log("Body: ${options.data}");
    }
    log(
        "--> END ${options.method.toUpperCase()}");

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError dioError, ErrorInterceptorHandler handler) {
    log(
        "<-- ${dioError.message} ${dioError.response?.requestOptions.baseUrl}${dioError.response?.requestOptions.path}");
    log(
        "${dioError.response != null ? dioError.response?.data : 'Unknown Error'}");
    log("<-- End error");

    return super.onError(dioError, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log(
        "<-- ${response.statusCode} ${response.requestOptions.baseUrl}${response.requestOptions.path}");
    log("Headers:");
    response.headers.forEach((k, v) => log('$k: $v'));
    log("Response: ${response.data}");
    log("<-- END HTTP");

    return super.onResponse(response, handler);
  }
}
