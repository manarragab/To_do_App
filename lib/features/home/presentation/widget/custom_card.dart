import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:to_do_app/core/colors/custom_colors.dart';
import 'package:to_do_app/core/images/custom_images.dart';
import 'package:to_do_app/core/images/images_path.dart';
import 'package:to_do_app/core/routes/custom_pages.dart';
import 'package:to_do_app/core/text/custom_text.dart';
import 'package:to_do_app/features/CRUDoperations/controller/crud_controller.dart';

class CustomCard extends StatelessWidget {
  final String? status;
  final String? path;
  final String title;
  final String desc;
  final String priority;
  final String date;
  final VoidCallback delete;
  final VoidCallback edit;

  const CustomCard(
      {super.key,
      this.status,
      this.path,
      required this.title,
      required this.desc,
      required this.priority,
      required this.date, 
      required this.delete, required this.edit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          CustomImages.assetImage(path ?? ImagesPath.baskett,
              width: 50, height: 50),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width / 2.5,
                      child: Text(title ?? 'Grocery Shopping App',
                          overflow: TextOverflow.ellipsis,
                          style: CustomText.textStyle1(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: CustomColors.balckk)),
                    ),

                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: status == "waiting"
                            ? CustomColors.lightpink
                            : status == "finished"
                                ? CustomColors.lightblue
                                : CustomColors.lightPurple,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(status ?? "",
                            style: CustomText.textStyle1(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: CustomColors.balckk)),
                      ),
                    ),
                    //SizedBox(width: 15),

                    InkWell(
                        onTapDown: (details) {
                          showMenu(
                              context: context,
                              constraints: BoxConstraints(
                                maxHeight: 150,
                                maxWidth: 80,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              position: RelativeRect.fromLTRB(
                                  details.globalPosition.dx,
                                  details.globalPosition.dy,
                                  0,
                                  0),
                              items: [
                                PopupMenuItem(
                                  child: Text('Edit'),
                                  onTap: () {
                                    edit();
                                  },
                                ),
                                PopupMenuItem(
                                  textStyle:
                                      TextStyle(color: CustomColors.orangee),
                                  onTap: () {
                                    Get.dialog(
                                      AlertDialog(
                                        
                                        content: Text('Are you sure to delete ?'),
                                        actions: [
                                          TextButton(
                                            child: Text('Cancel'),
                                            style: TextButton.styleFrom(
                                              foregroundColor:
                                            Colors.black,
                                            ),
                                            onPressed: () {
                                              Get.back();
                                            },
                                          ),
                                         
                                          TextButton(
                                            child: Text('Delete'),
                                            style: TextButton.styleFrom(
                                              foregroundColor:
                                            Colors.red,
                                            ),
                                            onPressed: () {

delete();
                                              Get.back();
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: Text('Delete'),
                                ),
                                PopupMenuItem(
                                  child: Text('More'),
                                  onTap: () {
                                    Future.delayed(Duration.zero, () {
                                      Get.toNamed(CustomPages.details,
                                          arguments: [
                                            ImagesPath.baskett,
                                            title,
                                            desc,
                                            priority,
                                            date,
                                            status,
                                          ]);
                                    });
                                  },
                                ),
                              ]);
                        },
                        child: CustomImages.svgImage(ImagesPath.dots)),
                  ],
                ),
                SizedBox(
                  width: Get.width / 1.5,
                  child: Text(desc ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: CustomText.textStyle1(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: CustomColors.darkGrey)),
                ),
                Container(
                  margin: EdgeInsets.only(right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomImages.svgImage(priority == 'high'
                              ? ImagesPath.orange
                              : priority == 'low'
                                  ? ImagesPath.blue
                                  : ImagesPath.purple),
                          SizedBox(width: 5),
                          Text(priority,
                              style: CustomText.textStyle1(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: priority == 'high'
                                    ? Colors.orange
                                    : priority == 'low'
                                        ? Colors.blue
                                        : Colors.deepPurple,
                              )),
                        ],
                      ),
                      Text(date ?? '7/3/2002',
                          style: CustomText.textStyle1(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: CustomColors.darkGrey)),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
