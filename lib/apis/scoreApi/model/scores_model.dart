class ScoreResponseModel {
  final int advisorId;
  final String scoreTransunion;
  final String scoreExperian;
  final String scoreEquifax;
  final List<dynamic> scoreList;
  final List<dynamic> deleteList;
  final List<dynamic> disputeList;
  final String error;

  ScoreResponseModel(
      {this.advisorId,
      this.scoreTransunion,
      this.scoreExperian,
      this.scoreEquifax,
      this.scoreList,
      this.deleteList,
      this.disputeList,
      this.error});

  factory ScoreResponseModel.fromJson(Map<String, dynamic> json) {
    return ScoreResponseModel(
      advisorId: json["advisorId"] != null ? json["advisorId"] : [],
      scoreTransunion: json["scoreTransunion"] != null
          ? (json["scoreTransunion"] != "-" ? json["scoreTransunion"] : "0")
          : "0",
      scoreExperian: json["scoreExperian"] != null
          ? (json["scoreExperian"] != "-" ? json["scoreExperian"] : "0")
          : "0",
      scoreEquifax: json["scoreEquifax"] != null
          ? (json["scoreEquifax"] != "-" ? json["scoreEquifax"] : "0")
          : "0",
      scoreList: json["listScores"] != null ? json["listScores"] : [],
      deleteList: json["listDeleted"] != null ? json["listDeleted"] : [],
      disputeList: json["listDispute"] != null ? json["listDispute"] : [],
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
