import 'package:flutter/material.dart';
import 'package:to_do_app/core/colors/custom_colors.dart';
import 'package:to_do_app/core/images/custom_images.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final TextStyle? textStyle;
  final double elevation;
  final double fontSize;
  final FontWeight? fontWeight;
  final bool icon;

  const MainButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 50,
    this.backgroundColor = CustomColors.deepPurple,
    this.textColor = Colors.white,
    this.borderRadius = 12,
    this.textStyle,
    this.elevation=0,
    this.fontSize=16,
    this.fontWeight,
    this.icon=false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                text,
                style: textStyle ??
                    TextStyle(
                      color: textColor,
                      fontSize: fontSize,
                      fontWeight:fontWeight?? FontWeight.w600,
                    ),
              ),
            ),
               icon?   Padding(
                 padding: const EdgeInsets.all(5),
                 child: CustomImages.svgImage("assets/svg/arrow.svg" ,
                                 
                 ),
               ) : SizedBox()
          ],
        ),
      ),
    );
  }
}
