import 'package:modern_football/models/social/user_model.dart';

class PostModel {
  int? id;
  UserModel? user;
  String? text;
  int? comments;
  int? likes;
  bool? isLiked;
  bool? isFollow;
  String? image;
  Source? source;
  String? createdAt;
  String? updatedAt;
  
  PostModel(
      {this.id,
      this.user,
      this.text,
      this.comments,
      this.isFollow,
      this.likes,
      this.isLiked,
      this.image,
      this.source,
      this.createdAt,
      this.updatedAt});

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new UserModel.fromJson(json['user']) : null;
    text = json['text'];
    comments = json['comments'];
    likes = json['likes'];
    isLiked = json['is_liked'];
    isFollow = json['is_follow'];
    image = json['image'];
    source =
        json['source'] != null ? new Source.fromJson(json['source']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['text'] = this.text;
    data['comments'] = this.comments;
    data['likes'] = this.likes;
    data['is_liked'] = this.isLiked;
    data['is_follow'] = this.isFollow;
    data['image'] = this.image;
    if (this.source != null) {
      data['source'] = this.source!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}