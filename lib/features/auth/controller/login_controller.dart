import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/core/Dio_API_services/crud_operation.dart';
import 'package:to_do_app/core/Dio_API_services/dio_api_services.dart';
import 'package:to_do_app/core/enums/enums.dart';
import 'package:to_do_app/core/routes/custom_pages.dart';
import 'package:to_do_app/data/models/auth/Login/post_login.dart';
import 'package:to_do_app/data/models/auth/Login/response_post_login.dart';
import 'package:to_do_app/data/models/auth/Register/post_register.dart';
import 'package:to_do_app/data/models/auth/Register/response_post_register.dart';

class LoginController extends GetxController {
     TextEditingController phoneController = TextEditingController();  
     TextEditingController passwordController= TextEditingController();
     TextEditingController nameController =  TextEditingController();
     TextEditingController numberController = TextEditingController() ;
     TextEditingController dropDownController = TextEditingController();
     TextEditingController addressController = TextEditingController();


  var isSelected = true.obs;
  var isLoading = false.obs;
@override
 void onInit(){
   super.onInit();

 }


 @override
  void onClose() {
    phoneController.dispose();
    passwordController.dispose();
    nameController.dispose();
    numberController.dispose();
    dropDownController.dispose();
    addressController.dispose();
    super.onClose();
  }



 Future<void> login() async {
  isLoading.value = true;

  PostLogin loginData = PostLogin(
    phone:"+20${phoneController.text}",
    password: passwordController.text,
  );

  try {
    ResponsePostLogin response = await UserRepo.login(loginData);

    if (response.accessToken != null && response.refreshToken != null) {
      Get.snackbar(
        "Success",
        "Logged in successfully",
        backgroundColor: Colors.greenAccent,
        duration: Duration(seconds: 2),
      );
      Get.toNamed(CustomPages.home);
    } else {
      Get.snackbar(
        "Login Failed",
     
       ": يوجد خطأ في رقم الهاتف أو كلمة المرور",
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      );
    }
  } catch (e) {
    print("Exception during login: $e");
    Get.snackbar(
      "Error",
      "Connection Network Error",
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    );
  } finally {
    isLoading.value = false;
  }
}








PostRegister registerr=PostRegister();

Future<void> register() async {
  isLoading.value = true;

  final registerr = PostRegister(
    phone:"+20${phoneController.text}",
    password: passwordController.text,
    displayName: nameController.text,
    experienceYears: int.tryParse(numberController.text),
    address: addressController.text,
    level: dropDownController.text,
  );

  try {
    ResponsePostRegister responsePostRegister = await UserRepo.register(registerr);

    if (responsePostRegister.statusCode != 200 && responsePostRegister.statusCode != 201 || responsePostRegister.error != null) {
print("Register Response: ${responsePostRegister.toJson()}");
      Get.snackbar(
        "Fail",
        responsePostRegister.message ?? "Failed to register",
        backgroundColor: Colors.redAccent,
        duration: const Duration(seconds: 2),
      );
    } else {
      Get.snackbar(
        "Success",
         responsePostRegister.message ??"Registered successfully",
        backgroundColor: Colors.greenAccent,
        duration: const Duration(seconds: 2),
      );
      Get.toNamed(CustomPages.home);
    }
  } catch (e) {
    print("Exception during register: $e");
    Get.snackbar(
      "Error",
      "Something went wrong",
      backgroundColor: Colors.redAccent,
      duration: const Duration(seconds: 2),
    );
  } finally {
    isLoading.value = false;
  }
}

}


 


