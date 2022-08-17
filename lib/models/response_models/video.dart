class Video {
  int? id;
  String? timeago;
  String? title;
  String? image;
  String? duration;
  Null? video;
  String? createdAt;
  String? updatedAt;
  String? link;
  int? source;
  List<int>? tags;

  Video(
      {this.id,
      this.timeago,
      this.title,
      this.image,
      this.duration,
      this.video,
      this.createdAt,
      this.updatedAt,
      this.link,
      this.source,
      this.tags});

  Video.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    timeago = json['timeago'];
    title = json['title'];
    image = json['image'];
    duration = json['duration'];
    video = json['video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    link = json['link'];
    source = json['source'];
    tags = json['tags'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['timeago'] = this.timeago;
    data['title'] = this.title;
    data['image'] = this.image;
    data['duration'] = this.duration;
    data['video'] = this.video;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['link'] = this.link;
    data['source'] = this.source;
    data['tags'] = this.tags;
    return data;
  }
}
