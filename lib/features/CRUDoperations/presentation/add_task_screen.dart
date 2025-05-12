import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/core/colors/custom_colors.dart';
import 'package:to_do_app/core/enums/enums.dart';
import 'package:to_do_app/core/imagePicker/pick.dart';
import 'package:to_do_app/core/images/custom_images.dart';
import 'package:to_do_app/core/images/images_path.dart';
import 'package:to_do_app/core/text/custom_text.dart';
import 'package:to_do_app/core/text/textField/custom_textField.dart';
import 'package:to_do_app/core/widgets/loading_circle.dart';
import 'package:to_do_app/core/widgets/main_button.dart';
import 'package:to_do_app/features/CRUDoperations/controller/crud_controller.dart';

class AddTaskScreen extends GetView<CrudController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form( 
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 10),
              InkWell(
                onTap: () async {
                  final pickedFile = await Pick.pickImage(context);
                  if (pickedFile != null) {
                    controller.selectedImage.value = pickedFile;
                  }
                },
                child: DottedBorder(
                  color: CustomColors.deepPurple,
                  strokeWidth: 1.5,
                  dashPattern: [2, 2],
                  borderType: BorderType.RRect,
                  radius: Radius.circular(12),
                  child: SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: Obx(() {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: controller.selectedImage.value != null
                            ?   Image.file(
                                controller.selectedImage.value!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomImages.svgImage(ImagesPath.image,
                                      width: 20, height: 20),
                                  SizedBox(width: 5),
                                  Text("Add Img",
                                      style: CustomText.textStyle1(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w500,
                                          color: CustomColors.deepPurple)),
                                ],
                              ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(height: 20),

              txt("Task Title"),
              SizedBox(height: 5),

              // Title field with validation
              CustomTextField.nameField(
                controller: controller.titleController,
                onChanged: (val) {
                  controller.titleController.text = val;
                },
                isTitle: true,
                hint: "Enter title here...",
              ),

              SizedBox(height: 15),
              txt("Task Description"),
              SizedBox(height: 5),
              CustomTextField.paragraphTextField((val) {},
              controller: controller.descController,
              ),
              SizedBox(height: 15),

              txt("Priority"),
              SizedBox(height: 5),

              CustomTextField.dropDownField(
                controller: controller.dropDownController2,
                onChanged: (val) {
                  controller.dropDownController2.text = val;
                },
                border: false,
                color: CustomColors.lightPurple,
                suffixIcon: ImagesPath.downArrow,
                hint: "Level",
                items: List.generate(Levels.values.length,
                    (index) => Levels.values[index].name),
              ),

              SizedBox(height: 15),
              txt("Due date"),
              SizedBox(height: 5),
              CustomTextField.dateField(
                controller: controller.dateController2,
                onChanged: (val) {

                  controller.dateController2.text = val;
                  print("wwwwwwwwwwwwwwwwwww ${ controller.dateController2.text}");
                },
              ),

              SizedBox(height: 25),
              LoadingCircle(
                isLoading: controller.isLoading,
                child: MainButton(
                  text: "Add Task",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.postTask();
                     // controller.send();
                    } else {
                      print("Form not valid");
                    }
                  },
                  backgroundColor: CustomColors.deepPurple,
                  borderRadius: 12,
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
Widget txt(String txt){
  return  Text(txt,
                            style: CustomText.textStyle1(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: CustomColors.greyy));
                   
}
