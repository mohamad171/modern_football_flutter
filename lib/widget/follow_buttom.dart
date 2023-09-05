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
        ? TextButton(
            onPressed: () {},
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 3),
              width: width_buttom ?? Get.width / 4.5,
              child: Text("دنبال کردن",style: TextStyle(color: Colors.black),),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(AppColors.primary)),
                  borderRadius: BorderRadius.circular(5)),
            ),
          )
        : SizedBox();
  }
}
