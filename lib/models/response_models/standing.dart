import 'package:modern_football/models/response_models/team.dart';

class Standing {
  int? id;
  Team? team;
  int? position;
  int? played;
  int? won;
  int? drawn;
  int? lost;
  int? points;
  int? goalsFor;
  int? goalsAgainst;
  int? goalDifference;
  String? recentMatch;

  Standing(
      {this.id,
        this.team,
        this.position,
        this.played,
        this.won,
        this.drawn,
        this.lost,
        this.points,
        this.goalsFor,
        this.goalsAgainst,
        this.goalDifference,
        this.recentMatch});

  Standing.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
    position = json['position'];
    played = json['played'];
    won = json['won'];
    drawn = json['drawn'];
    lost = json['lost'];
    points = json['points'];
    goalsFor = json['goals_for'];
    goalsAgainst = json['goals_against'];
    goalDifference = json['goal_difference'];
    recentMatch = json['recent_match'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.team != null) {
      data['team'] = this.team!.toJson();
    }
    data['position'] = this.position;
    data['played'] = this.played;
    data['won'] = this.won;
    data['drawn'] = this.drawn;
    data['lost'] = this.lost;
    data['points'] = this.points;
    data['goals_for'] = this.goalsFor;
    data['goals_against'] = this.goalsAgainst;
    data['goal_difference'] = this.goalDifference;
    data['recent_match'] = this.recentMatch;
    return data;
  }
}

