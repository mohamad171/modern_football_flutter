import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_football/assets/values/AppColors.dart';

import 'follow_buttom.dart';
import 'more_buttom.dart';

class ExploreItem extends StatelessWidget {
  Text? username;
  ImageProvider<Object>? image_profaile;
  Text? title;
  Text? text_post;
  Icon? icon;
  Text? day;
  Text? date;
  Image? image_post;
  Widget? widget;
  bool? has_image;
  bool? has_icon;
  ExploreItem({
    super.key,
    this.username,
    this.icon,
    this.image_profaile,
    this.image_post,
    this.has_image,
    this.date,
    this.day,
    this.text_post,
    this.widget,
    this.has_icon,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height/1.95,
      color: Colors.white,
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
                (widget != null ) ? widget! : Container(),
                Row(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              has_icon == true
                                  ? Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      child: icon ??
                                          Icon(
                                            Icons.telegram,
                                            size: 20,
                                            color: Color(AppColors.blue),
                                          ),
                                    )
                                  : SizedBox(),
                              title!,
                            ],
                          ),
                          username!
                        ]),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 55,
                      width: 55,
                      child: CircleAvatar(
                        backgroundImage:
                            image_profaile ?? AssetImage("lib/assets/images/ff.jpg"),
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
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: text_post!),
              has_image == true ? image_post! : SizedBox(),


              // tarikh
             
              Container(
               margin: EdgeInsets.only(top: 5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite_outline_sharp)),
                          Text(
                            "228",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.mode_comment_outlined)),
                          Text("569",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                             
                              
                              
                           
                              onPressed: () {},
                              icon: Icon(Icons.send_outlined)),
                          Text("235",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ]),
              ),
              Container(
                margin: EdgeInsets.only(left: 15,bottom: 1),
                alignment: Alignment.topLeft,
                child: day!),
            ],
          ),
        ],
      ),
    );
  }
}


