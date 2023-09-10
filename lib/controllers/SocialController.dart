import 'package:get/get.dart';

import 'package:modern_football/models/social/post_model.dart';
import 'package:modern_football/providers/api.dart';

class SocialController extends GetxController {
  var lst_post_fake = <PostModel>[].obs;
  var lst_post_fake_show = <PostModel>[].obs;
  void GeneratFakePost() {
    ApiProvider().GetPost().then((res) {
      List body = res.body['posts'];
      body.forEach((element) {
        lst_post_fake.add(PostModel.fromJson(element));
      });
      lst_post_fake_show.addAll(lst_post_fake);
    });
  }
}
