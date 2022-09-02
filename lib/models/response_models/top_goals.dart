import 'package:modern_football/models/response_models/competition.dart';
import 'package:modern_football/models/response_models/team.dart';

class TopGoals {
  int? id;
  String? name;
  String? image;
  int? score;
  int? penalty;
  Team? team;
  Competition? competition;

  TopGoals(
      {this.id,
        this.name,
        this.image,
        this.score,
        this.penalty,
        this.team,
        this.competition});

  TopGoals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    score = json['score'];
    penalty = json['penalty'];
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
    competition = json['competition'] != null
        ? new Competition.fromJson(json['competition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['score'] = this.score;
    data['penalty'] = this.penalty;
    if (this.team != null) {
      data['team'] = this.team!.toJson();
    }
    if (this.competition != null) {
      data['competition'] = this.competition!.toJson();
    }
    return data;
  }
}
