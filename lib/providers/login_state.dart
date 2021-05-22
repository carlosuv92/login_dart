import 'package:devcredit/apis/loginApi/api/api_service.dart';
import 'package:devcredit/apis/loginApi/model/login_model.dart';
import 'package:flutter/material.dart';

class LoginState with ChangeNotifier {
  bool _loggedIn = false;
  bool _loading = false;
  String _token = "";
  String _user = "";
  LoginRequestModel requestModel = new LoginRequestModel();
  bool isLoggedIn() => _loggedIn;
  bool isLoading() => _loading;
  String getUser() => _user;

  set setLoading(bool loading) {
    _loading = loading; //actualizamos el valor
    notifyListeners(); //notificamos a los widgets que esten escuchando el stream.
  }

  void login(String user, String pass) async {
    if (user.isNotEmpty && pass.isNotEmpty) {
      requestModel.account = user;
      requestModel.password = pass;
      ApiLogin apiGetScore = new ApiLogin();
      await apiGetScore.login(requestModel).then((value) {
        if (value.token.isNotEmpty) {
          _token = value.token;
          _user = value.nameLead;
          _loggedIn = true;
        } else {
          print(value.error);
        }
      });
    }
    _loading = false;
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    notifyListeners();
  }
}
