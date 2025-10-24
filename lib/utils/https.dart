import 'package:community_app/utils/api.dart';
import 'package:community_app/utils/api_exception.dart';
import 'package:community_app/utils/toast.dart';
import 'package:community_app/utils/tokenManager.dart';
import 'package:dio/dio.dart';

class HttpUtils {
  static final HttpUtils _instance=HttpUtils._internal();

  static HttpUtils get of =>_instance;

  factory HttpUtils()=>_instance;


  HttpUtils._internal(){
    _dio.options.baseUrl = Api.baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
    _dio.options.headers = {
      'Content-Type': 'application/json',
    };
    _addInterceptors();
  }


  final _dio = Dio();

  void _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          final token =tokenManager.instance.getToken();
          if(token.isEmpty)  options.headers["Authorization"]='Bearer $token';

          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          response.statusCode! == 200 && response.statusCode! < 300;
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          return handler
              .reject(DioException(requestOptions: error.requestOptions));
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
    if (response.data['code'] == ResultCode.SUCCESS_CODE) {
      return response.data;
    } else {
      ToastUtils.showError(response.data['message']);
      throw Exception('Failed to load data,${response.data['code']}');
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