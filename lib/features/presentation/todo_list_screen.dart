import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/text/textField/custom_textField.dart';
import 'package:to_do_app/features/controller/todo_controller.dart';
import 'package:to_do_app/features/presentation/add_todo_screen.dart';
// Ensure the path is correct

class TodoListScreen extends StatelessWidget {
  TodoController controller=Get.find();



  @override
  Widget build(BuildContext context) {
      final GlobalKey<FormState> key = GlobalKey<FormState>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
Get.to(AddTodoScreen());
      } , child: Icon(Icons.add),),
      appBar: AppBar(title: Text("Posts List")),
      body: GetBuilder<TodoController>(
        builder: (controller) {
          // Fetch posts if the list is empty
          if (controller.alarms.isEmpty) {
            controller.fetchFamily();
          }

          return ListView(
            children: [

              ListView.builder(
                shrinkWrap: true,
            itemCount: controller.alarms.length,
            itemBuilder: (context, index) {
              final alarm = controller.alarms[index];
              return ListTile(
                title: Text(alarm.title ?? "No Title"),
                subtitle: Text(alarm.description ?? "No Body"),
              );
            },
          ),
Form(
  key:key ,
  child: 
CustomTextField.numberField(
  controller: controller.numberController, 
onChanged: (val){
controller.numberController.text=val;
} )
),



ElevatedButton(onPressed: (){

 if (key.currentState!.validate()) {
                      controller.addFamily();
                    
                    } else {
                      print("Form not valid");
                    }


}, child: Text("send")),
Text("${controller.responsee.data?.category} "),
Text("${controller.responsee.data?.score} "),
controller.postBmi.weight != null
  ? Text("Weight: ${controller.postBmi.weight}")
  : SizedBox(), // or some placeholder



...List.generate(controller.alarms.length, (index){
  return 
Card(
  child: Row(children: [
Column(children: [
  //Text("Weight: ${controller.postBmi.weight}"),
Text(" ${controller.alarms[index].title}"),
Text(" ${controller.alarms[index].description}"),

],),
IconButton(onPressed: (){

}, icon: Icon(Icons.delete)),
IconButton(onPressed: (){
controller.updateAlarm();
}, icon: Icon(Icons.edit))


  ],),
);
})

            ],
          );

          
        },
      ),
      
    );
  }
}
