class LoginResponseModel {
  final String token;
  final String error;
  final String nameLead;

  LoginResponseModel({this.token, this.error, this.nameLead});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["access_token"] != null ? json["access_token"] : "",
      nameLead: json["nameLead"] != null ? json["nameLead"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class LoginRequestModel {
  String account;
  String password;

  LoginRequestModel({
    this.account,
    this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'account': account.trim(),
      'password': password.trim(),
    };

    return map;
  }
}
