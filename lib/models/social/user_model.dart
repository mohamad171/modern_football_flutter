class UserModel {
  int? _id;
  String? _socialUsername;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _profileImage;
  
  UserModel(
      {int? id,
      String? socialUsername,
      String? firstName,
      String? lastName,
      String? email,
      String? profileImage}) {
    if (id != null) {
      this._id = id;
    }
    if (socialUsername != null) {
      this._socialUsername = socialUsername;
    }
    if (firstName != null) {
      this._firstName = firstName;
    }
    if (lastName != null) {
      this._lastName = lastName;
    }
    if (email != null) {
      this._email = email;
    }
    if (profileImage != null) {
      this._profileImage = profileImage;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get socialUsername => _socialUsername;
  set socialUsername(String? socialUsername) =>
      _socialUsername = socialUsername;
  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get lastName => _lastName;
  set lastName(String? lastName) => _lastName = lastName;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get profileImage => _profileImage;
  set profileImage(String? profileImage) => _profileImage = profileImage;

  UserModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _socialUsername = json['social_username'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['social_username'] = this._socialUsername;
    data['first_name'] = this._firstName;
    data['last_name'] = this._lastName;
    data['email'] = this._email;
    data['profile_image'] = this._profileImage;
    return data;
  }
}

class Source {
  int? _id;
  String? _name;
  String? _logo;

  Source({int? id, String? name, String? logo}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (logo != null) {
      this._logo = logo;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get logo => _logo;
  set logo(String? logo) => _logo = logo;

  Source.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['logo'] = this._logo;
    return data;
  }
}