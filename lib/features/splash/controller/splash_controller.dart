import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:to_do_app/core/routes/custom_pages.dart';

class SplashController extends GetxController {
  
  final FlutterSecureStorage storage = const FlutterSecureStorage();


  String? token ;
    @override
  void onInit() {
    super.onInit();
   
    checkLogin(); 
  }


  void checkLogin() async {
 token = await storage.read(key: 'access_token');
    print("token :::::::::::::::: $token");
    if (token != null) {
      Get.offAllNamed(CustomPages.home);
    } else {
      Get.offAllNamed(CustomPages.splash2);
    }
  }
}
