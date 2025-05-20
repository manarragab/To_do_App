import 'package:to_do_app/data/models/auth/Login/post_login.dart';
import 'package:to_do_app/data/models/auth/Login/response_post_login.dart';
import 'package:to_do_app/data/models/auth/Register/post_register.dart';
import 'package:to_do_app/data/models/auth/Register/response_post_register.dart';
import 'package:to_do_app/data/models/tasks/get_tasks/get_task.dart';
import 'package:to_do_app/data/models/tasks/post_task/post_task.dart';
import 'package:to_do_app/data/models/tasks/post_task/response_post_task.dart';
import 'package:to_do_app/data/models/posts/get_posts/get_alarm.dart';
import 'package:to_do_app/data/models/posts/get_posts/post_alarm.dart';
import 'package:to_do_app/data/models/posts/get_posts/response_alarm.dart';
import 'package:to_do_app/core/Dio_API_services/dio_api_services.dart';

class UserRepo {
  static final DioApiService _api = DioApiService(
    baseUrl: "https://todo.iraqsapp.com",
  );

  // auth
  static Future<ResponsePostRegister> register(PostRegister register) async {
    final response = await _api.register('/auth/register', register.toJson());
    print("Register response: ${response.data}");

    return ResponsePostRegister(
      statusCode: response.statusCode,
      message: response.data?['message'],
      error: response.data?['error'],
    );
  }

  static Future<ResponsePostLogin> login(PostLogin login) async {
    final response = await _api.login('/auth/login', login.toJson());
    print("Login response: ${response.data}");
    return ResponsePostLogin.fromJson(response.data);
  }

  static Future<void>  logout() async {
    await _api.logout('/auth/logout');
    print("Logout successful");
  }
  
  // Tasks

  static Future<Tasks> addTask(PostTask task) async {
    final response = await _api.post('/todos', task.toJson());
    return Tasks.fromJson(response.data);
  }

  static Future<List<Tasks>> getTask() async {
    final response = await _api.get('/todos');
    print("response:-  ${response.data}");

    if (response.statusCode == 200 && response.data is List) {
      final data = response.data as List;
      return data.map((json) => Tasks.fromJson(json)).toList();
    } else {
      print("Error: ${response.data}");
      return [];
    }
  }

static Future<dynamic> updateTask(String id, Tasks task) async {
    return await _api.put('/todos/$id', task.toJson());
  }

  static Future<void> deleteTask(String id) async {
    await _api.delete('/todos/$id');
  }






  // Alarms
  static Future<Alarm> getAlarm() async {
    final response = await _api.get('/user/alarms');
    return Alarm.fromJson(response.data);
  }

  static Future<PostAlarmResponse> addAlarm(PostAlarm alarm) async {
    final response = await _api.post('/user/alarms', alarm.toJson());
    final responseData = PostAlarmResponse.fromJson(response.data);
    print("response:-  ${response.data}");
    return responseData;
  }

  static Future<dynamic> updateAlarm(int id, Alarms alarm) async {
    return await _api.put('/user/alarms/$id', alarm.toJson());
  }

  static Future<void> deleteData(int id) async {
    await _api.delete('/user/alarms/$id');
  }
}

