class PaymentResponseModel {
  final String payment;
  final String charge;
  final String balance;
  final List<dynamic> payList;
  final String error;

  PaymentResponseModel({this.payment, this.charge, this.balance, this.payList, this.error});

  factory PaymentResponseModel.fromJson(Map<String, dynamic> json) {
    return PaymentResponseModel(
      error: json["error"] != null ? json["error"] : "",
      payment: json["payment"] != null ? json["payment"] : "",
      charge: json["charge"] != null ? json["charge"] : "",
      balance: json["balance"] != null ? json["balance"] : "",
      payList: json["pay_list"] != null ? json["pay_list"] : "",
    );
  }
}

class PaymentRequestModel {
  String account;
  String token;

  PaymentRequestModel({
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
