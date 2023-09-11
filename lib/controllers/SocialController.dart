import 'package:get/get.dart';
import 'package:modern_football/models/social/comment_model.dart';
import 'package:modern_football/models/social/post_model.dart';
import 'package:modern_football/providers/api.dart';
import 'package:modern_football/widget/comment.dart';
import '../models/social/user_model.dart';

class SocialController extends GetxController {
  var lst_post = <PostModel>[].obs;
  var lst_comment = <CommentModel>[].obs;
  var selectet_post = PostModel().obs;
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

  void GeneratComment() {
    lst_comment.clear();
    ApiProvider().GetCooment().then((res) {
      List body = res.body['results'];
      body.forEach((element) {
        lst_comment.add(CommentModel.fromJson(element));
      });
      
    });
  }
}
