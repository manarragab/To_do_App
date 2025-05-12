
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_app/core/colors/custom_colors.dart';
import 'package:to_do_app/core/text/custom_text.dart';

class CustomBottomSheet {
  static showDefaultListBottomSheet(BuildContext context,
      {required String title,
      required List data,
      required String Function(int index) mainTitle,
      required void Function(int index) onTap}) {
    double height = 600;
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.only(top: 20),
        height: height,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Column(
          children: [
            Center(
              child: Container(
                // height: 30,
                alignment: Alignment.center,
                child: Text(
                  title,
                  style:CustomText.textStyle1(
                    color: CustomColors.lightPurple,
                    fontWeight:FontWeight.w700,
                    fontSize:22),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          onTap(index);
                        },
                        title: Text(
                          mainTitle(index),
                          textAlign: TextAlign.center,
                          style: CustomText.textStyle1(
                              color: CustomColors.balckk,
                              fontWeight:FontWeight.normal,
                              fontSize:16),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }

  static showDefaultBottomSheet(BuildContext context,
      {required String title,
      double height = 600,
      required Widget widget,
      bool maxHeight = false}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: maxHeight,
      backgroundColor: Colors.white,
      shape: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      builder: (context) => Container(
        padding: const EdgeInsets.only(top: 10),
        height: height,
        child: widget,
      ),
    );
  }

  static dynamic showCupertinoBottomSheet(BuildContext context,
      {String? title,
      double height = 600,
      required List<CupertinoActionSheetAction> widget,
      bool maxHeight = false,
      bool isDismissible = true}) {
    return showCupertinoModalPopup<ImageSource>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: title != null
            ? Text(
                title,
                style: CustomText.textStyle1(
                    color: CustomColors.lightPurple,
                    fontWeight:FontWeight.w700,
                    fontSize:22),
              )
            : null,
        actions: [...widget],
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () {
           Get.back();
        //    Navigator.pop(context, 'Cancel');
          },
          child: const Text('Cancel'),
        ),
      ),
    );
  }
}
