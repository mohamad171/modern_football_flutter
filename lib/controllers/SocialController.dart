import 'package:flutter/cupertino.dart'; 
import 'package:get/get.dart';
import 'package:modern_football/models/social/comment_model.dart';
import 'package:modern_football/models/social/post_model.dart';
import 'package:modern_football/providers/api.dart';

class SocialController extends GetxController {
  var lstPost = <PostModel>[].obs;

  var lstComment = <CommentModel>[].obs;

  TextEditingController commentController = TextEditingController();
  var selectetPost = PostModel().obs;
  var loading = false.obs;

  var isLoadingComments = false.obs;
  var indexPost = 0.obs;
  var loadingSendComment = false.obs;

  void GeneratFakePost() {
    loading(true);
    ApiProvider().GetPost().then((res) {
      if (res.isOk) {
        List body = res.body['results'];
        body.forEach((element) {
          lstPost.add(PostModel.fromJson(element));
        });
        loading(false);
      }
    });
  }

  void GeneratComment() {
    isLoadingComments(true);
    lstComment.clear();
    ApiProvider().GetCooment(selectetPost.value.id).then((res) {
      if (res.isOk) {
        List body = res.body['results'];
        body.forEach((element) {
          lstComment.add(CommentModel.fromJson(element));
        });
        isLoadingComments(false);
      }
    });
  }

  void like(index) {
    ApiProvider().Like(lstPost[index].id.toString()).then((res) {
      print(res.body);
    });
    lstPost[index].isLiked = true;
    lstPost.refresh();
  }

  void dislike(index) {
    ApiProvider().Dislike(lstPost[index].id.toString()).then((res) {
      print(res.body);
    });
    lstPost[index].isLiked = false;
    lstPost.refresh();
  }

  void sendComment(id) {
    if (commentController.text.isNotEmpty) {
      loadingSendComment(true);
      ApiProvider()
          .sendComment(id.toString(), commentController.text)
          .then((res) {
        if (res.isOk) {
          GeneratComment();
          commentController.clear();
          loadingSendComment(false);
        }
      });
    }
  }

  void follow(id, int index) {
    print(id);
    ApiProvider().follow(id).then((res) {
      print(res.body);
      print(res.statusCode);
      print(res.statusText);
    });
    lstPost[index].isFollow = true;
    lstPost.refresh();
  }

  void unFollow(id, int index) {
    ApiProvider().unFollow(id).then((res) {});
    lstPost[index].isFollow = false;
    lstPost.refresh();
  }
}
