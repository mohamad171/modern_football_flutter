class Team {
  int? id;
  String? name;
  String? faName;
  String? image;

  Team({this.id, this.name, this.faName, this.image});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    faName = json['fa_name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['fa_name'] = this.faName;
    data['image'] = this.image;
    return data;
  }
}