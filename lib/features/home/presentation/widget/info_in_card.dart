import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/features/CRUDoperations/controller/crud_controller.dart';
import 'package:to_do_app/features/home/presentation/widget/custom_card.dart';

class InfoInCard extends GetView<CrudController> {
      // Same here, use Get.put() or constructor injection


  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: List.generate(
        controller.tasks.length,
        (index) => Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: CustomCard(
            priority: controller.tasks[index].priority ?? "",
            desc: controller.tasks[index].desc ?? "",
            title: controller.tasks[index].title ?? "",
            status: controller.tasks[index].status ?? "",
            date: controller.tasks[index].createdAt?.substring(0, 10) ?? "",
            delete: () {
              controller.deleteTask(
                  controller.tasks[index].id ?? "0");
              controller.fetchTasks();
              controller.update();
            },
            edit: () {
              controller.updateTask(
                  controller.tasks[index],
                  controller.tasks[index].id ?? "");
              controller.fetchTasks();
              controller.update();
            },
          ),
        ),
      ),
    );
  }
}
