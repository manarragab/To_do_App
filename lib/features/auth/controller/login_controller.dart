import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/core/routes/custom_pages.dart';

class LoginController extends GetxController {
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();
    final nameController = TextEditingController();
    final numberController = TextEditingController();
    final levelController = TextEditingController();
    final dropDownController = TextEditingController();
    final addressController = TextEditingController();

  var isSelected = true.obs;
  var isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    
  Get.snackbar(
    "Success", 
    "Logined successfully", 
    backgroundColor: Colors.greenAccent,
    duration: Duration(seconds: 2),
  );
   Get.toNamed(CustomPages.home); 
    isLoading .value= false;
  }

Future<void> register() async {
  isLoading.value = true;
  
  await Future.delayed(Duration(seconds: 2));

  Get.snackbar(
    "Success", 
    "Registered successfully", 
    backgroundColor: Colors.greenAccent,
    duration: Duration(seconds: 2),
  );
  Get.toNamed(CustomPages.home);
  
  isLoading.value = false;
}


  @override
  void onClose() {
    phoneController.dispose();
    passwordController.dispose();
    nameController.dispose();
    numberController.dispose();
    levelController.dispose();
    dropDownController.dispose();
    addressController.dispose();
    super.onClose();
  }
}
