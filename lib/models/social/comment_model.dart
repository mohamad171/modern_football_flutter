



import 'package:modern_football/models/social/user_model.dart';

class CommentModel {
  int? _id;
  UserModel? _user;
  String? _text;
  String? _createdAt;
  String? _updatedAt;

  CommentModel(
      {int? id,
      UserModel? user,
      String? text,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (user != null) {
      this._user = user;
    }
    if (text != null) {
      this._text = text;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  UserModel? get user => _user;
  set user(UserModel? user) => _user = user;
  String? get text => _text;
  set text(String? text) => _text = text;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  CommentModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _user = json['user'] != null ? new UserModel.fromJson(json['user']) : null;
    _text = json['text'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    if (this._user != null) {
      data['user'] = this._user!.toJson();
    }
    data['text'] = this._text;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}

