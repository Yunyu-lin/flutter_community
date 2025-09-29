import 'package:community_app/utils/api.dart';
import 'package:dio/dio.dart';

class HttpUtils {
  final _dio = Dio();
  HttpUtils() {
    _dio.options.baseUrl = Api.baseUrl;
    _dio.options.connectTimeout = Duration(seconds: 10);
    _dio.options.receiveTimeout = Duration(seconds: 10);
    _dio.options.headers = {
      'Content-Type': 'application/json',
    };
    _addInterceptors();
  }

  void _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          return handler.next(error);
        },
      ),
    );
  }

  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response =
          await _dio.get(path, queryParameters: queryParameters);
      return _handelResponse(response);
    } catch (e) {
      return _handelError(e);
    }
  }

  Future<dynamic> post(String path, {Map<String, dynamic>? data}) async {
    try {
      Response response = await _dio.post(path, data: data);
      return _handelResponse(response);
    } catch (e) {
      return _handelError(e);
    }
  }

  Future<dynamic> put(String path, {Map<String, dynamic>? data}) async {
    try {
      Response response = await _dio.put(path, data: data);
      return _handelResponse(response);
    } catch (e) {
      return _handelError(e);
    }
  }

  Future<dynamic> delete(String path, {Map<String, dynamic>? data}) async {
    try {
      Response response = await _dio.delete(path, data: data);
      return _handelResponse(response);
    } catch (e) {
      return _handelError(e);
    }
  }

  dynamic _handelResponse(Response response) {
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to load data,${response.statusCode}');
    }
  }

  dynamic _handelError(e) {
    if (e is DioException) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Connection timeout');
      } else if (e.type == DioExceptionType.badResponse) {
        throw Exception('Response error,${e.response?.statusCode}');
      } else if (e.type == DioExceptionType.cancel) {
        throw Exception('Request canceled');
      } else {
        throw Exception('Unknown error,${e.message}');
      }
    } else {
      throw Exception('Unknown error,$e');
    }
  }
}

final httpUtils = HttpUtils();
