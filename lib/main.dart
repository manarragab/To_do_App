import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/core/binding/todo_binding.dart';
import 'package:to_do_app/core/routes/custom_pages.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
    
  runApp( ToDoApp());
}

class ToDoApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      debugShowCheckedModeBanner: false,
      initialBinding: TodoBinding() ,
      initialRoute: CustomPages.splash,
      getPages: CustomPages.routes,
    );
  }
  
}