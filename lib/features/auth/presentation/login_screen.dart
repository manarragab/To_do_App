import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/core/colors/custom_colors.dart';
import 'package:to_do_app/core/images/custom_images.dart';
import 'package:to_do_app/core/images/images_path.dart';
import 'package:to_do_app/core/routes/custom_pages.dart';
import 'package:to_do_app/core/text/custom_text.dart';
import 'package:to_do_app/core/text/textField/custom_textField.dart';
import 'package:to_do_app/core/widgets/loading_circle.dart';
import 'package:to_do_app/core/widgets/main_button.dart';
import 'package:to_do_app/features/auth/controller/login_controller.dart';

class LoginScreen extends GetWidget<LoginController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomImages.assetImage(
              ImagesPath.girly,
              fit: BoxFit.cover,
              height: 480,
              width: Get.width,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Login",
                      style: CustomText.textStyle1(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: CustomColors.balckk,
                      )),
                  SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField.phoneNumberField(
                          controller: controller.phoneController,
                          onChanged: (val) {
                            controller.phoneController.text = val;
                          },
                        ),
                        SizedBox(height: 20),
                        Obx(() => CustomTextField.passwordField(
                              isObsecure: controller.isSelected.value,
                              controller: controller.passwordController,
                              onChanged: (val) {
                                controller.passwordController.text = val;
                              },
                              onPressed: () {
                                controller.isSelected.value =
                                    !controller.isSelected.value;
                              },
                            )),
                        SizedBox(height: 25),
                       LoadingCircle(
                              isLoading: controller.isLoading,
                              child: MainButton(
                                text: "Sign In",
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    controller.login();
                                  } else {
                                    print(
                                        "Invalid phone number || password");
                                  }
                                },
                                backgroundColor: CustomColors.deepPurple,
                                borderRadius: 12,
                                fontSize: 19,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 20), 

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Text("Didn’t have any account?" ,
                              style: CustomText.textStyle1(
                                fontSize: 14,
                                color: CustomColors.grey2,
                                fontWeight: FontWeight.w400,
                              ),
                              ),

                               GestureDetector(
                                onTap: (){
                                  Get.offNamed(CustomPages.register);
                                },
                                 child: Text("Sign Up here" ,
                                                               style: CustomText.textStyle1(
                                                               textDecoration: TextDecoration.underline,
                                  fontSize: 14,
                                  color: CustomColors.deepPurple,
                                  fontWeight: FontWeight.w700,
                                                               ),
                                                               ),
                               )
                            ],)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


