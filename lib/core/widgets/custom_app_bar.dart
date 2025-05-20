import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:to_do_app/core/Dio_API_services/crud_operation.dart';
import 'package:to_do_app/core/Dio_API_services/dio_api_services.dart';
import 'package:to_do_app/core/images/custom_images.dart';
import 'package:to_do_app/core/images/images_path.dart';
import 'package:to_do_app/core/routes/custom_pages.dart';
import 'package:to_do_app/data/models/auth/Login/response_post_login.dart';

class CustomAppBar {
  // Removed the instance member 'login' as it's not used in a static context.
static PreferredSizeWidget homeAppBar( 
 final String title ,
{required final VoidCallback onPressProfile, required final ResponsePostLogin login}
) {
  return AppBar(
    title: Text(title),
    centerTitle: false,
    backgroundColor: Colors.white,
    actions: [
      InkWell(
        onTap: onPressProfile,
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: CustomImages.svgImage(ImagesPath.person),
        ),
      ),
      InkWell(
        onTap: (){
          Get.dialog(
            AlertDialog(
              title: Text("Logout"),
              content: Text("Are you sure you want to logout?"),
              actions: [
                TextButton(onPressed: () => Get.back(), child: Text("No")),
                TextButton(onPressed: () async{
  await UserRepo.logout();
  Get.toNamed(CustomPages.register);


                }, child: Text("Yes")),
              ],
            )
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: CustomImages.svgImage(ImagesPath.rightArrow),
        ),
      ),
    ],
  );
}




}