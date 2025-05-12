import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:to_do_app/core/colors/custom_colors.dart';
import 'package:to_do_app/core/text/custom_text.dart';

class CardItem extends StatelessWidget{
  final String title;
  final String? phone;
  final String? level;
  final String? exp;
  final String? address;
  const CardItem({super.key, required this.title, this.phone, this.level, this.exp, this.address});


  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: Get.width,
      decoration: BoxDecoration(
        color: CustomColors.lightgrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment:
CrossAxisAlignment.start,       
 children: [
 Text(title,
                    style: CustomText.textStyle1(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: CustomColors.lightBlack)),
               
 SizedBox(height: 5),
              Text('My Tasks',
                    style: CustomText.textStyle1(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: CustomColors.darkGrey
                        )),
               
      ],),
    );
  }


  
}