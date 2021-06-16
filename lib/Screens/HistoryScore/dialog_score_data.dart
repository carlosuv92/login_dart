import 'package:devcredit/contains.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class DialogScoreData extends StatefulWidget {
  final String text;
  final String title;
  final String value;
  final int type;
  final List<dynamic> dataAccount;
  final Function pressYes;
  final Function pressNo;
  bool isExpanded;
  DialogScoreData({
    Key key,
    this.text,
    this.title,
    this.pressNo,
    this.pressYes,
    this.value,
    this.dataAccount,
    this.isExpanded = false,
    this.type,
  }) : super(key: key);

  @override
  _DialogScoreDataState createState() => _DialogScoreDataState();
}

class _DialogScoreDataState extends State<DialogScoreData> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Container(
              color: Colors.grey.shade200,
              height: 500,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  children: [
                    Text(
                      widget.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        height: 300,
                        child: Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return new Container(
                              height: size.height * 0.33,
                              child: Card(
                                color: widget.type == 1 ? Colors.green[50] : Colors.orange[50],
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 2),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Image.asset(
                                                      widget.dataAccount[index][
                                                                      'bureau_id']
                                                                  .toString() ==
                                                              "1"
                                                          ? 'assets/images/transunion.png'
                                                          : (widget.dataAccount[
                                                                          index]
                                                                          [
                                                                          'bureau_id']
                                                                      .toString() ==
                                                                  "2"
                                                              ? 'assets/images/experian.png'
                                                              : 'assets/images/equifax.png'),
                                                      width: 80,
                                                      height: 20),
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  widget.dataAccount[index]
                                                          ['account_name']
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors
                                                          .lightGreen[700]),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Row(
                                                    children: [
                                                      Spacer(),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Text(
                                                          "Account Number",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Text(
                                                          widget.dataAccount[
                                                                  index][
                                                                  'account_number']
                                                              .toString(),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Row(
                                                    children: [
                                                      Spacer(),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Text(
                                                          "Balance",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Text(
                                                          widget.dataAccount[
                                                                  index]
                                                                  ['balance']
                                                              .toString(),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Row(
                                                    children: [
                                                      Spacer(),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Text(
                                                          "Account Type",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Text(
                                                          widget.dataAccount[
                                                                  index][
                                                                  'account_type']
                                                              .toString(),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Row(
                                                    children: [
                                                      Spacer(),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Text(
                                                          "Payment Status",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Text(
                                                          widget.dataAccount[
                                                                  index]
                                                                  ['p_status']
                                                              .toString(),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Row(
                                                    children: [
                                                      Spacer(),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Text(
                                                          "Credit Limit",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Text(
                                                          widget.dataAccount[
                                                                  index]
                                                                  ['c_limit']
                                                              .toString(),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Row(
                                                    children: [
                                                      Spacer(),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Text(
                                                          "Monthly Payment",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Text(
                                                          widget.dataAccount[
                                                                  index]
                                                                  ['m_payment']
                                                              .toString(),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: widget.dataAccount.length,
                          control: new SwiperControl(color: widget.type == 1 ? Colors.green : Colors.orange,),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      Expanded(
                        child: Column(children: [
                          Container(
                            width: size.width * 0.3,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                              ),
                              onPressed: widget.pressNo,
                              child: Text(
                                'OK',
                                style: TextStyle(
                                  color: widget.type == 1 ? Colors.green[500] : Colors.orange[500],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ])
                  ],
                ),
              ),
            ),
            Positioned(
                top: -30,
                child: CircleAvatar(
                  backgroundColor: widget.type == 1 ? Colors.green : Colors.orange,
                  radius: 30,
                  child: Icon(
                    Icons.arrow_circle_up,
                    color: Colors.white,
                    size: 40,
                  ),
                )),
          ],
        ));
  }
}
