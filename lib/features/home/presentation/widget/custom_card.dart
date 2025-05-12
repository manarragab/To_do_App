import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:to_do_app/core/colors/custom_colors.dart';
import 'package:to_do_app/core/images/custom_images.dart';
import 'package:to_do_app/core/images/images_path.dart';
import 'package:to_do_app/core/routes/custom_pages.dart';
import 'package:to_do_app/core/text/custom_text.dart';

class CustomCard extends StatelessWidget {
  final String? status;
  final Color? textColor;
  final Color? backgroundColor;
  final String? path;
    final Color? textStatusColor;

  
  const CustomCard({super.key, this.status, this.textColor, this.backgroundColor, this.path, this.textStatusColor});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
    
      child: Row(
        children: [
          CustomImages.assetImage(ImagesPath.baskett , width: 50, height: 50),
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
                      width: Get.width /2.5,
                      child: Text('Grocery Shopping App',
                          overflow: TextOverflow.ellipsis,
                          style: CustomText.textStyle1(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: CustomColors.balckk)),
                    ),
                 
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
                      
                      decoration: BoxDecoration(
                        color: backgroundColor?? CustomColors.lightPurple,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(status ?? "",
                            style: CustomText.textStyle1(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color:textColor?? CustomColors.balckk)),
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
                         0 , 0),
                          items: [
                        PopupMenuItem(child: Text('Edit') , onTap: (){

                        },),
                       
                        PopupMenuItem(textStyle: TextStyle(color: CustomColors.orangee),
                        onTap: (){

                        },child: Text('Delete') ,
                        ),
                        PopupMenuItem(
  child: Text('More'),
  onTap: () {
    Future.delayed(Duration.zero, () {
      Get.toNamed(CustomPages.details, arguments: [
        ImagesPath.baskett,
        'Grocery Shopping App',
                      'This application is designed for super shops. By using this application they can enlist all their products in one place and can deliver. Customers will get a one-stop solution for their daily shopping.',
        'Low',
        '7/3/2002',
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
                  width: Get.width/1.5,
                  child: Text(
                      'This application is designed for super shops. By using this application they can enlist all their products in one place and can deliver. Customers will get a one-stop solution for their daily shopping.',
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
                          CustomImages.svgImage( path?? ImagesPath.purple),
                          SizedBox(width: 5),
                          Text('Low',
                              style: CustomText.textStyle1(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: textStatusColor?? Colors.blue,
                              )),
                        ],
                      ),
                      Text('7/3/2002',
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
