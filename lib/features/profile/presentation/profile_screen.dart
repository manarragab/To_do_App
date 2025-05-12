import 'package:flutter/material.dart';
import 'package:to_do_app/core/enums/enums.dart';
import 'package:to_do_app/features/profile/presentation/widget/card_item.dart';

class ProfileScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Profile"),
       
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
       

          ...List.generate(Info.values.length, (index){
            return CardItem(
              title: Info.values[index].name,
             
            );
          })
          ],
        ),
      ),
    );
  }
  
}