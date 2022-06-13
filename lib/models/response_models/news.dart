class News {
  int? id;
  String? title;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? source;
  List<int>? tags;

  News(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.source,
      this.tags});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = "https://modern-football.ir" + json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    source = json['source'];
    tags = json['tags'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['source'] = this.source;
    data['tags'] = this.tags;
    return data;
  }
}
