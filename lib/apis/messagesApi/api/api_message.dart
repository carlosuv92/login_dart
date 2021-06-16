import 'dart:async';

import 'package:devcredit/apis/paymentApi/model/payment_model.dart';
import 'package:http/http.dart' as http;

class APISetMessage {
  // ignore: missing_return
  Future<PaymentResponseModel> setMessage(
      String message, String userId, int assesorId, String token) async {
    try {
      String url = "http://192.168.1.143:8000/api/message";
      Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": "Bearer " + token,
      };
      final response = await http.post(Uri.parse(url), headers: headers, body: {
        'message': message,
        'fromUser': userId,
        'toUser': assesorId.toString()
      }).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
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
