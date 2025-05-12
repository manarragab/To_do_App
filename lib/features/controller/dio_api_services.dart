import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioApiService {
  final String baseUrl;
  final String? token;

  late Dio _dio;

  DioApiService({required this.baseUrl, this.token}) {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      
      headers: {
        
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
      followRedirects: false,
      
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));

    _dio.interceptors.add(PrettyDioLogger(
  requestHeader: true,
  requestBody: true,
  responseBody: true,
  responseHeader: false,
  error: true,
  compact: true,
  maxWidth: 90,
  
));
    options: Options(
      headers: {
        'Accept': 'application/json', 
      },
    );

  }

  Future<Response> get(String endpoint) async {
    try {
      return await _dio.get(endpoint);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> post(String endpoint, Map<String, dynamic> data) async {
    try {
      return await _dio.post(endpoint, data: data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> put(String endpoint, Map<String, dynamic> data) async {
    try {
      return await _dio.put(endpoint, data: data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> delete(String endpoint) async {
    try {
      return await _dio.delete(endpoint);
    } catch (e) {
      throw _handleError(e);
    }
  }

  String _handleError(dynamic error) {
    if (error is DioException) {
      if (error.response != null) {
        return 'خطأ: ${error.response?.statusCode} - ${error.response?.data}';
      } else {
        return 'فشل الاتصال بالسيرفر: ${error.message}';
      }
    }
    return 'خطأ غير متوقع: $error';
  }

  
}

void printRequestData(Map<String, dynamic> data) {
  data.forEach((key, value) {
    print('$key: $value');
  });
}
