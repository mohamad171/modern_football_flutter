import 'package:modern_football/models/social/user_model.dart';

class PostModel {
  int? _id;
  User? _user;
  String? _text;
  String? _image;
  Source? _source;
  String? _createdAt;
  String? _updatedAt;

  Post(
      {int? id,
      User? user,
      String? text,
      String? image,
      Source? source,
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
    if (image != null) {
      this._image = image;
    }
    if (source != null) {
      this._source = source;
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
  User? get user => _user;
  set user(User? user) => _user = user;
  String? get text => _text;
  set text(String? text) => _text = text;
  String? get image => _image;
  set image(String? image) => _image = image;
  Source? get source => _source;
  set source(Source? source) => _source = source;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  PostModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
    _text = json['text'];
    _image = json['image'];
    _source =
        json['source'] != null ? new Source.fromJson(json['source']) : null;
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
    data['image'] = this._image;
    if (this._source != null) {
      data['source'] = this._source!.toJson();
    }
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
