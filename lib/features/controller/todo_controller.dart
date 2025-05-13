/* <<<<<<<<<<<<<<  ✨ Windsurf Command 🌟 >>>>>>>>>>>>>>>> */
/// A controller for managing alarms.
///
/// This class provides methods for fetching alarms, adding a new alarm,
/// editing an existing alarm, and deleting an alarm.
///
/// The [alarms] list is observable and is updated when the data is fetched
/// successfully.
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

class TodoController extends GetxController {
  /// Whether the loading animation is visible.
  ///
  /// This variable is used to show or hide the loading animation when fetching
  /// data.
  bool isLoading = false;

  /// A list of alarms.
  ///
  /// This list is observable and is updated when the data is fetched successfully.
  @override
  void onInit() {
    super.onInit();
    fetchFamily(); // call only once when controller is initialized
  }

  TextEditingController numberController = TextEditingController();

  List<Alarms> alarms = [];

  /// A [TextEditingController] for a text field to input the alarm title.
  ///
  /// This controller is used to pre-fill the title of the alarm when editing.
  final titleController = TextEditingController();

  /// A [TextEditingController] for a text field to input the alarm description.
  ///
  /// This controller is used to pre-fill the description of the alarm when editing.
  final descController = TextEditingController();

  /// Fetches the list of alarms.
  ///
  /// This method calls [UserRepo.fetchData] and assigns the result to [alarms].
  Future<void> fetchFamily() async {
    try {
      final data = await UserRepo.fetchData();
      alarms.assignAll(data.data ?? []);
      update();
    } catch (e) {
      print('GET error: $e');
    }
  }

  /// Adds a new alarm.
  ///
  /// This method calls [UserRepo.addData] and adds the new alarm to the top of
  /// the [alarms] list.
  List<PostAlarm> postAlarms = [];

  PostAlarmResponse response = PostAlarmResponse();

  PostBmiMd postBmi = PostBmiMd();
  ResponseBmi responsee = ResponseBmi();

  Future<void> addFamily() async {
    try {
      // final postBmi = PostBmiMd(
      // postBmi = PostBmiMd(
      //     weight: int.tryParse(numberController.text),
      //     height: 175,
      //     add_to_profile: true); // Example data
      // await UserRepo.addData(postBmi);
      // responsee = await UserRepo.addData(postBmi);

      update();
    } catch (e) {
      print('POST error: $e');
    }
  }

  /// Edits an alarm.
  Alarm alarm = Alarm();
  Alarms updatedAlarm = Alarms();

  /// Edit an alarm
  ///
  /// This method navigates to [AddTodoScreen] with the alarm at [index] as an
  /// argument. When the screen is popped, the alarm at [index] is updated with
  /// the returned value.
  /// This function navigates to [AddTodoScreen] with the alarm at [index] as
  /// an argument. When the screen is popped, the alarm at [index] is updated
  /// with the returned value.
  ///
  /// [index] is the index of the alarm to edit in the [alarms] list.
  void editAlarm(int index) async {
    Alarms arg = await Get.to(AddTodoScreen(), arguments: alarms[index]);
    alarms[index] = arg;
    update();
  }

  /// Deletes an alarm.
  /// Shows a confirmation dialog to delete an alarm at [index].
  ///
  /// This method shows a confirmation dialog to delete an alarm at [index].
  /// When the "Yes" button is pressed, it deletes the alarm using
  /// [UserRepo.deleteData] and removes the alarm from the [alarms] list.
  ///
  /// [index] is the index of the alarm to delete in the [alarms] list.
  void deleteAlarm(int index) async {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return GetBuilder<TodoController>(builder: (context) {
          return AlertDialog(
              icon: isLoading == true
                  ? Center(child: const CircularProgressIndicator())
                  : null,
              title: const Text("Delete Confirmation"),
              content:
                  const Text("Are you sure you want to delete this alarm?"),
              actions: [
                TextButton(
                    onPressed: isLoading == true
                        ? null
                        : () {
                            Get.back();
                          },
                    child: const Text("No")),
                TextButton(
                    onPressed: isLoading == true
                        ? null
                        : () async {
                            try {
                              // Start loading state
                              isLoading = true;
                              update();

                              // Perform delete operation
                              await UserRepo.deleteData(alarms[index].id!);

                              // End loading state
                              isLoading = false;
                              update();

                              // Close the dialog
                              Get.back();

                              // Remove the alarm from the list
                              alarms.removeAt(index);
                              update();
                            } catch (e) {
                              print('DELETE error: $e');
                            }
                          },
                    child: const Text("Yes")),
              ]);
        });
      },
    );
  }

  /// Navigates to the AddTodoScreen and adds a new alarm if data is returned.
  ///
  /// When navigating back from the [AddTodoScreen], if the returned data is of
  /// type [PostAlarmResponse], the new alarm is added to the top of the [alarms]
  /// list and the UI is updated.
  /// type [PostAlarmResponse], the new alarm is added to the top of the [alarms] list
  /// and the UI is updated.
  void goToAddScreen() async {
    var data = await Get.to(
      AddTodoScreen(),
    );
    if (data is PostAlarmResponse) {
      alarms.insert(0, data.data!);
      update();
    }
  }
/*
  Future<void> updateAlarm(Alarms alarmToEdit, id) async {
    try {
      // Pre-fill fields for editing (optional)
      titleController.text = alarmToEdit.title ?? "";
      descController.text = alarmToEdit.description ?? "";

      Alarms updated = Alarms(
        id: id,
        title: titleController.text,
        description: descController.text,
        alarmDate: alarmToEdit.alarmDate,
        alarmTime: alarmToEdit.alarmTime,
        type: alarmToEdit.type,
      );

      await UserRepo.updateData(id, updated);
      await fetchFamily();
      update();

      Get.to(AddTodoScreen()); // or Get.back()
    } catch (e) {
      print('UPDATE error: $e');
    }
  }

  Future<void> deleteAlarm(int id) async {
    try {
      await UserRepo.deleteData(id);
      await fetchFamily();
      update();
    } catch (e) {
      print('DELETE error: $e');
    }
  }*/ //TODO: reuse this function
}

/* <<<<<<<<<<  49345964-5529-4561-977b-7f9c50468edb  >>>>>>>>>>> */