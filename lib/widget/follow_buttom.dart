import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../assets/values/AppColors.dart';

class FollowButtom extends StatelessWidget {
  // Text? text;
double? width_buttom;
bool? is_Follow;
  String ? text;
  Function()? fun;
  FollowButtom({this.fun, this.is_Follow, this.text, this.width_buttom, super.key});

  @override
  Widget build(BuildContext context) {
    return 
         Container(
          margin: EdgeInsets.only(top: 5),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: is_Follow == null || is_Follow == false ?   Colors.white:Color(AppColors.primary),
              side: BorderSide(color: Color(AppColors.primary))
            ),
              onPressed: fun,
              child: is_Follow == null || is_Follow == false ? Text("دنبال کردن",style: TextStyle(color: Colors.black),) : Text("لغو دنبال کردن",style: TextStyle(color: Colors.white),)
            ),
        );
        
  }
}
