import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:to_do_app/core/text/textField/custom_textField.dart';
import 'package:to_do_app/data/models/posts/get_posts/response_alarm.dart';
import 'package:to_do_app/features/controller/todo_controller.dart';
import 'package:to_do_app/features/presentation/add_todo_screen.dart';
// Ensure the path is correct

class TodoListScreen extends StatelessWidget {
  TodoController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> key = GlobalKey<FormState>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
         controller.goToAddScreen();
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: GetBuilder<TodoController>(builder: (_) {
        return Text("Posts List ( ${controller.alarms.length} ) ");
      })),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.fetchFamily();
        },
        child: SingleChildScrollView(
          child: GetBuilder<TodoController>(
            builder: (_) {
              // Fetch posts if the list is empty

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
                          onSelected: (value) {
                           if(value == 'edit'){
                             //?edit alarm
                             controller.editAlarm(index);
                           }else if(value == 'delete'){
                             //?delete alarm
                             controller.deleteAlarm(index);
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
                  /*
                  Form(
                      key: key,
                      child: CustomTextField.numberField(
                          controller: controller.numberController,
                          onChanged: (val) {
                            controller.numberController.text = val;
                          })),
          
                  ElevatedButton(
                      onPressed: () {
                        if (key.currentState!.validate()) {
                          controller.addFamily();
                        } else {
                          print("Form not valid");
                        }
                      },
                      child: Text("send")),
                  Text("${controller.responsee.data?.category} "),
                  Text("${controller.responsee.data?.score} "),
                  controller.postBmi.weight != null
                      ? Text("Weight: ${controller.postBmi.weight}")
                      : SizedBox(), // or some placeholder
           
                  ...List.generate(controller.alarms.length, (index) {
                    return Card(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              //Text("Weight: ${controller.postBmi.weight}"),
                              Text(" ${controller.alarms[index].title}"),
          
                              Text(" ${controller.alarms[index].description}"),
          //Text(" ${controller.ala.description}"),
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                // controller
                                //     .deleteAlarm(controller.alarms[index].id!);
                              },
                              icon: Icon(Icons.delete)),
                          IconButton(
                              onPressed: () {
                                // controller.updateAlarm(controller.alarms[index],
                                //     controller.alarms[index].id!);
                              },
                              icon: Icon(Icons.edit))
                        ],
                      ),
                    );
                  })*/
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
