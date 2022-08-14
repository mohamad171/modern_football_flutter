import 'package:modern_football/models/response_models/team.dart';

class Match {
  int? id;
  Team? homeTeam;
  Team? awayTeam;
  int? homeTeamScore;
  int? awayTeamScore;
  String? matchDate;
  int? matchDay;

  Match(
      {this.id,
        this.homeTeam,
        this.awayTeam,
        this.homeTeamScore,
        this.awayTeamScore,
        this.matchDate,
        this.matchDay});

  Match.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    homeTeam = json['home_team'] != null
        ? new Team.fromJson(json['home_team'])
        : null;
    awayTeam = json['away_team'] != null
        ? new Team.fromJson(json['away_team'])
        : null;
    homeTeamScore = json['home_team_score'];
    awayTeamScore = json['away_team_score'];
    matchDate = json['match_date'];
    matchDay = json['match_day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.homeTeam != null) {
      data['home_team'] = this.homeTeam!.toJson();
    }
    if (this.awayTeam != null) {
      data['away_team'] = this.awayTeam!.toJson();
    }
    data['home_team_score'] = this.homeTeamScore;
    data['away_team_score'] = this.awayTeamScore;
    data['match_date'] = this.matchDate;
    data['match_day'] = this.matchDay;
    return data;
  }
}
