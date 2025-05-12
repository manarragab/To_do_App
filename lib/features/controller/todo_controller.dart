import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/core/widgets/loading_circle.dart';
import 'package:to_do_app/data/models/post_bmi/post_bmi.dart';
import 'package:to_do_app/data/models/post_bmi/response_bmi.dart';
import 'package:to_do_app/data/models/posts/get_posts/get_alarm.dart';
import 'package:to_do_app/data/models/posts/get_posts/get_posts_MD.dart';
import 'package:to_do_app/data/models/posts/get_posts/post_alarm.dart';
import 'package:to_do_app/data/models/posts/get_posts/response_alarm.dart';
import 'package:to_do_app/features/controller/crud_operation.dart';
import 'package:to_do_app/features/controller/dio_api_services.dart';
import 'package:to_do_app/features/controller/dio_helper.dart';
import 'package:to_do_app/features/presentation/add_todo_screen.dart';
import 'package:to_do_app/features/presentation/todo_list_screen.dart';

// class TodoController extends GetxController{

// TextEditingController titleController=TextEditingController();
// TextEditingController descController=TextEditingController();

// var isTapped=false.obs;


// // List<Alarms> postsList = [];  

// //   Future<void> fetchAlarms() async {
// //     final fetchedPosts = await DioHelper.getList<Alarms>(
// //       endpoint: "/user/family", 
// //       fromJson: (json) => Alarms.fromJson(json),
// //       rootKey: "data"
// //     );

// //     postsList = fetchedPosts; 
// //     update(); 
// //   }



// // List<Posts> postsList = [];

// // Future<void> fetchPosts() async {
// //   final fetchedPosts = await DioHelper.getList<Posts>(
// //     endpoint: "/posts",
// //     fromJson: (json) => Posts.fromJson(json),
// //   );

// //   // If the response is not null, assign it to postsList, otherwise use an empty list
// //   postsList = fetchedPosts .toList()  ?? [];
// //   update();
// // }


// final api = DioApiService(
//   baseUrl: 'https://gorest.co.in/public/v2',
//   token: 'your_token_here',
// );

// // POST
// //await api.post('users', {'name': 'Sara', 'email': 'sara@test.com'});

// // GET
// await api.get('users');

// // PUT
// //await api.put('users/1', {'name': 'Updated Name'});

// // DELETE
// //await api.delete('users/1');





// }


class TodoController extends GetxController{


TextEditingController titleController=TextEditingController();
TextEditingController descController=TextEditingController();
TextEditingController numberController=TextEditingController();

var isTapped=false.obs;

List<Alarms> alarms=[];

Future<void> fetchFamily() async {
    try {
      final data = await UserRepo.fetchData(); 
      alarms.assignAll(data.data??[] );
       update();
    } catch (e) {
      print('GET error: $e');
    } 
   
  }



PostAlarm ala=PostAlarm();
 PostAlarmResponse response=PostAlarmResponse();
Future<void> addAlarm() async{
  try {
     ala =PostAlarm(
      title: titleController.text,
      description: descController.text,
      isRepeatable: true,
medicineStartDate: "2025-05-16",
type: "hh",alarmTime: "03:00",
alarmDate: "2025-04-17",
medicineEndDate: "2025-04-20",

     );
    response =  await UserRepo.addAlarm(ala); 
       Get.to(TodoListScreen());
               update();
     } catch (e) {
      print('POST error: $e');
    } 
   
}


PostBmiMd  postBmi=PostBmiMd ();
ResponseBmi responsee=ResponseBmi();

Future<void> addFamily() async{
  try {
     postBmi = PostBmiMd(
          weight: int.tryParse(numberController.text), height: 175, add_to_profile: true); // Example data
      await UserRepo.addData(postBmi); 
       responsee = await UserRepo.addData(postBmi);
     
        update();
     } catch (e) {
      print('POST error: $e');
    } 
   
}

Alarm alarm=Alarm();
Alarms updatedAlarm = Alarms();

Future<void> updateAlarm() async {
  try {
   fetchFamily();

    updatedAlarm = Alarms(
   
      title: titleController.text,
      description: descController.text,
    );

    update(); 
    Get.to(AddTodoScreen());

  } catch (e) {
    print('UPDATE error: $e');
  }
}



}

