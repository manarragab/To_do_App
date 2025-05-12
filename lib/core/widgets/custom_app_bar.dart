import 'package:flutter/material.dart';
import 'package:to_do_app/core/images/custom_images.dart';
import 'package:to_do_app/core/images/images_path.dart';

class CustomAppBar {
static PreferredSizeWidget homeAppBar( 
 final String title ,
{required final VoidCallback onPressProfile}
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
      Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: CustomImages.svgImage(ImagesPath.rightArrow),
      ),
    ],
  );
}




}