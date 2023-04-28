import 'package:modern_football/custom_messages.dart';
import 'package:timeago/timeago.dart' as timeago;

class News {
  int? id;
  String? title;
  String? description;
  String? shortdescription;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? source;
  List<int>? tags;
  String? timeage_;

  News(
      {this.id,
      this.title,
      this.description,
      this.shortdescription,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.source,
      this.tags,
      this.timeage_});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    shortdescription = json['shortdescription'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    source = json['source'];
    tags = json['tags'].cast<int>();
    timeage_ = json['timeago'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['shortdescription'] = this.shortdescription;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['source'] = this.source;
    data['tags'] = this.tags;
    data['timeage'] = this.timeage_;
    return data;
  }

  String get_created_at(){
    timeago.setLocaleMessages('fa', PersianLanguage());
    DateTime dateTime = DateTime.parse(this.createdAt!);
    return timeago.format(dateTime,locale: "fa");
  }
}
