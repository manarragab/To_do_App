import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// class DioApiService {
//   final String baseUrl;
//    String? token;

//   late Dio _dio;

//   DioApiService({required this.baseUrl, this.token})  {
//     _dio = Dio(BaseOptions(
//       baseUrl: baseUrl,
//       headers:  {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json', 
//         if (token != null) 'Authorization': 'Bearer $token',
//       },

//       followRedirects: false,
//       validateStatus: (status) => status != null && status < 500,
//       connectTimeout: const Duration(seconds: 10),
//       receiveTimeout: const Duration(seconds: 10),
//     ));

//     _dio.interceptors.add(PrettyDioLogger(
//       requestHeader: true,
//       requestBody: true,
//       responseBody: true,
//       responseHeader: false,
//       error: true,
//       compact: true,
//       maxWidth: 90,
//     ));
//   }


// static final storage = FlutterSecureStorage();

// static Future<String?> getToken() async {
//   return await storage.read(key: 'access_token');
// }

// static Future<void> deleteToken() async {
//   await storage.delete(key: 'access_token');
// }



//   Future<Response> register(String endpoint, Map<String, dynamic> data) async {
//     try {
//       return await _dio.post(endpoint, data: data);
//     } catch (e) {
//       throw _handleError(e);
//     }
//   }


// Future<Response> login(String endpoint, Map<String, dynamic> data) async {
//   try {
//     final response = await _dio.post(endpoint, data: data);
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       token = response.data['access_token'];
//       await storage.write(key: 'access_token', value: token);
//     String? readToken=  await storage.read(key: 'access_token');
// print("jjjjjjjjjjjjjjj $readToken");
//       _dio.options.headers['Authorization'] = 'Bearer $token';
//     }
//     return response;
//   } catch (e) {
//     throw _handleError(e);
//   }
// }



// Future<void> logout(String endpoint , String tokenn) async {
//   try {
//     await _dio.post(endpoint, data: tokenn);
//   } catch (e) {
//       throw _handleError(e);
//   }
// //token = null;
// await deleteToken();
//   _dio.options.headers.remove('Authorization');
// }



//   Future<Response> get(String endpoint) async {
//     try {
//       return await _dio.get(endpoint);
//     } catch (e) {
//       throw _handleError(e);
//     }
//   }

//   Future<Response> post(String endpoint, Map<String, dynamic> data) async {
//     try {
//       return await _dio.post(endpoint, data: data);
//     } catch (e) {
//       throw _handleError(e);
//     }
//   }

//   Future<Response> put(String endpoint, Map<String, dynamic> data) async {
//     try {
//       return await _dio.put(endpoint, data: data);
//     } catch (e) {
//       throw _handleError(e);
//     }
//   }

//   Future<Response> delete(String endpoint) async {
//     try {
//       return await _dio.delete(endpoint);
//     } catch (e) {
//       throw _handleError(e);
//     }
//   }

//   String _handleError(dynamic error) {
//     if (error is DioException) {
//       if (error.response != null) {
//         return 'خطأ: ${error.response?.statusCode} - ${error.response?.data}';
//       } else {
//         return 'Server connect error: ${error.message}';
//       }
//     }
//     return 'Un expecetd error : $error';
//   }
// }
 

 class DioApiService {
  final String baseUrl;
  String? token;
  late Dio _dio;

  static final storage = FlutterSecureStorage();

  DioApiService({required this.baseUrl});


  Future<void> init() async {
    token = await storage.read(key: 'access_token');

    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
      followRedirects: false,
      validateStatus: (status) => status != null && status < 500,
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
  }

  Dio get dio => _dio;

  static Future<String?> getToken() async {
    return await storage.read(key: 'access_token');
  }

  static Future<void> deleteToken() async {
    await storage.delete(key: 'access_token');
  }

  Future<Response> register(String endpoint, Map<String, dynamic> data) async {
    try {
      return await _dio.post(endpoint, data: data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> login(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        token = response.data['access_token'];
        await storage.write(key: 'access_token', value: token);
        print("تم حفظ التوكن: $token");

        _dio.options.headers['Authorization'] = 'Bearer $token';
      }
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> logout(String endpoint, String tokenn) async {
    try {
      await _dio.post(endpoint, data: tokenn);
    } catch (e) {
      throw _handleError(e);
    }

    await deleteToken();
    _dio.options.headers.remove('Authorization');
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
        return 'تعذر الاتصال بالسيرفر: ${error.message}';
      }
    }
    return 'حدث خطأ غير متوقع: $error';
  }
}