class UserLoginRequestModel {
  String phoneNumber;
  String password;

  UserLoginRequestModel({
    required this.phoneNumber,
    required this.password,
  });

  // Converting user object to Json format
  Map<String, dynamic> toJson() {
    return {"phoneNumber": phoneNumber, "password": password};
  }
}
