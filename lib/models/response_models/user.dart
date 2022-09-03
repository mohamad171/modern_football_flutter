class User {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? profile_image;

  User({this.id, this.username, this.firstName, this.lastName, this.email,this.profile_image});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    profile_image = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['profile_image'] = this.profile_image;
    return data;
  }
}
