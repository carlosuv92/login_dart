import 'package:devcredit/components/info_card.dart';
import 'package:devcredit/providers/login_state.dart';
import 'package:devcredit/providers/payment_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class Payments extends StatefulWidget {
  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  @override
  initState() {
    super.initState();
    _getPayments(context);
  }

  @override
  Widget build(BuildContext context) {
    final _loadingPayments = Provider.of<PaymentState>(context, listen: false);
    final List<dynamic> listPayments = _loadingPayments.getPays();

    //Main
    return ModalProgressHUD(
      inAsyncCall: _loadingPayments.isLoading(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 50),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(243, 245, 248, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10, top: 10, right: 10, bottom: 20),
                    child: Text(
                      "Payments",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  Center(
                    child: Wrap(
                      runSpacing: 20,
                      spacing: 15,
                      children: <Widget>[
                        InfoCard(
                            text: "Fee & Chargues",
                            amount: _loadingPayments.getCharge().toString(),
                            columnInfo: 2),
                        InfoCard(
                            text: "Total Payments",
                            amount: _loadingPayments.getPayment().toString(),
                            columnInfo: 2),
                        InfoCard(
                            text: "Account Balance",
                            amount: _loadingPayments.getBalance().toString(),
                            columnInfo: 1),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding:
                  EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(243, 245, 248, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, top: 20, right: 10, bottom: 10),
                          child: Text(
                            "Payment History",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                          ),
                        ),
                        for (var item in listPayments)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: Color(0xFFFF9C00).withOpacity(0.12),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(height: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(18))),
                                    child: Icon(
                                      Icons.payment_rounded,
                                      color: Colors.lightBlue[900],
                                    ),
                                    padding: EdgeInsets.all(12),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          item['type'],
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.grey[900]),
                                        ),
                                        Text(
                                          item['transaction_id'],
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.grey[700]),
                                        ),
                                        Text(
                                          item['method_payment'],
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.grey[500]),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        "\$" + item['amount'],
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.orange),
                                      ),
                                      Text(
                                        DateFormat.yMMMd().format(
                                          DateTime.tryParse(
                                              item['settlement_date']),
                                        ),
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey[500]),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // GET PAYMENTS ON LOAD
  Future _getPayments(BuildContext context) async {
    final _infoUser = Provider.of<LoginState>(context, listen: false);
    final _loadingPayments = Provider.of<PaymentState>(context, listen: false);
    await _loadingPayments.getPayments(
        _infoUser.getAccount(), _infoUser.getToken());
    if (!mounted) return;
    setState(() {});
  }
}
