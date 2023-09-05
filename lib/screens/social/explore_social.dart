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
      body: Column(
        children: [
          ExploreItem(
            widget: Row(
              children: [
                MoreButton(),
                FollowButtom(
                  is_follow: true,
                ),
              ],
            ),
            id: Text("@ghazalefathi"),
            title: Text(
              " غزاله فتحی",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            has_image: true,
            image_post: Image.asset("lib/assets/images/ff.jpg"),
            text_post: Text("ما فراموش نشدیم "),
          ),
        ],
      ),
    ));
  }
}
