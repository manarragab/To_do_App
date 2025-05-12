import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/core/binding/todo_binding.dart';
import 'package:to_do_app/core/routes/custom_pages.dart';

void main() {
  runApp( ToDoApp());
}

class ToDoApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: TodoBinding() ,
      initialRoute: CustomPages.todo,
      
      getPages: CustomPages.routes,
    );
  }
  
}