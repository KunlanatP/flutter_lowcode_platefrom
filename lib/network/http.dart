import 'package:dio/dio.dart';
import 'package:flutter_lowcode_plateform/environment.dart';

class ResponseInterceptors extends Interceptor {}

class HttpClient {
  HttpClient._private();
  static final _dio = Dio(BaseOptions(baseUrl: Env.backendURL));
  static Dio get dio {
    _dio.interceptors.add(ResponseInterceptors());
    return _dio;
  }
}

class Https {
  Https._();
  static Dio getInstance() {
    return Dio(BaseOptions(baseUrl: Env.backendURL));
  }
}
