import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Comment extends StatelessWidget {
  Text? date;
  Text? username;
  Text? comment;

  ImageProvider<Object>? image_profaile;
  Comment(
      {this.image_profaile, this.username,this.comment, this.date, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      // color: Colors.red,
      child: Column(children: [
       
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 15,top: 8),
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
                      backgroundImage: image_profaile ??
                          AssetImage("lib/assets/images/ff.jpg"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        
       Container(
          margin: EdgeInsets.only(left: 15),
          alignment: Alignment.topLeft,
          child: date,
        ),
      ]),
    );
  }
}
