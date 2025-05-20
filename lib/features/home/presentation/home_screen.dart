import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:to_do_app/core/colors/custom_colors.dart';
import 'package:to_do_app/core/enums/enums.dart';
import 'package:to_do_app/core/images/custom_images.dart';
import 'package:to_do_app/core/images/images_path.dart';
import 'package:to_do_app/core/routes/custom_pages.dart';
import 'package:to_do_app/core/text/custom_text.dart';
import 'package:to_do_app/core/widgets/custom_app_bar.dart';
import 'package:to_do_app/data/models/auth/Login/response_post_login.dart';
import 'package:to_do_app/data/models/tasks/get_tasks/get_task.dart';
import 'package:to_do_app/features/CRUDoperations/controller/crud_controller.dart';
import 'package:to_do_app/features/home/controller/home_controller.dart';
import 'package:to_do_app/features/home/presentation/widget/custom_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.find();
  CrudController crudController = Get.find();
  ResponsePostLogin login = ResponsePostLogin();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            CustomAppBar.homeAppBar("Home", login: login, onPressProfile: () {
          Get.toNamed(CustomPages.profile);
        }),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 50,
              height: 50,
              child: CircleAvatar(
                backgroundColor: CustomColors.lightPurple,
                child: CustomImages.svgImage(ImagesPath.barcode),
              ),
            ),
            SizedBox(height: 10),
            FloatingActionButton(
              elevation: 10,
              clipBehavior: Clip.antiAlias,
              shape: CircleBorder(),
              onPressed: () {
                Get.toNamed(CustomPages.add);
              },
              backgroundColor: CustomColors.deepPurple,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: GetBuilder<CrudController>(builder: (_) {
          return RefreshIndicator(
            onRefresh: crudController.fetchTasks,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GetBuilder<HomeController>(builder: (_) {
                  return ListView(
                    children: [
                      SizedBox(height: 20),
                      Text('My Tasks',
                          style: CustomText.textStyle1(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: CustomColors.darkGrey)),
                      SizedBox(height: 20),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children:
                              List.generate(Status.values.length, (index) {
                            final bool isSelected =
                                controller.currentIndex == index;
                            return GestureDetector(
                              onTap: () {
                                crudController.fetchTasks();
                                controller.onTap(index);
                                controller.update();
                              },
                              child: Container(
                                height: 50,
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? CustomColors.deepPurple
                                      : CustomColors.lightPurple,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Center(
                                  child: Text(
                                    Status.values[index].name,
                                    style: CustomText.textStyle1(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: isSelected
                                          ? Colors.white
                                          : CustomColors.grey3,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      SizedBox(height: 20),

                      if (controller.currentIndex == 0)
                        ...List.generate(
                            crudController.tasks.length,
                            (index) => Container(
                                  child: CustomCard(
                                    priority:
                                        crudController.tasks[index].priority ??
                                            "",
                                    desc:
                                        crudController.tasks[index].desc ?? "",
                                    title:
                                        crudController.tasks[index].title ?? "",
                                    //  path: crudController.tasks[index].image,
                                    status:
                                        crudController.tasks[index].status ??
                                            "",
                                    date: crudController.tasks[index].createdAt
                                            ?.substring(0, 10) ??
                                        "",
                                    //status: Status.values[controller.currentIndex].name,
                                    delete: () {
                                      crudController.deleteTask(
                                          crudController.tasks[index].id ??
                                              "0");
                                      crudController.fetchTasks();
                                      controller.update();
                                    },
                                   edit: () {
  crudController.updateTask(crudController.tasks[index] , crudController.tasks[index].id ?? "");
  crudController.fetchTasks();
  controller.update();
}

                                  ),
                                )),

                      // if (controller.currentIndex == 1)
                      //   Container(
                      //     child: CustomCard(
                      //       status: Status.values[controller.currentIndex].name,
                      //       textColor: CustomColors.deepPurple,
                      //       textStatusColor: CustomColors.deepPurple,
                      //     ),
                      //   ),

                      //    if (controller.currentIndex == 2)
                      //   Container(
                      //     child: CustomCard(
                      //       status: Status.values[controller.currentIndex].name,
                      //       textColor: Colors.orange,
                      //       textStatusColor: CustomColors.deepPurple,
                      //     ),
                      //   ),

                      //    if (controller.currentIndex == 3)
                      //   Container(
                      //     child: CustomCard(
                      //       status: Status.values[controller.currentIndex].name,
                      //     ),
                      //   ),
                    ],
                  );
                })),
          );
        }));
  }
}
