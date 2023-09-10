import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_football/assets/values/AppColors.dart';

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
                      var post = socialController.lst_post[index];
                      return ExploreItem(
                        logo_socialmedia: (post.source != null) ? Image.network("${post.source!.logo}",height: 20,width: 20,) : null,
                        has_logo_socialmedia: true,
                        widget: Row(
                          children: [
                            MoreButton(),
                            FollowButtom(
                              is_follow: true,
                            ),
                          ],
                        ),
                        username: Text( "@${post.user!.socialUsername}"),
                        title: Text(
                          "  ${post.user!.firstName} ${post.user!.lastName}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        has_image: true,
                        image_post: (post.image != null)
                            ? Image.network(
                                "${post.image}",
                                height: Get.height / 3.5,
                                width: Get.width,
                                fit: BoxFit.cover,
                              )
                            : null,
                        text_post: Text("${post.text}", textDirection:TextDirection.rtl ,),
                        day: Text(
                          "2 ساعت پیش",
                          textDirection: TextDirection.rtl,
                          style:
                              TextStyle(fontSize: 11, color: Colors.grey[500]),
                        ),
                      );
                    },
                  );
          }))
        ],
      ),
    ));
  }
}
