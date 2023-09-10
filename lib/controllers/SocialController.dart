import 'package:get/get.dart';
import 'package:modern_football/models/social/post_model.dart';
import 'package:modern_football/providers/api.dart';
import '../models/social/user_model.dart';

class SocialController extends GetxController {
  var lst_post = <PostModel>[].obs;
var loading = false.obs;
  void GeneratFakePost() {
    loading(true);
    ApiProvider().GetPost().then((res) {
      List body = res.body['results'];
      body.forEach((element) {
        lst_post.add(PostModel.fromJson(element));
      });
      loading(false);
    });
  }
}
