import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Comment extends StatelessWidget {
  String? clock;
  Text? username;
  Text? comment;
  ImageProvider<Object>? provider;
  String? image_profaile;
  Comment(
      {this.image_profaile,
      this.username,
      this.comment,
      this.clock,
      this.provider,
      super.key}) {
    if (image_profaile == null) {
      provider = AssetImage('lib/assets/images/ic_player_default.png');
    } else {
      provider = NetworkImage(image_profaile!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: Column(children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 15, top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    username!,
                    comment!,
                  ]),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: this.provider),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15),
          alignment: Alignment.topLeft,
          child: Text(clock!,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 11, color: Colors.grey[500])),
        ),
      ]),
    );
  }
}
