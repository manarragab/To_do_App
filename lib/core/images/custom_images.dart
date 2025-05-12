import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; 

class   CustomImages {

  // Method to load Asset Image (PNG, JPG)
  static Widget assetImage(String path, {double? width, double? height, BoxFit? fit}) {
    return Image.asset(
      path,
      width: width,
      height: height,
      fit:fit?? BoxFit.cover,
    );
  }

  // Method to load Network Image (PNG, JPG, etc.)
  static Widget networkImage(String url, {double? width, double? height , BoxFit? fit}) {
    return Image.network(
      url,
      width: width,
      height: height,
      fit:fit?? BoxFit.cover,
    );
  }

  // Method to load SVG Image
  static Widget svgImage(String path, {double? width, double? height , BoxFit? fit}) {
    return SvgPicture.asset(
      path,
      width: width,
      height: height,
      fit:fit?? BoxFit.contain,
    );
  }

  // Method to load Network SVG (using package flutter_svg)
  static Widget networkSvgImage(String url, {double? width, double? height, BoxFit? fit}) {
    return SvgPicture.network(
      url,
      width: width,
      height: height,
      fit:fit?? BoxFit.cover,
    );
  }
  
  // Example of loading an image as an Icon (using an image asset or network)
  static Icon imageAsIcon(String path, {double size = 24.0, bool isNetwork = false}) {
    return Icon(
      isNetwork ? Icons.image : Icons.local_offer, // Placeholder icon
      size: size,
    );
  }
}
