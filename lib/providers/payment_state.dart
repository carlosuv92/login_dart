import 'package:devcredit/apis/paymentApi/api/api_score_service.dart';
import 'package:devcredit/apis/paymentApi/model/payment_model.dart';
import 'package:flutter/material.dart';

class PaymentState with ChangeNotifier {
  bool _loading = false;
  String _payment = "0";
  String _charge = "0";
  String _balance = "0";
  List<dynamic> _payList = [];
  List<dynamic> getPays() => _payList;
  String getPayment() => _payment;
  String getCharge() => _charge;
  String getBalance() => _balance;
  bool isLoading() => _loading;
  PaymentRequestModel requestModel = new PaymentRequestModel();

  set setLoading(bool loading) {
    _loading = loading; //actualizamos el valor
    notifyListeners(); //notificamos a los widgets que esten escuchando el stream.
  }

  Future<void> getPayments(String user, String token) async {
    _loading = true;
    if (user.isNotEmpty && token.isNotEmpty) {
      requestModel.account = user;
      requestModel.token = token;
      APIGetPayments apiPayment = new APIGetPayments();
      await apiPayment.getPayments(requestModel).then((value) {
        if (value != null) {
          _payment = value.payment;
          _charge = value.charge;
          _balance = value.balance;
          _payList = value.payList;
        } else {
          print(value.error);
        }
      });
    }
    _loading = false;
    notifyListeners();
  }
}
