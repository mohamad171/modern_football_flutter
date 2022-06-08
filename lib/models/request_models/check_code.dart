class CheckCodeRequest {
  var phone_number;
  var code;
  CheckCodeRequest(this.phone_number, this.code);
  Map to_json() => {"phoneNumber": phone_number, "code": code};
}
