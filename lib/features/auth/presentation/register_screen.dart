import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/core/colors/custom_colors.dart';
import 'package:to_do_app/core/enums/enums.dart';
import 'package:to_do_app/core/images/custom_images.dart';
import 'package:to_do_app/core/images/images_path.dart';
import 'package:to_do_app/core/routes/custom_pages.dart';
import 'package:to_do_app/core/text/custom_text.dart';
import 'package:to_do_app/core/text/textField/custom_textField.dart';
import 'package:to_do_app/core/widgets/loading_circle.dart';
import 'package:to_do_app/core/widgets/main_button.dart';
import 'package:to_do_app/features/auth/controller/login_controller.dart';

class RegisterScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  GetBuilder<LoginController>(builder: (_){
      return ListView(
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
                Text("Sign Up",
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
                      
                      CustomTextField.nameField(
                        controller: controller.nameController,
                        onChanged: (val) {},
                      ),

                      SizedBox(height: 20),
                      CustomTextField.phoneNumberField(
                        controller: controller.phoneController,
                        onChanged: (val) {
                          controller.phoneController.text = val;
                        },
                      ),
                      SizedBox(height: 20),


                      CustomTextField.numberField(
                          controller: controller.numberController,
                          onChanged: (val) {},
                          hint: "Years of experience..."),

                      SizedBox(height: 20),

                      CustomTextField.dropDownField(
                        
                          controller: controller.dropDownController,
                          onChanged: (val) {
                            controller.dropDownController.text = val;
                          },
                          hint: "Choose experience Level",
                          items: List.generate(UserLevel.values.length, (index) {
                            return UserLevel.values[index].name;
                          })),


                      SizedBox(height: 20),

CustomTextField.addressField(
  controller: controller.addressController,
  onChanged: (val) {
    controller.addressController.text = val;
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
                          text: "Sign Up",
                          onPressed: () {
                        if (!_formKey.currentState!.validate()) {
    print("Invalid phone number  password  name  level  address || number");
    return;
  }

  if (controller.registerr != null) {
    controller.register();
  } else {
    print("registerr is null");
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
                              Text("Already have any account?" ,
                              style: CustomText.textStyle1(
                                fontSize: 14,
                                color: CustomColors.grey2,
                                fontWeight: FontWeight.w400,
                              ),
                              ),

                               GestureDetector(
                                onTap: (){
                                  Get.offNamed(CustomPages.login);
                                },
                                 child: Text("Sign In here" ,
                                                               style: CustomText.textStyle1(
                                                               textDecoration: TextDecoration.underline,
                                  fontSize: 14,
                                  color: CustomColors.deepPurple,
                                  fontWeight: FontWeight.w700,
                                                               ),
                                                               ),
                               )
                            ],),
                                                                              SizedBox(height: 20), 

                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
      }),
    );
  }
}
