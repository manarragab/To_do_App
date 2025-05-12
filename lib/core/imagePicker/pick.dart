import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:to_do_app/core/imagePicker/custom_bottom_sheet.dart';
import 'package:to_do_app/core/images/custom_images.dart';
import 'package:to_do_app/core/images/images_path.dart';

class Pick {
  static Future<File?> pickImage(BuildContext context) async {
    ImageSource? imageSource = ImageSource.gallery;
    double? imageHeight = 30;
    ImageSource? selected =
        await CustomBottomSheet.showCupertinoBottomSheet(context,
            height: 220,
            //  title: "select Image Source",
            widget: [
          CupertinoActionSheetAction(
            onPressed: () {
              imageSource = ImageSource.camera;
              Get.back(result: imageSource);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImages.assetImage(
            ImagesPath.camera,
                  width: imageHeight,
                  height: imageHeight,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text('Camera')
              ],
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              imageSource = ImageSource.gallery;
              Get.back(result: imageSource);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  CustomImages.assetImage(
            ImagesPath.gallery,
                  height: imageHeight,
                  width: imageHeight,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text('Gallery')
              ],
            ),
          )
        ]);
    if (selected != null) {
      return _pickImage(selected);
    }
    return null;
  }

  static Future<File?> _pickImage(ImageSource imageSource) async {
    XFile? file = await ImagePicker.platform.getImageFromSource(
        source: imageSource,
        options: const ImagePickerOptions(
            maxHeight: 500, maxWidth: 500, imageQuality: 50));
    if (file != null) {
      return File(file.path);
    }
    return null;
  }
}
