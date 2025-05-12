import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/routes/custom_pages.dart';


class CrudController extends GetxController {

  final dateController = TextEditingController();
  final dropDownController = TextEditingController();
  final dropDownController2 = TextEditingController();
  final titleController = TextEditingController();
  final dateController2 = TextEditingController();
  final descController = TextEditingController();

  var isLoading = false.obs;
  Rx<File?> selectedImage = Rx<File?>(null);

  Dio dio = Dio();
  String token="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2ODFmYzg5MzE5ZjQ4YjMwZGQxOGQzMTYiLCJpYXQiOjE3NDY5MTM0NzF9.thKHRKwIEPx7ErUji8-TCzOTMA1oAfrxTEhJo69mqz4";
  
  String get formattedDate {
    try {
      return DateFormat('yyyy-MM-dd').format(
        DateFormat('dd/MMM/yyyy').parse(dateController2.text),
      );
    } catch (e) {
      print("Date format error: $e");
      return ""; 
    }
  }

  Future<void> send() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
    Get.toNamed(CustomPages.home);
  }

  Future<void> postTask() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    final url = "https://todo.iraqsapp.com/todos";

    final data = {
      "image": selectedImage.value?.path ?? "",
      "title": titleController.text,
      "desc": descController.text,
      "priority": dropDownController2.text,
      "dueDate": formattedDate, 
    };


    final response = await dio.post(
      url,
      data: data,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
    );
    

    print("qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq ${selectedImage} , ${ titleController.text}, ${descController.text},${dropDownController2.text}, ${ selectedImage.value?.path }");
    isLoading.value = false;
    Get.toNamed(CustomPages.home);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("✅ Todo created successfully!");
      print(response.data);
    } else {
      print("❌ Failed: ${response.statusCode}");
      print(response.data);
    }
  }
}
