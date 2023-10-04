import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../assets/values/AppColors.dart';

class OnFollowButtom extends StatelessWidget {
  // Text? text;
  double? width_buttom;
  bool? is_follow;
  String ? text;
  Function()? fun;
  OnFollowButtom({this.fun, this.is_follow, this.text, this.width_buttom, super.key});

  @override
  Widget build(BuildContext context) {
    return is_follow == true
        ? Container(
          margin: EdgeInsets.only(top: 5),
          child: TextButton(
            style: TextButton.styleFrom(
              side: BorderSide(color: Color(AppColors.primary))
            ),
              onPressed: fun,
              child: Text("لغو دنبال کردن",style: TextStyle(color: Colors.black),),
            ),
        )
        : SizedBox();
  }
}
