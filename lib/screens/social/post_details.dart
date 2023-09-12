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
    var post = socialController.selectet_post.value;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          ExploreItem(
              is_like: post.isLiked,
              comment: post.comments.toString(),
              like: post.likes.toString(),
              has_icon_back: true,
              username: Text("@${post.user!.socialUsername}"),
              title: Text(
                " غزاله فتحی",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              has_image: true,
              imageAdress: post.image,
              text_post: Text(textDirection: TextDirection.rtl, "${post.text}"),
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
