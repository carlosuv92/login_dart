import 'package:devcredit/apis/scoreApi/api/api_score_service.dart';
import 'package:devcredit/apis/scoreApi/model/scores_model.dart';
import 'package:flutter/material.dart';

class ScoreState with ChangeNotifier {
  bool _loading = false;
  int _advisorId;
  String _scoreEquifax = "0";
  String _scoreExperian = "0";
  String _scoreTransunion = "0";
  List<dynamic> _scoreList = [];
  List<dynamic> _deleteList = [];
  List<dynamic> _disputeList = [];
  ScoreRequestModel requestModel = new ScoreRequestModel();

  int getAdvisorId() => _advisorId;
  String getScoreEQF() => _scoreEquifax;
  String getScoreEXP() => _scoreExperian;
  String getScoreTU() => _scoreTransunion;
  bool isLoading() => _loading;
  List<dynamic> getScoreGraphData() => _scoreList;
  List<dynamic> getDeletedData() => _deleteList;
  List<dynamic> getDisputeData() => _disputeList;

  Future<void> getScore(String user, String pass) async {
    _loading = true;
    if (user.isNotEmpty && pass.isNotEmpty) {
      requestModel.account = user;
      requestModel.token = pass;
      APIGetScore apiGetScore = new APIGetScore();
      await apiGetScore.getScore(requestModel).then((value) {
        if (value != null) {
          _advisorId = value.advisorId;
          _scoreEquifax = value.scoreEquifax;
          _scoreExperian = value.scoreExperian;
          _scoreTransunion = value.scoreTransunion;
          _scoreList = value.scoreList;
          _deleteList = value.deleteList;
          _disputeList = value.disputeList;
          print(value.advisorId.toString());
        } else {
          print(value.error);
        }
      });
    }
    _loading = false;
  }
}
