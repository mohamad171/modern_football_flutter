import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:modern_football/models/social/comment_model.dart';
import 'package:modern_football/models/social/post_model.dart';
import 'package:modern_football/providers/api.dart';

class SocialController extends GetxController {
  var lst_post = <PostModel>[].obs;
  var lst_comment = <CommentModel>[].obs;
  TextEditingController commentController = TextEditingController();
  var selectet_post = PostModel().obs;
  var loading = false.obs;
  var indexPost = 0.obs;
  var loadingSendComment = false.obs;

  void GeneratFakePost() {
    loading(true);
    ApiProvider().GetPost().then((res) {
      if (res.isOk) {
        List body = res.body['results'];
        body.forEach((element) {
          lst_post.add(PostModel.fromJson(element));
        });
        loading(false);
      }
    });
  }

  void GeneratComment() {
    lst_comment.clear();
    ApiProvider().GetCooment(selectet_post.value.id).then((res) {
      if (res.isOk) {
        List body = res.body['results'];
        body.forEach((element) {
          lst_comment.add(CommentModel.fromJson(element));
        });
      }
    });
  }

  void like(index) {
    ApiProvider().Like(lst_post[index].id.toString()).then((res) {
      print(res.body);
    });
    lst_post[index].isLiked = true;
    lst_post.refresh();
  }

  void dislike(index) {
    ApiProvider().Dislike(lst_post[index].id.toString()).then((res) {
      print(res.body);
    });
    lst_post[index].isLiked = false;
    lst_post.refresh();
  }

  void sendComment(id) {
    if (commentController.text.isNotEmpty) {
      loadingSendComment(true);
      ApiProvider()
          .sendComment(id.toString(), commentController.text)
          .then((res) {
        print(res.body);
        print(id);
        if (res.isOk) {
          commentController.clear();
          loadingSendComment(false);
        }

      });

    }
  }
}
