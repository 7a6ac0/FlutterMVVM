import 'package:dio/dio.dart';
import 'package:flutter_mvvm/data/base/logging_Interceptors.dart';

class BaseDio {
  BaseDio._();

  static BaseDio? _instance;

  Dio? _dio;

  static BaseDio getInstance() {
    _instance ??= BaseDio._();

    return _instance!;
  }

  Dio getDio() {
    _dio ??= Dio()
                ..options = BaseOptions(receiveTimeout: 1000 * 60, connectTimeout: 1000 * 60)
                ..interceptors.add(LoggingInterceptors());
    return _dio!;
  }
}