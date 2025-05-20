import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:to_do_app/core/Dio_API_services/crud_operation.dart';
import 'package:to_do_app/data/models/tasks/get_tasks/get_task.dart';
import 'package:to_do_app/data/models/tasks/post_task/post_task.dart';
import 'package:to_do_app/data/models/tasks/post_task/response_post_task.dart';
import 'package:to_do_app/features/CRUDoperations/presentation/add_task_screen.dart';
import 'package:to_do_app/features/home/presentation/home_screen.dart';


class CrudController extends GetxController {

  final dateController = TextEditingController();
  final dropDownController = TextEditingController();
  final dropDownController2 = TextEditingController();
  final titleController = TextEditingController();
  final dateController2 = TextEditingController();
  final descController = TextEditingController();

  var isLoading = false.obs;
  Rx<File?> selectedImage = Rx<File?>(null);
  String? image;
   bool isEdit=false;
 ResponsePostTask? res ;
//get
  List<Tasks> tasks = [];
  Future<void> fetchTasks() async {
    try {
      final data = await UserRepo.getTask();
      tasks.assignAll(data );
      print("responseeeeeeeeeeeeeee:-  ${data}");
      update();
    } catch (e) {
      print('GET error: $e');
    }
  }


PostTask? postTask;
Future<void> addTask() async {
 
  isEdit = false;
   try{
     postTask = PostTask(
      title: titleController.text,
      desc: descController.text,
      priority: dropDownController2.text,
      dueDate: dateController2.text,
      image: selectedImage.value!.path ??"",
    );
  Tasks   res = await UserRepo.addTask(postTask!);
tasks.insert(0, res);
  await fetchTasks();
    update();
     Get.back();
    titleController.clear();
    descController.clear();
    dateController2.clear();
    dropDownController2.clear();
     selectedImage.value = null;
   
   }

catch(e){
    print("POST error: $e");
   }
  }



void updateTask(Tasks task , String id) async {
  isEdit = true;
   try{
        titleController.text = task.title ?? "";
 descController.text = task.desc ?? "";
 dateController2.text=task.createdAt ?? "";
dropDownController2.text=task.priority ?? "";
image=task.image ?? "";


  final result = await Get.to(AddTaskScreen(), arguments: [task, id]);
    final response=await UserRepo.updateTask(id , result);
print("Update response: ${response}");
    int index = tasks.indexWhere((a) => a.id == id);
    if (index != -1) {
      tasks[index] = result;
       await fetchTasks();
      update();
  }
   }catch(e){
    print("Update error: $e");

   }
}


void updatetaskFromForm() async{
isEdit = true;
  final args = Get.arguments;
 try{
   final updatedtask = Tasks(
    id: args[1],
    title:  args[0].title,
    desc: descController.text,
    priority: dropDownController2.text,
    createdAt: dateController2.text.substring(0, 10) ,
    image: image,
    status: args[0].status
  );
  print("ddddddddddd  ${args[0].status}");
print("uuuuuuuuuuuuuuuu ${updatedtask.toJson()}"); 
  Get.back(result: updatedtask);
 }
 catch(e){
  print("EDIT error: $e");
 }
}



  Future<void> deleteTask(String id) async {
    try {
      await UserRepo.deleteTask(id);
      await fetchTasks();
      update();
    } catch (e) {
      print('DELETE error: $e');
    }}


}
