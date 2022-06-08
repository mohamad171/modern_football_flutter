class SendCodeRequest {
  var phone_number;

  SendCodeRequest(this.phone_number);

  Map to_json() => {"phoneNumber": this.phone_number};
}
