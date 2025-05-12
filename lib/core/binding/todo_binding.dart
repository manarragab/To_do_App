import 'package:get/get.dart';
import 'package:to_do_app/features/CRUDoperations/controller/crud_controller.dart';
import 'package:to_do_app/features/auth/controller/login_controller.dart';
import 'package:to_do_app/features/controller/todo_controller.dart';
import 'package:to_do_app/features/home/controller/home_controller.dart';
import 'package:to_do_app/features/profile/controller/profile_controller.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
Get.put(TodoController());
Get.put(LoginController());
Get.put(HomeController());
Get.put(CrudController());
Get.put(ProfileController());



  }
}
