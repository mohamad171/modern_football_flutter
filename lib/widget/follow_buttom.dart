import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../assets/values/AppColors.dart';

class FollowButtom extends StatelessWidget {
  // Text? text;
  double? width_buttom;
  bool? is_follow;
  FollowButtom({this.is_follow, this.width_buttom, super.key});

  @override
  Widget build(BuildContext context) {
    return is_follow == true
        ? Container(
          margin: EdgeInsets.only(top: 5),
          child: TextButton(
            style: TextButton.styleFrom(
              side: BorderSide(color: Color(AppColors.primary))
            ),
              onPressed: () {},
              child: Text("دنبال کردن",style: TextStyle(color: Colors.black),),
            ),
        )
        : SizedBox();
  }
}
