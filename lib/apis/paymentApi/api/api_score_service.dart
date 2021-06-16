import 'dart:async';

import 'package:devcredit/apis/paymentApi/model/payment_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIGetPayments {
  // ignore: missing_return
  Future<PaymentResponseModel> getPayments(PaymentRequestModel requestModel) async {
    try {
      String url = "http://192.168.1.143:8000/api/get_payments";
      Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": "Bearer " + requestModel.token,
      };
      final response = await http
          .post(Uri.parse(url), headers: headers, body: requestModel.toJson())
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        return PaymentResponseModel.fromJson(
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
