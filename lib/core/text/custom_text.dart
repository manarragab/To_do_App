import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText {

  static TextStyle textStyle1({
     double? fontSize,
     Color? color,
     FontWeight? fontWeight,
     TextDecoration? textDecoration,

  }) {
    return GoogleFonts.dmSans(
    
      fontSize: fontSize ?? 16,
      color: color ?? Colors.black,
      fontWeight: fontWeight?? FontWeight.normal,
      decoration:textDecoration?? TextDecoration.none
  
    );
  }





}
