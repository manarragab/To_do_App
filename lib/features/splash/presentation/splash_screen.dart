import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/core/colors/custom_colors.dart';
import 'package:to_do_app/core/images/custom_images.dart';
import 'package:to_do_app/core/images/images_path.dart';
import 'package:to_do_app/features/splash/controller/splash_controller.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>{
SplashController controller=Get.put(SplashController());
  @override
  void initState()  {
    super.initState();

   

  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.deepPurple,
      body: Center(child: CustomImages.svgImage(ImagesPath.tasky , fit: BoxFit.contain ,
      width: Get.width/2,
      height: 45
      ))
    );
  }
}