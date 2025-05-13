import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/features/controller/add_controller.dart';
import 'package:to_do_app/features/controller/todo_controller.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen();

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  late AddController addController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addController = Get.put(AddController());
  }

  @override
  Widget build(BuildContext context) {
    addController.fillAlarm();
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        title: GetBuilder<AddController>(builder: (context) {
          return Text(
            addController.isAddStatus ? "Add note" : "Update note",
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
                    controller: addController.titleController,
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
                      value: addController.isTapped.value,
                      onChanged: (val) {
                        addController.isTapped.value =
                            !addController.isTapped.value;
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
              controller: addController.descController,
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
                    if (addController.isAddStatus==false) {
                      addController.editAlarm();
                    } else {
                      await addController.addAlarm();
                    }
                  },
                  child: GetBuilder<AddController>(builder: (context) {
                    return Text(
                      addController.isAddStatus ? "send" : "update",
                      style: TextStyle(color: Colors.white),
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}
