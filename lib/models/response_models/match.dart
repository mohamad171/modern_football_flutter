import 'package:modern_football/models/response_models/standing.dart';
import 'package:modern_football/models/response_models/team.dart';
import 'package:shamsi_date/shamsi_date.dart';

class Match {
  int? id;
  Team? homeTeam;
  Team? awayTeam;
  int? homeTeamScore;
  int? awayTeamScore;
  String? matchDate;
  String? j_matchdate;
  String? matchtime;
  int? matchDay;

  Standing? home_standing;
  Standing? away_standing;

  Match(
      {this.id,
        this.homeTeam,
        this.awayTeam,
        this.homeTeamScore,
        this.awayTeamScore,
        this.matchDate,
        this.matchDay,
        this.matchtime,
        this.j_matchdate,
      this.home_standing,this.away_standing});

  Match.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    homeTeam = json['home_team'] != null
        ? new Team.fromJson(json['home_team'])
        : null;
    awayTeam = json['away_team'] != null
        ? new Team.fromJson(json['away_team'])
        : null;
    home_standing = json['home_standing'] != null
        ? new Standing.fromJson(json['home_standing'])
        : null;
    away_standing = json['away_standing'] != null
        ? new Standing.fromJson(json['away_standing'])
        : null;
    homeTeamScore = json['home_team_score'];
    awayTeamScore = json['away_team_score'];
    matchDate = json['match_date'];
    matchDay = json['match_day'];
    matchtime = json['matchtime'];
    j_matchdate = json['j_matchdate'];
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
    if (this.home_standing != null) {
      data['home_standing'] = this.home_standing!.toJson();
    }
    if (this.away_standing != null) {
      data['away_standing'] = this.away_standing!.toJson();
    }
    data['home_team_score'] = this.homeTeamScore;
    data['away_team_score'] = this.awayTeamScore;
    data['match_date'] = this.matchDate;
    data['match_day'] = this.matchDay;
    data['matchtime'] = this.matchtime;
    data['j_matchdate'] = this.j_matchdate;
    return data;
  }

  String get_date(){
    if(this.matchDate != null){
      DateTime dateTime = DateTime.parse(this.matchDate!);
      var j = dateTime.toJalali();
      return "${j.formatter.wN} ${j.formatter.dd} ${j.formatter.mN}";
    }
    return "نامشخص";

  }
}
