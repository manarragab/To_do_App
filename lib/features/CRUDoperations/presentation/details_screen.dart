import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:to_do_app/core/colors/custom_colors.dart';
import 'package:to_do_app/core/enums/enums.dart';
import 'package:to_do_app/core/images/custom_images.dart';
import 'package:to_do_app/core/images/images_path.dart';
import 'package:to_do_app/core/text/custom_text.dart';
import 'package:to_do_app/core/text/textField/custom_textField.dart';
import 'package:to_do_app/features/CRUDoperations/controller/crud_controller.dart';

class DetailsScreen extends GetView<CrudController> {
  final String? image;
  final String? title;
  final String? desc;
  final String? status;
  final String? level;

  const DetailsScreen(
      {super.key, this.image, this.title, this.desc, this.status, this.level});

  @override
  Widget build(BuildContext context) {
    final List<String> details =
        (Get.arguments as List<String>?) ?? ["", "", "", "", ""];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Task Details",
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            CustomImages.assetImage(details[0],
                width: Get.width, height: Get.height / 3),
            SizedBox(height: 20),
            Text(details[1],
                style: CustomText.textStyle1(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: CustomColors.balckk)),
            SizedBox(height: 10),
            Text(details[2],
                style: CustomText.textStyle1(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: CustomColors.darkGrey)),
            SizedBox(height: 15),
            CustomTextField.dateField(
                controller: controller.dateController,
                onChanged: (val) {
                  controller.dateController.text = details[2];
                },
              notPress: true,
                color: CustomColors.lightPurple),
            SizedBox(height: 15),
            CustomTextField.dropDownField(
            
                controller: controller.dropDownController,
               onChanged: (val) {
                controller.dropDownController.text = details[3];
               },
                color: CustomColors.lightPurple,
                notPress: true,
                suffixIcon: ImagesPath.downArrow,
                hint: "Status",
                items: List.generate(Status.values.length, (index) {
                  return Status.values[index].name;
                })),
            SizedBox(height: 15),
            CustomTextField.dropDownField(
              controller: controller.dropDownController2,
              onChanged: (val) {
                controller.dropDownController2.text = details[4];
              },
          notPress: true,
              color: CustomColors.lightPurple,
              suffixIcon: ImagesPath.downArrow,
              hint: "Level",
              items: List.generate(Levels.values.length, (index) {
                return Levels.values[index].name;
              }),
            ),
            CustomImages.assetImage(ImagesPath.qrr)
          ],
        ),
      ),
    );
  }
}
