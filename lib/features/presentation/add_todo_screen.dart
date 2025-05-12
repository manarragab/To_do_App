import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/features/controller/todo_controller.dart';

class AddTodoScreen extends GetWidget<TodoController>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(title: Text("Add note" , style: TextStyle(color: Colors.deepPurple),),
      shadowColor: Colors.deepPurple,
      elevation: 5,
      centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          
          children: [
            SizedBox(height: 30,),
            Row(
              children: [
                Expanded(
                 
                  child: TextFormField(
                    controller: controller.titleController,
                    decoration: InputDecoration(
                      hintText: "title",
                      border: OutlineInputBorder(
                      
                        borderRadius: BorderRadius.circular(15),
                        gapPadding: 5,
                      ),
                      fillColor: Colors.deepPurple[50],
                      filled: true
                    ),
                  ),
                ),
                SizedBox(width: 10,),
          Obx((){
return Switch(value: controller.isTapped.value, onChanged: (val){
 controller.isTapped.value = ! controller.isTapped.value;
                });
          })     
              ],
            ),
            SizedBox(height: 20,),
               TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                controller: controller.descController,
              decoration: InputDecoration(
              
                hintText: "description",
                border: OutlineInputBorder(
                
                  borderRadius: BorderRadius.circular(15),
                  gapPadding: 5,
                ),
                      fillColor: Colors.deepPurple[50],
                      filled: true
              ),
            ),
                        SizedBox(height: 30,),

                        Container(
                          width: 20,
                          child: ElevatedButton(
                          
                            style: ButtonStyle(
                              
                              elevation: WidgetStatePropertyAll(5),
                              backgroundColor: WidgetStatePropertyAll(Colors.deepPurple[400],)
                          
                            ),
                            onPressed: () async{

                              controller.addAlarm();
                              
                          }, child: Text("Add" , style: TextStyle(color: Colors.white),)),
                        )

          ],
        ),
      ),
    );
  }
  
}