import 'package:devcredit/apis/loginApi/api/api_service.dart';
import 'package:devcredit/apis/loginApi/model/login_model.dart';
import 'package:flutter/material.dart';

class ScoreState with ChangeNotifier {
  bool _loggedIn = false;
  String _token = "";
  String _user = "";
  LoginRequestModel requestModel = new LoginRequestModel();
  get loginIn {
    return _loggedIn;
  }

  void login(String user, String pass) {
    if (user.isNotEmpty && pass.isNotEmpty) {
      requestModel.account = user;
      requestModel.password = pass;
      ApiLogin apiGetScore = new ApiLogin();
      apiGetScore.login(requestModel).then((value) {
        if (value.token.isNotEmpty) {
          _token = value.token;
          _user = value.nameLead;
          _loggedIn = true;
        } else {
          print(value.error);
        }
      });
    }
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    notifyListeners();
  }
}
