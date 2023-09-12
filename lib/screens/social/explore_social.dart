import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_football/assets/values/AppColors.dart';
import 'package:modern_football/models/social/post_model.dart';

import '../../controllers/SocialController.dart';
import '../../widget/explore_item.dart';
import '../../widget/follow_buttom.dart';
import '../../widget/more_buttom.dart';

class ExploreSocialScreen extends StatelessWidget {
  ExploreSocialScreen({super.key});

  SocialController socialController = Get.find();
  @override
  Widget build(BuildContext context) {
    socialController.GeneratFakePost();
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Expanded(child: Obx(() {
            return socialController.loading.value == true
                ? Center(
                    child: CircularProgressIndicator(
                      color: Color(AppColors.primary),
                    ),
                  )
                : ListView.builder(
                    itemCount: socialController.lst_post.length,
                    itemBuilder: (context, index) {
                      PostModel post = socialController.lst_post[index];
                      return ExploreItem(
                          is_like: post.isLiked,
                          comment: post.comments.toString(),
                          like: post.likes.toString(),
                          image_profaile: post.user?.profileImage,
                          fun: () {
                            socialController.selectet_post.value = post;
                            Get.toNamed('/post-details');
                          },
                          logo_socialmedia: post.source!.logo,
                          has_logo_socialmedia: true,
                          widget: Row(
                            children: [
                              MoreButton(),
                              FollowButtom(
                                is_follow: true,
                              ),
                            ],
                          ),
                          username: Text("@${post.user!.socialUsername}"),
                          title: Text(
                            "  ${post.user!.firstName} ${post.user!.lastName}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          has_image: true,
                          imageAdress: post.image,
                          text_post: Text(
                            "${post.text}",
                            textDirection: TextDirection.rtl,
                          ),
                          clock: "2 ساعت پیش");
                    },
                  );
          }))
        ],
      ),
    ));
  }
}
