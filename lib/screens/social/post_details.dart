import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/comment.dart';
import '../../widget/explore_item.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          ExploreItem(
            username: Text("@ghazalefathi"),
            title: Text(
              " غزاله فتحی",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            has_image: true,
            image_post: Image.asset(
              "lib/assets/images/ff.jpg",
              height: Get.height / 3.5,
              width: Get.width,
              fit: BoxFit.cover,
            ),
            text_post: Text(
                textDirection: TextDirection.rtl,
                "تبریک و خسته نباشید به اعضای تیم ملی بابت برد لبنان و تدوام صدر نشینی "),
            day: Text(
              "2 ساعت پیش",
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 11, color: Colors.grey[500]),
            ),
          ),
          Container(
            width: Get.width,
            color: Colors.grey[300],
            height: 1,
          ),
          Container(
            child: Expanded(
              child: ListView.builder(
                itemCount: 8,
               itemBuilder: (context, index) {
                 return Comment(
                  image_profaile: AssetImage("lib/assets/images/dd.jpg"),
                 comment: Text("بسیار عالی"),
                  username: Text("@edrismazhari",style: TextStyle(fontSize: 11),),
                  date: Text("3 ساعت پیش",
                  textDirection: TextDirection.rtl,style: TextStyle(fontSize: 11,color: Colors.grey[500]),
              
                  ),
                );
               },
              ),
            ),
          )
        ],
      ),
    ));
  }
}
