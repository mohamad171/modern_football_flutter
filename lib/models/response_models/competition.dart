class Competition {
  int? id;
  String? name;
  String? faName;
  String? code;
  int? currentMatchday;
  String? image;
  int? numberOfTeams;
  int? foundYear;
  String? confedrasion;
  String? country;

  Competition(
      {this.id,
      this.name,
      this.faName,
      this.code,
      this.currentMatchday,
      this.image,
      this.numberOfTeams,
      this.foundYear,
      this.confedrasion,
      this.country});

  Competition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    faName = json['fa_name'];
    code = json['code'];
    currentMatchday = json['current_matchday'];
    image = json['image'];
    numberOfTeams = json['number_of_teams'];
    foundYear = json['found_year'];
    confedrasion = json['confedrasion'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['fa_name'] = this.faName;
    data['code'] = this.code;
    data['current_matchday'] = this.currentMatchday;
    data['image'] = this.image;
    data['number_of_teams'] = this.numberOfTeams;
    data['found_year'] = this.foundYear;
    data['confedrasion'] = this.confedrasion;
    data['country'] = this.country;
    return data;
  }
}
