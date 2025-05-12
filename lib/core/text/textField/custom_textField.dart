import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/colors/custom_colors.dart';
import 'package:to_do_app/core/enums/enums.dart';
import 'package:to_do_app/core/images/custom_images.dart';
import 'package:to_do_app/core/images/images_path.dart';
import 'package:to_do_app/core/text/custom_text.dart';
import 'package:to_do_app/core/text/textField/validation.dart';

class CustomTextField {

  static Widget numberField({
    required TextEditingController controller,
    final String? hint,
    required Function(String) onChanged,
  }) {
    return TextFormField(
      validator: Validation.numberValidator,
      maxLength: 2,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      controller: controller,
      keyboardType: TextInputType.number,
      onChanged: (val) {
        onChanged(val);
      },
      decoration: InputDecoration(
        counterText: "",
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: CustomColors.grey2, width: 1),
        ),
        hintText: hint ?? "number...",
        hintStyle: CustomText.textStyle1(
          color: CustomColors.grey2,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  static Widget phoneNumberField({
    required TextEditingController controller,
    final String? hint,
    required Function(String) onChanged,
  }) {
    return TextFormField(
      validator: Validation.phoneNumberValidator,
      maxLength: 10,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      controller: controller,
      keyboardType: TextInputType.number,
      onChanged: (val) {
        onChanged(val);
      },
      decoration: InputDecoration(
        counterText: "",
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: CustomColors.grey2, width: 1),
        ),
        hintText: hint ?? "1234567890",
        hintStyle: CustomText.textStyle1(
          color: CustomColors.grey2,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            width: 60,
            child: Row(
              children: [
                CustomImages.svgImage(ImagesPath.egypt, height: 24, width: 24),
                SizedBox(width: 5),
                Text(
                  "+20",
                  style: CustomText.textStyle1(
                    color: CustomColors.grey2,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget passwordField({
    required TextEditingController controller,
    final String? hint,
    required Function(String) onChanged,
    required Function() onPressed,
    required bool isObsecure,
  }) {
    return TextFormField(
      validator: Validation.passwordValidator,
      obscureText: isObsecure,
      controller: controller,
      keyboardType: TextInputType.name,
      onChanged: (val) {
        onChanged(val);
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: CustomColors.grey2, width: 1),
          ),
          hintText: hint ?? "password...",
          hintStyle: CustomText.textStyle1(
            color: CustomColors.grey2,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          suffixIcon: GestureDetector(
            onTap: onPressed,
            child: Icon(
              isObsecure
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: CustomColors.grey2,
              size: 20,
            ),
          )),
    );
  }

  static Widget nameField({
    required TextEditingController controller,
    final String? hint,
    required Function(String) onChanged,
    final bool? isTitle,
  }) {
    return TextFormField(
      validator: isTitle!? Validation.titleValidator: Validation.nameValidator,
      controller: controller,
      keyboardType: TextInputType.name,
      onChanged: (val) {
        onChanged(val);
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: CustomColors.grey2, width: 1),
        ),
        hintText: hint ?? "Name...",
        hintStyle: CustomText.textStyle1(
          color: CustomColors.grey2,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  static Widget dropDownField({
    required TextEditingController controller,
    final String? hint,
    required Function(String) onChanged,
    required List<dynamic> items,
    final Color? color,
    final String? suffixIcon,
    final bool border=false,
  }) {
    return TextFormField(
      controller: controller,
      validator: Validation.levelValidator,
      readOnly: true,
    
      // onTap: () async {
      //   final RenderBox box = Get.context!.findRenderObject() as RenderBox;
      //   final Offset position = box.localToGlobal(Offset.zero);

      //   final selected = await showMenu<String>(
      //     context: Get.context!,
      //     position: RelativeRect.fromLTRB(
      //       position.dx, // X position
      // position.dy + box.size.height, // Y position, just below the TextField
      // position.dx + box.size.width, // Right side
      // position.dy + box.size.height, // Keep the bottom aligned
   
      //     ),
      //     items: items.isNotEmpty
      //         ? items.map<PopupMenuEntry<String>>((item) {
      //             return PopupMenuItem(
      //               value: item.toString(),
      //               child: Text(item.toString()),
      //             );
      //           }).toList()
      //         : [
      //             PopupMenuItem(
      //               value: "select",
      //               child: Text("select"),
      //             ),
      //           ],
      //   );

      //   if (selected != null) {
      //     controller.text = selected;
      //     onChanged(selected);
      //   }
      // },
      onTap: () async {
  final selected = await showModalBottomSheet<String>(
    
    context: Get.context!,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return SafeArea(
        child: Column(
          
          mainAxisSize: MainAxisSize.min,
          children: items.isNotEmpty
              ? items.map<Widget>((item) {
                  return ListTile(
              
                    title: item is String
                        ? Text(item)
                        : (item['widget'] ?? Text(item['value'])),
                    onTap: () {
                      
                    Navigator.pop(context, item is String ? item : item['value']);
                    },
                  );
                }).toList()
              : [
                  ListTile(
                    title: Text("select"),
                    onTap: () {
                      Navigator.pop(context, "select");
                    },
                  ),
                ],
        ),
      );
    },
  );

  if (selected != null) {
    controller.text = selected;
    onChanged(selected);
  }
}
,

      decoration: InputDecoration(
        fillColor: color ?? Colors.transparent,
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:border? BorderSide(color: CustomColors.grey2, width: 1) : BorderSide(),
        ),
        hintText: hint ?? "Choose Experience Level...",
        hintStyle: CustomText.textStyle1(
          color: CustomColors.grey2,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(15),
          child:
              CustomImages.svgImage( suffixIcon?? ImagesPath.dropdown, height: 24, width: 24),
        ),
      ),
    );
  }

  static Widget addressField({
    required TextEditingController controller,
    final String? hint,
    required Function(String) onChanged,
  }) {
    return TextFormField(
      validator: Validation.addressValidator,
      controller: controller,
      keyboardType: TextInputType.streetAddress,
      onChanged: (val) {
        onChanged(val);
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: CustomColors.grey2, width: 1),
        ),
        hintText: hint ?? "Adress...",
        hintStyle: CustomText.textStyle1(
          color: CustomColors.grey2,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }



  static Widget dateField({
    required TextEditingController controller,
    final String? hint,
    required Function(String) onChanged,
    final Color? color,
  }) {
    return TextFormField(
onTap: () {
  showDatePicker(
    context: Get.context!,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  ).then((value) {
    if (value != null) {
      final formatted = DateFormat('dd/MMM/yyyy').format(value);
      controller.text = formatted;
      onChanged(formatted);
    }
  });
},
      validator:  Validation.dateValidator ,
      controller: controller,
      readOnly: true,
      onChanged: (val) {
        onChanged(val);
      },
      
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.all(15),
          child: CustomImages.svgImage(ImagesPath.calendar, height: 24, width: 24),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: CustomColors.grey2, width: 1),
        ),
        
        fillColor:color?? Colors.transparent,
        filled: true,
        hintText: hint ?? "date...",
        hintStyle: CustomText.textStyle1(
          color: CustomColors.grey2,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          
        ),
      ),
    );
  }



  static Widget paragraphTextField(
    Function(String value) onChange, {
   final  String? hint,
    TextEditingController? controller,
    // String? Function(String?)? validator,
  }) {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: controller,
     validator: Validation.paragraphValidator,
      onChanged: (x) => onChange(x.trim()),
      maxLines: null,
      minLines: 6,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: CustomColors.grey2, width: 1),
        ),
        hintText: hint ?? "enter your message...",
        hintStyle: CustomText.textStyle1(
          color: CustomColors.grey2,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        
      ),
     
    );
  }


}
