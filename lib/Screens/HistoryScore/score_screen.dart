import 'package:devcredit/apis/scoreApi/api/api_score_service.dart';
import 'package:devcredit/apis/scoreApi/model/scores_model.dart';
import 'package:devcredit/components/alert_custon_one.dart';
import 'package:devcredit/components/gauge_custom.dart';
import 'package:devcredit/components/my_line_chart.dart';
import 'package:devcredit/providers/login_state.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class ScoreScreen extends StatefulWidget {
  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  String _token = "";
  String _account = "";
  String _scoreTransunion = "0";
  String _scoreExperian = "0";
  String _scoreEquifax = "0";
  ScoreRequestModel requestModel;

  Future<void> _getTokenSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = (prefs.getString('_token') ?? '');
      _account = (prefs.getString('_account') ?? '');
    });
  }

  @override
  void initState() {
    super.initState();
    _getTokenSharedPref().then((val) {
      requestModel = new ScoreRequestModel();
      // getScores();
    });
  }

  Future<bool> _willPopCallback() async {
    return showDialog(
      context: context,
      builder: (context) => AdvanceCustomAlert(
        text: "Do you really want to exit the app?",
        title: "Close app",
        value: 'NO',
        pressNo: () {
          Navigator.pop(context, false);
        },
        pressYes: () {
          SystemNavigator.pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
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
                  "Bureau Score",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
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
                              color: Colors.red,
                              valueScore: _scoreTransunion,
                              percentValue: int.parse(_scoreTransunion) / 8.5,
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
                            transform: Matrix4.translationValues(0.0, -32, 0.0),
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
                              color: Colors.red,
                              valueScore: _scoreExperian,
                              percentValue: int.parse(_scoreExperian) / 8.5,
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
                            transform: Matrix4.translationValues(0.0, -27, 0.0),
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
                              color: Colors.red,
                              valueScore: _scoreEquifax,
                              percentValue: int.parse(_scoreEquifax) / 8.5,
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
                            transform: Matrix4.translationValues(0.0, -22, 0.0),
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
                              "Credit History",
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
                                    backgroundColor: Colors.green,
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
                                    backgroundColor: Colors.orange,
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
                              child: HorizontalPatternForwardHatchBarChart
                                  .withSampleData(),
                            ),
                          );
                        },
                        shrinkWrap: true,
                        itemCount: 1,
                        padding: EdgeInsets.all(0),
                        controller: ScrollController(keepScrollOffset: false),
                      ),

                      //now expense
                      SizedBox(
                        height: 16,
                      ),

                      Container(
                        child: Text(
                          "REMOVIDA",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[500]),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                      ),

                      SizedBox(
                        height: 16,
                      ),

                      ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 5);
                        },
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(18))),
                                  child: Icon(
                                    Icons.date_range,
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
                                        "Cuenta A",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey[900]),
                                      ),
                                      Text(
                                        "Payment from Saad",
                                        style: TextStyle(
                                            fontSize: 15,
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
                                      "+\$500.5",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.lightGreen),
                                    ),
                                    Text(
                                      "26 Jan",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey[500]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        shrinkWrap: true,
                        itemCount: 2,
                        padding: EdgeInsets.all(0),
                        controller: ScrollController(keepScrollOffset: false),
                      ),

                      //now expense
                      SizedBox(
                        height: 16,
                      ),

                      Container(
                        child: Text(
                          "DISPUTE",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[500]),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                      ),

                      SizedBox(
                        height: 16,
                      ),

                      ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 5);
                        },
                        itemBuilder: (context, index) {
                          return Container(
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
                                    Icons.directions_car,
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
                                        "Cuenta B",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey[900]),
                                      ),
                                      Text(
                                        "Payment from Saad",
                                        style: TextStyle(
                                            fontSize: 15,
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
                                      "-\$500.5",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.orange),
                                    ),
                                    Text(
                                      "26 Jan",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey[500]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        shrinkWrap: true,
                        itemCount: 5,
                        padding: EdgeInsets.all(0),
                        controller: ScrollController(keepScrollOffset: false),
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
    );
  }

  /*getScores() async {
    requestModel.account = _account;
    requestModel.token = _token;
    APIGetScore apiGetScore = new APIGetScore();
    apiGetScore.getScore(requestModel).then((value) {
      if (value != null) {
        _scoreTransunion = value.scoreTransunion;
        _scoreExperian = value.scoreExperian;
        _scoreEquifax = value.scoreEquifax;
        _nameLead = value.nameLead;
        setState(() {});
      } else {
        print(value.error);
      }
    });
  }*/
}
