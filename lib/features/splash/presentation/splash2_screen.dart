import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/core/colors/custom_colors.dart';
import 'package:to_do_app/core/images/custom_images.dart';
import 'package:to_do_app/core/images/images_path.dart';
import 'package:to_do_app/core/routes/custom_pages.dart';
import 'package:to_do_app/core/text/custom_text.dart';
import 'package:to_do_app/core/widgets/main_button.dart';

class Splash2Screen extends StatelessWidget {
  const Splash2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomImages.assetImage(ImagesPath.girly,
              fit: BoxFit.cover, height: 480, width: Get.width),
          txtBold("Task Management &"),
          txtBold("To-Do List"),
          SizedBox(
            height: 20,
          ),
          txt("This productive tool is designed to help"),
          txt("you better manage your task"),
          txt("project-wise conveniently!"),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: MainButton(
              text: "Let’s Start",
              onPressed: () {
                Get.toNamed(CustomPages.login);
              },
              backgroundColor: CustomColors.deepPurple,
              borderRadius: 12,
              fontSize: 19,
              fontWeight: FontWeight.w700,
              icon: true,
            ),
          )
        ],
      ),
    );
  }
}

Widget txtBold(String txt) {
  return Center(
    child: Text(
      txt,
      style: CustomText.textStyle1(
          fontSize: 24,
          color: CustomColors.balckk,
          fontWeight: FontWeight.w700),
    ),
  );
}

Widget txt(String txt) {
  return Center(
    child: Text(
      txt,
      style: CustomText.textStyle1(
          fontSize: 14, color: CustomColors.greyy, fontWeight: FontWeight.w400),
    ),
  );
}
