class CheckCodeResponse {
  String? status;
  String? token;
  String? userid;

  CheckCodeResponse({this.status, this.token, this.userid});

  CheckCodeResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    userid = json['userid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['token'] = this.token;
    data['userid'] = this.userid;
    return data;
  }
}
