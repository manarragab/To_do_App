import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/Dio_API_services/crud_operation.dart';
import 'package:to_do_app/core/routes/custom_pages.dart';
import 'package:to_do_app/data/models/tasks/get_tasks/get_task.dart';
import 'package:to_do_app/data/models/tasks/post_task/post_task.dart';
import 'package:to_do_app/data/models/tasks/post_task/response_post_task.dart';


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
 
  //isEdit = false;
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
    // titleController.clear();
    // descController.clear();
   
   }

catch(e){
    print("POST error: $e");
   }
  }


}
