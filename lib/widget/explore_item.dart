import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_football/assets/values/AppColors.dart';
import 'package:modern_football/models/social/post_model.dart';

import '../controllers/SocialController.dart';
import 'follow_buttom.dart';
import 'more_buttom.dart';

class ExploreItem extends StatelessWidget {
  SocialController socialController = Get.find();
  Text? username;
  String? image_profaile;
  String? logo_socialmedia;
  Text? title;
  String? imageAdress;
  Text? text_post;
  bool? has_icon_back;
  String? clock;
  Function()? fun;
  Function()? onTapLike;
  String? like;
  String? comment;
  Widget? widget;
  bool? has_image;
  bool? has_logo_socialmedia;
  bool? is_like;
  ImageProvider<Object>? provider;

  ExploreItem(
      {super.key,
      this.username,
      this.imageAdress,
      this.logo_socialmedia,
      this.image_profaile,
      this.onTapLike,
      this.is_like,
      this.fun,
      this.comment,
      this.like,
      this.has_image,
      this.has_icon_back,
      this.clock,
      this.text_post,
      this.widget,
      this.has_logo_socialmedia,
      this.title,
      this.provider}) {
    if (image_profaile == null) {
      provider = AssetImage('lib/assets/images/ic_player_default.png');
    } else {
      provider = NetworkImage(image_profaile!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          children: [
            has_icon_back == true
                ? Container(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        splashRadius: 1,
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: Color(AppColors.primary),
                        )),
                  )
                : SizedBox(),
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
                                      logo_socialmedia == null
                                          ? SizedBox()
                                          : Image.network(
                                              logo_socialmedia!,
                                              width: 20,
                                              height: 20,
                                            ),
                                      title!,
                                    ],
                                  )
                                : SizedBox(),
                            username!
                          ]),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          height: 55,
                          width: 55,
                          margin: EdgeInsets.only(top: 5),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: this.provider,
                          )),
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
                imageAdress == null
                    ? SizedBox()
                    : Image.network(
                        imageAdress!,
                        fit: BoxFit.cover,
                        width: Get.width,
                      ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: onTapLike,
                                icon: is_like == true
                                    ? Icon(
                                        Icons.favorite_outlined,
                                        color: Colors.red,
                                      )
                                    : Icon(Icons.favorite_outline_sharp)),
                            Text(
                              like!,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.toNamed('/post-details');
                                },
                                icon: Icon(Icons.mode_comment_outlined)),
                            Text(comment!,
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
                    child: Text(clock!,
                        textDirection: TextDirection.rtl,
                        style:
                            TextStyle(fontSize: 11, color: Colors.grey[500]))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
