import 'package:to_do_app/data/models/post_bmi/post_bmi.dart';
import 'package:to_do_app/data/models/post_bmi/response_bmi.dart';
import 'package:to_do_app/data/models/posts/get_posts/get_alarm.dart';
import 'package:to_do_app/data/models/posts/get_posts/get_posts_MD.dart';
import 'package:to_do_app/data/models/posts/get_posts/post_alarm.dart';
import 'package:to_do_app/data/models/posts/get_posts/response_alarm.dart';
import 'package:to_do_app/features/controller/dio_api_services.dart';

class UserRepo {
  // Static instance (initialized once)
  static final DioApiService _api = DioApiService(
    // baseUrl: 'https://gorest.co.in/public/v2',

    baseUrl: "https://family-health.za3bot.com/api",
    token: "71|9zTu3v0FnORpc5k66DftXpPD2Ji78d9BgL6HfmWvcf3feeee",
  );

//data list->map
  // static Future<List<Posts>> fetchPosts() async {
  //   final response = await _api.get('/user/family');
  //   final List<dynamic> data = response.data;
  //   return data.map((json) => Posts.fromJson(json)).toList();
  // }

//data map->list->map
  static Future<Alarm> fetchData() async {
    final response = await _api.get('/user/alarms');
    return Alarm.fromJson(response.data);
  }

  static Future<ResponseBmi> addData(PostBmiMd bmi) async {
    final response = await _api.post('/user/bmi-calculator', bmi.toJson());
    final responseData = ResponseBmi.fromJson(response.data);
    print("response:-  ${response.data}");
    return responseData;
  }

  static Future<PostAlarmResponse> addAlarm(PostAlarm alarm) async {
    final response = await _api.post(
        '/user/alarms', alarm.toJson()); //this is done correctly as it print
    final responseData = PostAlarmResponse.fromJson(response.data);
    print("response:-  ${response.data}");
    return responseData;
  }

  static Future<Map> updateData(int id, Alarms post) async {
    return (await _api.put('/user/alarms/$id', post.toJson())).data;
  }

  static Future<void> deleteData(int id) async {
    await _api.delete('/user/alarms/$id');
  }
}


