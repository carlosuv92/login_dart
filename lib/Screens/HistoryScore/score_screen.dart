import 'package:devcredit/apis/scoreApi/model/scores_model.dart';
import 'package:devcredit/components/gauge_custom.dart';
import 'package:devcredit/components/my_line_chart.dart';
import 'package:devcredit/providers/login_state.dart';
import 'package:devcredit/providers/score_state.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'dialog_score_data.dart';

class ScoreScreen extends StatefulWidget {
  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  ScoreRequestModel requestModel;
  List<charts.Series> seriesList;
  List<dynamic> deletedData = [];
  List<dynamic> disputeData = [];
  @override
  void initState() {
    super.initState();
    _getScores(context);
  }

  Future<bool> showDialogScore(
      int type, String nameType, List<dynamic> deleted) async {
    return showDialog(
      context: context,
      builder: (context) => DialogScoreData(
        text: "Show Accounts " + nameType,
        title: "ACCOUNTS " + nameType,
        type: type,
        dataAccount: deleted,
        value: 'OK',
        pressNo: () {
          Navigator.pop(context, false);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _loadingScore = Provider.of<ScoreState>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    seriesList = getGraphData();

    return ModalProgressHUD(
      inAsyncCall: Provider.of<ScoreState>(context).isLoading(),
      child: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            //Container for top data
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: Column(
                children: <Widget>[
                  Text(
                    "SCORE",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                        color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: size.height * 0.13,
                              width: size.height * 0.13,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                              ),
                              child: GaugeCustomer(
                                color: validateScore(
                                    int.parse(_loadingScore.getScoreTU())),
                                valueScore: _loadingScore.getScoreTU(),
                                percentValue:
                                    int.parse(_loadingScore.getScoreTU()) / 8.5,
                              ),
                              padding: EdgeInsets.only(
                                  top: 5, left: 5, right: 5, bottom: 20),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/images/transunion.png',
                                height: size.height * 0.025,
                              ),
                              transform:
                                  Matrix4.translationValues(0.0, -32, 0.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: size.height * 0.1305,
                              width: size.height * 0.13,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                              ),
                              child: GaugeCustomer(
                                color: validateScore(
                                    int.parse(_loadingScore.getScoreEXP())),
                                valueScore: _loadingScore.getScoreEXP(),
                                percentValue:
                                    int.parse(_loadingScore.getScoreEXP()) /
                                        8.5,
                              ),
                              padding: EdgeInsets.only(
                                  top: 5, left: 5, right: 5, bottom: 20),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/images/experian.png',
                                height: size.height * 0.0305,
                              ),
                              transform:
                                  Matrix4.translationValues(0.0, -27, 0.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: size.height * 0.13,
                              width: size.height * 0.13,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                              ),
                              child: GaugeCustomer(
                                color: validateScore(
                                    int.parse(_loadingScore.getScoreEQF())),
                                valueScore: _loadingScore.getScoreEQF(),
                                percentValue:
                                    int.parse(_loadingScore.getScoreEQF()) /
                                        8.5,
                              ),
                              padding: EdgeInsets.only(
                                  top: 5, left: 5, right: 5, bottom: 20),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/images/equifax.png',
                                height: size.height * 0.020,
                              ),
                              transform:
                                  Matrix4.translationValues(0.0, -22, 0.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Draggable container
            //draggable sheet
            DraggableScrollableSheet(
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(243, 245, 248, 1),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Score History",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 24,
                                    color: Colors.black),
                              )
                            ],
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 32),
                        ),
                        SizedBox(
                          height: 24,
                        ),

                        //Container for buttons
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "All",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: Colors.grey[900]),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[200],
                                          blurRadius: 10.0,
                                          spreadRadius: 4.5)
                                    ]),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 8,
                                      backgroundColor: Colors.green.shade800,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "After",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: Colors.grey[900]),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[200],
                                          blurRadius: 10.0,
                                          spreadRadius: 4.5)
                                    ]),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 8,
                                      backgroundColor: Colors.red,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "Before",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: Colors.grey[900]),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[200],
                                          blurRadius: 10.0,
                                          spreadRadius: 4.5)
                                    ]),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              )
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 16,
                        ),
                        //Container Listview for expenses and incomes
                        Container(
                          child: Text(
                            "HISTORY SCORE",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[500]),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 32),
                        ),

                        SizedBox(
                          height: 16,
                        ),

                        ListView.builder(
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                margin: EdgeInsets.only(bottom: 25),
                                height: size.height * 0.5,
                                child: seriesList != null
                                    ? HorizontalPatternForwardHatchBarChart(
                                        seriesList)
                                    : CircularProgressIndicator(),
                              ),
                            );
                          },
                          shrinkWrap: true,
                          itemCount: 1,
                          padding: EdgeInsets.all(0),
                          controller: ScrollController(keepScrollOffset: false),
                        ),

                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Accounts",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 24,
                                    color: Colors.black),
                              )
                            ],
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 32),
                        ),
                        //now expense
                        SizedBox(
                          height: 5,
                        ),

                        Container(
                          child: Text(
                            "DELETED",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[500]),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 32),
                        ),

                        SizedBox(
                          height: 16,
                        ),
                        if (deletedData.length > 0)
                          for (var deleted in deletedData)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: GestureDetector(
                                onTap: () {
                                  showDialogScore(1, "DELETED", deleted);
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(18))),
                                        child: Icon(
                                          Icons.arrow_circle_up,
                                          color: Colors.lightGreen,
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
                                              //for choose one account_name
                                              deleted[0]['account_name']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.grey[900]),
                                            ),
                                            Text(
                                              "Deleted",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.grey[500]),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Text(
                                            "\$" +
                                                deleted[0]['balance']
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.lightGreen),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                        //now expense
                        SizedBox(
                          height: 16,
                        ),

                        Container(
                          child: Text(
                            "WORKING",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[500]),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 32),
                        ),

                        SizedBox(
                          height: 16,
                        ),

                        for (var dispute in disputeData)
                          GestureDetector(
                            onTap: () {
                              showDialogScore(2, "WORKING", dispute);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 15),
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: Colors.white,
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
                                        Icons.arrow_circle_up,
                                        color: Colors.orange,
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
                                            dispute[0]['account_name']
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.grey[900]),
                                          ),
                                          Text(
                                            "Working",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.grey[500]),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          "\$" +
                                              dispute[0]['balance'].toString(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.orange),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                        //now expense
                      ],
                    ),
                    controller: scrollController,
                  ),
                );
              },
              initialChildSize: 0.68,
              minChildSize: 0.68,
              maxChildSize: 1,
            )
          ],
        ),
      ),
    );
  }

// GET PAYMENTS ON LOAD
  Future _getScores(BuildContext context) async {
    final _infoUser = Provider.of<LoginState>(context, listen: false);
    final _loadingScore = Provider.of<ScoreState>(context, listen: false);
    await _loadingScore.getScore(_infoUser.getAccount(), _infoUser.getToken());
    seriesList = await getGraphData();
    deletedData = _loadingScore.getDeletedData();
    disputeData = _loadingScore.getDisputeData();
    if (!mounted) return;
    setState(() {});
  }

  List<charts.Series<OrdinalSales, String>> getGraphData() {
    final _loadingScore = Provider.of<ScoreState>(context, listen: false);
    List<dynamic> listPayments = _loadingScore.getScoreGraphData();

    final afterData = [
      new OrdinalSales('Transunion',
          seriesList == null ? 0 : checkString(listPayments[0]['transunion'])),
      new OrdinalSales('Equifax',
          seriesList == null ? 0 : checkString(listPayments[0]['equifax'])),
      new OrdinalSales('Experian',
          seriesList == null ? 0 : checkString(listPayments[0]['experian'])),
    ];

    final beforeData = [
      new OrdinalSales('Transunion',
          seriesList == null ? 0 : checkString(listPayments[1]['transunion'])),
      new OrdinalSales('Equifax',
          seriesList == null ? 0 : checkString(listPayments[1]['equifax'])),
      new OrdinalSales('Experian',
          seriesList == null ? 0 : checkString(listPayments[1]['experian'])),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
          id: 'Before',
          seriesColor: charts.ColorUtil.fromDartColor(Colors.red.shade300),
          domainFn: (OrdinalSales score, _) => score.bureau,
          measureFn: (OrdinalSales score, _) => score.score,
          data: beforeData,
          labelAccessorFn: (OrdinalSales score, _) =>
              score.score.toString() == '0'
                  ? ''
                  : 'Score: ${score.score.toString()}'),
      new charts.Series<OrdinalSales, String>(
          id: 'After',
          seriesColor: charts.ColorUtil.fromDartColor(Colors.green.shade800),
          domainFn: (OrdinalSales score, _) => score.bureau,
          measureFn: (OrdinalSales score, _) => score.score,
          data: afterData,
          labelAccessorFn: (OrdinalSales score, _) =>
              score.score.toString() == '0'
                  ? ''
                  : 'Score: ${score.score.toString()}'),
    ];
  }

  static int checkString(dynamic value) {
    if (value is int) {
      return value;
    } else if (value == "-") {
      return 0;
    } else {
      return int.parse(value);
    }
  }

  static Color validateScore(int value) {
    if (value < 659) {
      return Colors.red;
    } else if (value < 700) {
      return Color.fromRGBO(255, 193, 7, 1);
    } else if (value < 760) {
      return Color.fromRGBO(0, 175, 145, 1);
    } else {
      return Colors.green;
    }
  }
}
