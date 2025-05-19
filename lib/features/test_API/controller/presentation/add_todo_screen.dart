import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/features/test_API/controller/todo_controller.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen();

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  TodoController cont = Get.find();

  @override
  Widget build(BuildContext context) {
    // addController.fillAlarm();
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        title: GetBuilder<TodoController>(builder: (context) {
          return Text(
            "Add note",
            style: TextStyle(color: Colors.deepPurple),
          );
        }),
        shadowColor: Colors.deepPurple,
        elevation: 5,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: cont.titleController,
                    decoration: InputDecoration(
                        hintText: "title",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          gapPadding: 5,
                        ),
                        fillColor: Colors.deepPurple[50],
                        filled: true),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Obx(() {
                  return Switch(
                      value: cont.isTapped.value,
                      onChanged: (val) {
                        cont.isTapped.value = !cont.isTapped.value;
                      });
                })
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              validator: (value){
                if(value!.length<5){
                  return "enter 5 characters";
                }
                return null;
              
              },
              controller: cont.descController,
              decoration: InputDecoration(
                  hintText: "description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    gapPadding: 5,
                  ),
                  fillColor: Colors.deepPurple[50],
                  filled: true),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                width: 20,
                child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: WidgetStatePropertyAll(5),
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.deepPurple[400],
                      )),
                  onPressed: () async {
                    if (cont.isEdit) {
                      cont.updateAlarmFromForm();
                    } else {
                      cont.addAlarm();
                    }
                  },
                  child: Text(
                    "send",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
