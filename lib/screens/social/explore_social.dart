import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/explore_item.dart';
import '../../widget/follow_buttom.dart';
import '../../widget/more_buttom.dart';

class ExploreSocialScreen extends StatelessWidget {
  const ExploreSocialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
  
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return ExploreItem(
                  has_icon: true,
                  widget: Row(
                    children: [
                      MoreButton(),
                      FollowButtom(
                        is_follow: true,
                      ),
                    ],
                  ),
                  username: Text("@ghazalefathi"),
                  title: Text(
                    " غزاله فتحی",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  has_image: true,
                  image_post: Image.asset("lib/assets/images/ff.jpg",height: Get.height/3.5,width: Get.width, fit: BoxFit.cover,),
                  text_post: Text(
                      textDirection: TextDirection.rtl,
                      "تبریک و خسته نباشید به اعضای تیم ملی بابت برد لبنان و تدوام صدر نشینی "),
                   
                      day: Text("2 ساعت پیش" ,textDirection: TextDirection.rtl, style: TextStyle(fontSize: 11,color: Colors.grey[500]),),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
