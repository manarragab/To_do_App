import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:to_do_app/core/text/textField/custom_textField.dart';
import 'package:to_do_app/data/models/posts/get_posts/response_alarm.dart';
import 'package:to_do_app/features/test_API/controller/todo_controller.dart';
import 'package:to_do_app/features/test_API/controller/presentation/add_todo_screen.dart';
// Ensure the path is correct

class TodoListScreen extends StatelessWidget {
  TodoController controller = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
       //  controller.goToAddScreen();
       Get.to(AddTodoScreen());
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: GetBuilder<TodoController>(builder: (_) {
        return Text("Posts List ( ${controller.alarms.length} ) ");
      })),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.fetchFamily();
          controller.update();
        },
        child: SingleChildScrollView(
          child: GetBuilder<TodoController>(
            builder: (_) {
              return Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.alarms.length,
                    itemBuilder: (context, index) {
                      final alarm = controller.alarms[index];
                      return ListTile(
                        trailing: PopupMenuButton(
                          onSelected: (value)  {
                           if(value == 'edit'){
                             //?edit alarm
                             controller.editAlarmm(alarm);
                            // controller.editAlarm(index);
                           }else if(value == 'delete'){
                             //?delete alarm
                             controller.deleteAlarmm(alarm.id!);
                           }

                          },
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(value: 'edit',child: Text("edit"),),
                              PopupMenuItem(value: 'delete',child: Text("delete"),),
                             ];
                          },
                        ),
                        leading: Text(alarm.id.toString()),
                        title: Text(alarm.title ?? "No Title"),
                        subtitle: Text(alarm.description ?? "No Body"),
                      );
                    },
                  ),
                  
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
