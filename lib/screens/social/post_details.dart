import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/SocialController.dart';
import '../../widget/comment.dart';
import '../../widget/explore_item.dart';

class PostDetailsScreen extends StatelessWidget {
  PostDetailsScreen({super.key});
  SocialController socialController = Get.find();
  @override
  Widget build(BuildContext context) {
    socialController.GeneratComment();
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          ExploreItem(
              has_icon_back: true,
              username: Text(
                  "@${socialController.selectet_post.value.user!.socialUsername}"),
              title: Text(
                " غزاله فتحی",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              has_image: true,
              imageAdress: socialController.selectet_post.value.image,
              text_post: Text(
                  textDirection: TextDirection.rtl,
                  "${socialController.selectet_post.value.text}"),
              clock: "2 ساعت پیش"),
          Container(
            width: Get.width,
            color: Colors.grey[300],
            height: 1,
          ),
          Container(
            child: Expanded(
                child: Obx(
              () => ListView.builder(
                itemCount: socialController.lst_comment.length,
                itemBuilder: (context, index) {
                  var comment = socialController.lst_comment[index];
                  return Comment(
                    image_profaile: comment.user?.profileImage,
                    comment: Text("${comment.text}"),
                    username: Text(
                      "@${comment.user!.socialUsername}",
                      style: TextStyle(fontSize: 11),
                    ),
                    clock: "3 ساعت پیش",
                  );
                },
              ),
            )),
          )
        ],
      ),
    ));
  }
}
