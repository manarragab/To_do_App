// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:to_do_app/data/models/posts/get_posts/get_alarm.dart';
// import 'package:to_do_app/data/models/posts/get_posts/post_alarm.dart';
// import 'package:to_do_app/data/models/posts/get_posts/response_alarm.dart';
// import 'package:to_do_app/core/Dio_API_services/crud_operation.dart';
// import 'package:to_do_app/features/test_API/controller/presentation/add_todo_screen.dart';


// class TodoController extends GetxController {

//   bool isLoading = false;

//   late TextEditingController titleController;
//   late TextEditingController descController;
//   var isTapped = false.obs;
// bool isEdit = false;


//   @override
//   void onInit() {
//     super.onInit();
//     initControllers();
//     fetchFamily(); 
//   }

//   @override
//   void onClose() {
//     dispose();
//     super.onClose();
//   }

//   void initControllers() {
//     titleController = TextEditingController();
//     descController = TextEditingController();
//   }

//   void disposeControllers() {
//     titleController.dispose();
//     descController.dispose();
//   }

// //get,fetch
//   List<Alarms> alarms = [];
//   Future<void> fetchFamily() async {
//     try {
//       final data = await UserRepo.getAlarm();
//       alarms.assignAll(data.data ?? []);
//       update();
//     } catch (e) {
//       print('GET error: $e');
//     }
//   }


// //add 
// PostAlarm? addAlarmModel;
// Future<void> addAlarm() async {
//   isEdit = false;
//    try{
//      addAlarmModel = PostAlarm(
//       title: titleController.text,
//       description: descController.text,
//       type: "medicine",
//       alarmTime: "03:00",
//       alarmDate: "2025-04-17",
//     );
//     PostAlarmResponse res = await UserRepo.addAlarm(addAlarmModel!);
// alarms.insert(0, res.data!);
//   await fetchFamily();
//     update();
//     Get.back();
//     titleController.clear();
//     descController.clear();
//    }catch(e){
//     print("POST error: $e");
//    }
//   }


// //edit 

// void editAlarmm(Alarms alarm) async {
//   isEdit = true;
//    try{
//         titleController.text = alarm.title ?? "";
//  descController.text = alarm.description ?? "";
//   final result = await Get.to(AddTodoScreen(), arguments: alarm);
//     final response=await UserRepo.updateAlarm(result.id!, result);
// print("Update response: ${response}");
//     int index = alarms.indexWhere((a) => a.id == result.id);
//     if (index != -1) {
//       alarms[index] = result;
//        await fetchFamily();
//       update();
//   }
//    }catch(e){
//     print("Update error: $e");

//    }
// }


// void updateAlarmFromForm() async{
// isEdit = true;
//   final args = Get.arguments;
//  try{
//    final updatedAlarm = Alarms(
//     id: args.id,
//     title: titleController.text,
//     description: descController.text,
//     alarmDate: "2025-07-18",
//     alarmTime:"14:30",
//     type: "medicine",
//     medicineStartDate:"2025-07-20",
//     isRepeatable: 0 
//   );
// print("uuuuuuuuuuuuuuuu ${updatedAlarm.toJson()}"); 
//   Get.back(result: updatedAlarm);
//  }
//  catch(e){
//   print("EDIT error: $e");
//  }
// }




// //delete
//   Future<void> deleteAlarmm(int id) async {
//     try {
//       await UserRepo.deleteData(id);
//       await fetchFamily();
//       update();
//     } catch (e) {
//       print('DELETE error: $e');
//     }}









// //  void deleteAlarm(int index) async {
// //     showDialog(
// //       context: Get.context!,
// //       builder: (context) {
// //         return GetBuilder<TodoController>(builder: (context) {
// //           return AlertDialog(
// //               icon: isLoading == true
// //                   ? Center(child: const CircularProgressIndicator())
// //                   : null,
// //               title: const Text("Delete Confirmation"),
// //               content:
// //                   const Text("Are you sure you want to delete this alarm?"),
// //               actions: [
// //                 TextButton(
// //                     onPressed: isLoading == true
// //                         ? null
// //                         : () {
// //                             Get.back();
// //                           },
// //                     child: const Text("No")),
// //                 TextButton(
// //                     onPressed: isLoading == true
// //                         ? null
// //                         : () async {
// //                             try {
// //                               isLoading = true;
// //                               update();
// //                               await UserRepo.deleteData(alarms[index].id!);

// //                               isLoading = false;
// //                               update();

// //                               Get.back();
// //                               alarms.removeAt(index);
// //                               update();
// //                             } catch (e) {
// //                               print('DELETE error: $e');
// //                             }
// //                           },
// //                     child: const Text("Yes")),
// //               ]);
// //         });
// //       },
// //     );
// //   }

// }
