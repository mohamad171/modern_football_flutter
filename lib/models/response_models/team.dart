import 'package:modern_football/models/response_models/competition.dart';

class Team {
  int? id;
  String? name;
  String? faName;
  String? image;
  Competition? competition;

  Team({this.id, this.name, this.faName, this.image,this.competition});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    faName = json['fa_name'];
    image = json['image'];
    competition = json['competition'] != null
        ? new Competition.fromJson(json['competition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['fa_name'] = this.faName;
    data['image'] = this.image;
    if (this.competition != null) {
      data['competition'] = this.competition!.toJson();
    }
    return data;
  }
}