import 'package:devcredit/apis/loginApi/api/api_service.dart';
import 'package:devcredit/apis/loginApi/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginState with ChangeNotifier {
  bool _loggedIn = false;
  bool _loading = false;
  String _token = "";
  String _user = "";
  String _account = "";
  final _storage = new FlutterSecureStorage();
  LoginRequestModel requestModel = new LoginRequestModel();
  bool isLoggedIn() => _loggedIn;
  bool isLoading() => _loading;
  String getUser() => _user;
  String getToken() => _token;
  String getAccount() => _account;

  set setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  void setToken(String token) {
    _token = token;
    notifyListeners();
  }

  void setUser(String user) {
    _user = user;
    notifyListeners();
  }

  void setAccount(String account) {
    _account = account;
    notifyListeners();
  }

  void login(String user, String pass) async {
    if (user.isNotEmpty && pass.isNotEmpty) {
      requestModel.account = user;
      requestModel.password = pass;
      ApiLogin apiLogin = new ApiLogin();
      await apiLogin.login(requestModel).then((value) {
        if (value.token.isNotEmpty) {
          _token = value.token;
          _user = value.nameLead;
          _account = user;
          _loggedIn = true;
        } else {
          print(value.error);
        }
      });
      if (_loggedIn) {
        await _storage.write(key: 'token', value: _token);
        await _storage.write(key: 'user', value: _user);
        await _storage.write(key: 'account', value: _account);
        //await _storage.write(key: 'token', value: _token);
      }
    }
    _loading = false;
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    notifyListeners();
  }
}
