import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_football/assets/values/AppColors.dart';

import 'follow_buttom.dart';
import 'more_buttom.dart';

class ExploreItem extends StatelessWidget {
  Text? username;
  ImageProvider<Object>? image_profaile;
  Image? logo_socialmedia;
  Text? title;
  Text? text_post;

  Text? day;
  Text? date;
  Image? image_post;
  Widget? widget;
  bool? has_image;
  bool? has_logo_socialmedia;
  ExploreItem({
    super.key,
    this.username,
    this.logo_socialmedia,
    this.image_profaile,
    this.image_post,
    this.has_image,
    this.date,
    this.day,
    this.text_post,
    this.widget,
    this.has_logo_socialmedia,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                (widget != null) ? widget! : Container(),
                Row(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          has_logo_socialmedia == true
                              ? Row(
                                  children: [
                                    logo_socialmedia != null
                                        ? logo_socialmedia!
                                        : SizedBox(),
                                    title!,
                                  ],
                                )
                              : SizedBox(),
                          username!
                        ]),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 55, 
                      width: 55,
                      child: CircleAvatar( backgroundImage: image_profaile ?? AssetImage("lib/assets/images/ic_player_default.png"),),
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
              image_post != null ? image_post! : SizedBox(),
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
                  margin: EdgeInsets.only(left: 15, bottom: 1),
                  alignment: Alignment.topLeft,
                  child: day!),
            ],
          ),
        ],
      ),
    );
  }
}
