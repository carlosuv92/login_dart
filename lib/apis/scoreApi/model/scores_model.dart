class ScoreResponseModel {
  final String scoreTransunion;
  final String scoreExperian;
  final String scoreEquifax;
  final String nameLead;
  final String error;

  ScoreResponseModel(
      {this.scoreTransunion,
      this.scoreExperian,
      this.scoreEquifax,
      this.error,
      this.nameLead});

  factory ScoreResponseModel.fromJson(Map<String, dynamic> json) {
    return ScoreResponseModel(
      scoreTransunion: json["scoreTransunion"] != null ? json["scoreTransunion"] : "",
      scoreExperian: json["scoreExperian"] != null ? json["scoreExperian"] : "",
      scoreEquifax: json["scoreEquifax"] != null ? json["scoreEquifax"] : "",
      nameLead: json["nameLead"] != null ? json["nameLead"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class ScoreRequestModel {
  String account;
  String token;

  ScoreRequestModel({
    this.account,
    this.token,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'account': account.trim(),
      'token': token.trim(),
    };
    return map;
  }
}
