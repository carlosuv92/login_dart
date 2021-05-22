import 'dart:async';

import 'package:devcredit/apis/loginApi/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiLogin {
  // ignore: missing_return
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    try {
      String url = "http://192.168.1.143:8000/api/auth/login";
      final response = await http
          .post(Uri.parse(url), body: requestModel.toJson())
          .timeout(const Duration(seconds: 5));
      if (response.statusCode == 200 || response.statusCode == 401) {
        return LoginResponseModel.fromJson(
          json.decode(response.body),
        );
      } else {
        throw Exception('Failed to load data!');
      }
    } on TimeoutException catch (e) {
      print('Timeout $e');
    } on Error catch (e) {
      print('Error: $e');
    }
  }
}
