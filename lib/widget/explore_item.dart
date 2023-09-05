import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_football/assets/values/AppColors.dart';

import 'follow_buttom.dart';
import 'more_buttom.dart';

class ExploreItem extends StatelessWidget {
  Text? id;
  ImageProvider<Object>? image;
  Text? title;
  Text? text_post;
  Image? image_post;
  Widget? widget;
  bool? has_image;
  ExploreItem({
    super.key,
    this.id,
    this.image,
    this.image_post,
    this.has_image,
    this.text_post,
    this.widget,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget!,
                Row(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [title!, id!]),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 55,
                      width: 55,
                      child: CircleAvatar(
                        
                        backgroundImage:
                            image ?? AssetImage("lib/assets/images/ff.jpg"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15), child: text_post!),
              has_image == true ? image_post! : SizedBox(),
            ],
          )
        ],
      ),
    );
  }
}
