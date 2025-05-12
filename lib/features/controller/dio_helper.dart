//  import 'package:dio/dio.dart';

// // class DioHelper {
// //   static final Dio _dio = Dio(
// //     BaseOptions(
// //      // baseUrl: "https://gorest.co.in/public/v2",
// //      baseUrl: "https://family-health.za3bot.com/api",
// //       connectTimeout: Duration(seconds: 5000),  // Timeout for connection
// //       receiveTimeout: Duration(seconds: 5000),  // Timeout for response
// //     ),
// //   );


// // // DioHelper.dart
// // static Future<T?> getObject<T>({
// //   required String endpoint,
// //   required T Function(Map<String, dynamic>) fromJson,
// // }) async {
// //   try {
// //     final response = await _dio.get(endpoint);
// //     print("Response Data: ${response.data}");

// //     if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
// //       return fromJson(response.data);
// //     } else {
// //       throw Exception("Failed to load data. Status code: ${response.statusCode}");
// //     }
// //   } catch (e) {
// //     print("Unexpected error: $e");
// //     return null;
// //   }
// // }



//  String token="71|9zTu3v0FnORpc5k66DftXpPD2Ji78d9BgL6HfmWvcf3feeee";

// // //String token="";
// // class DioHelper {

// //   static final Dio _dio = Dio(
// //     BaseOptions(
// //      baseUrl: "https://family-health.za3bot.com/api",
// //    // baseUrl: "https://gorest.co.in/public/v2",
// //       connectTimeout: Duration(seconds: 5),
// //       receiveTimeout: Duration(seconds: 5),
// //        headers: {
// //       'Accept': 'application/json',
// //        'Authorization': 'Bearer $token', // Uncomment if needed
// //     },
// //     ),
// //   );


// //   static Future<List<T>> getList<T>({
// //     required String endpoint,
// //     required T Function(Map<String, dynamic>) fromJson,
// //   }) async {
// //     try {
// //       final response = await _dio.get(endpoint);
// //       print("Response Data: ${response.data}");

// //       if (response.statusCode == 200) {
// //         List data = response.data;
// //         return data.map((e) => fromJson(e)).toList();
// //       } else {
// //         throw Exception("Failed to load data. Status code: ${response.statusCode}");
// //       }
// //     } catch (e) {
// //       print("Unexpected error: $e");
// //       return [];
// //     }
// //   }

// // } 

// class DioHelper {
//   static final Dio _dio = Dio(
//     BaseOptions(
//    //   baseUrl: "https://family-health.za3bot.com/api", // Update with your correct base URL
//     baseUrl: "https://gorest.co.in/public/v2", 
//       connectTimeout: Duration(seconds: 5),
//       receiveTimeout: Duration(seconds: 5),
//       headers: {
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $token', // Authorization header with dynamic token
//       },
//     ),
//   );

//   // Generic method to fetch a list of items
//    static Future<List<T>> getList<T>({
//     required String endpoint,
//     required T Function(Map<String, dynamic>) fromJson,
//     String? rootKey, // e.g., 'data' if response has { data: [...] }
//   }) async {
//     try {
//       final response = await _dio.get(endpoint);
//       print("Response Data: ${response.data}");

//       if (response.statusCode == 200) {
//         dynamic json = response.data;

//         // Use rootKey if needed (e.g., response["data"])
//         if (rootKey != null && json is Map<String, dynamic>) {
//           json = json[rootKey];
//         }

//         if (json is List) {
//           // If the response is a list, map it directly
//           return json.map((e) => fromJson(e)).toList();
//         } else if (json is Map<String, dynamic>) {
//           // If it's a Map, handle it accordingly (e.g., a wrapped list)
//           // Depending on the structure, this may need adjustment (e.g., json['data'])
//           return [fromJson(json)];
//         } else {
//           throw Exception("Unexpected response format.");
//         }
//       } else {
//         throw Exception("Failed to load data. Status code: ${response.statusCode}");
//       }
//     } catch (e) {
//       print("Unexpected error: $e");
//       return [];
//     }
//   }
// }



// // String token="71|9zTu3v0FnORpc5k66DftXpPD2Ji78d9BgL6HfmWvcf3feeee";
// // //String token="";
// // class DioHelper {
// //   static final Dio _dio = Dio(
// //     BaseOptions(
// //     //  baseUrl: "https://family-health.za3bot.com/api",
// //     baseUrl: "https://gorest.co.in/public/v2",
// //       connectTimeout: Duration(seconds: 5),
// //       receiveTimeout: Duration(seconds: 5),
// //        headers: {
// //       'Accept': 'application/json',
// //       // 'Authorization': 'Bearer $token', // Uncomment if needed
// //     },
// //     ),
// //   );

//   /// One reusable function for both object and list responses
//   // static Future<T?> fetch<T>({
//   //   required String endpoint,
//   //   required T Function(dynamic json) fromJson,
//   //   String? rootKey, // e.g. 'data' if response has { data: [...] }
//   // }) async {
//   //   try {
//   //     final response = await _dio.get(endpoint);
//   //     print("Response Data: ${response.data}");

//   //     dynamic json = response.data;

//   //     // Use rootKey if needed (e.g. response["data"])
//   //     if (rootKey != null && json is Map<String, dynamic>) {
//   //       json = json[rootKey];
//   //     }

//   //     if (json is List) {
//   //       // Convert list of maps to list of objects
//   //       return json.map((e) => fromJson(e)).toList() as T;
//   //     } else {
//   //       // Convert single map to object
//   //       return fromJson(json) as T;
//   //     }
//   //   } catch (e) {
//   //     print("Fetch error: $e");
//   //     return null;
//   //   }
//   // }
// // static Future<T?> fetch<T>({
// //   required String endpoint,
// //   required T Function(dynamic json) fromJson,
// //   String? rootKey, // e.g. 'data' if response has { data: [...] }
// // }) async {
// //   try {
// //     final response = await _dio.get(endpoint);
// //     print("Response Data: ${response.data}");

// //     dynamic json = response.data;

// //     // Use rootKey if needed (e.g. response["data"])
// //     if (rootKey != null && json is Map<String, dynamic>) {
// //       json = json[rootKey];
// //     }

// //     // If the response is a List, map it to a List of objects
// //     if (json is List) {
// //       return json.map((e) => fromJson(e)).toList() as T;
// //     }
// //     // If the response is a Map, map it to a single object
// //     else if (json is Map<String, dynamic>) {
// //       return fromJson(json) as T;
// //     }
// //     // If the response is neither List nor Map, throw an error
// //     else {
// //       throw Exception("Unsupported response type: ${json.runtimeType}");
// //     }
// //   } catch (e) {
// //     print("Fetch error: $e");
// //     return null;
// //   }
// // }



