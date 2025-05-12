import 'package:get/get.dart';
import 'package:to_do_app/features/CRUDoperations/presentation/add_task_screen.dart';
import 'package:to_do_app/features/CRUDoperations/presentation/details_screen.dart';
import 'package:to_do_app/features/auth/presentation/login_screen.dart';
import 'package:to_do_app/features/auth/presentation/register_screen.dart';
import 'package:to_do_app/features/home/presentation/home_screen.dart';
import 'package:to_do_app/features/presentation/todo_list_screen.dart';
import 'package:to_do_app/features/profile/presentation/profile_screen.dart';
import 'package:to_do_app/features/splash/presentation/splash2_screen.dart';
import 'package:to_do_app/features/splash/presentation/splash_screen.dart';
import '../binding/todo_binding.dart';

class CustomPages {
  static const splash2 = '/splash2';
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const details = '/details';
  static const add = '/add';
  static const profile = '/profile';
  static const todo = '/todo';

  static final routes = [
    GetPage(
      name: splash,
      page: () =>SplashScreen(),
    ),

    GetPage(
      name: splash2,
      page: () =>Splash2Screen(),
    ),

  GetPage(
      name: login,
      page: () =>LoginScreen(),
      binding: TodoBinding(),
    ),
  GetPage(
      name: register,
      page: () => RegisterScreen(),
      binding: TodoBinding(),
    ),
  GetPage(
      name: home,
      page: () => HomeScreen(),
      binding: TodoBinding(),
    ),
 GetPage(
      name: details,
      page: () => DetailsScreen(),
      binding: TodoBinding(),
    ),

 GetPage(
      name: add,
      page: () => AddTaskScreen(),
      binding: TodoBinding(),
    ),
 GetPage(
      name: profile,
      page: () => ProfileScreen(),
      binding: TodoBinding(),
    ),
 GetPage(
      name: todo,
      page: () => TodoListScreen(),
    
    ),



  ];
}
