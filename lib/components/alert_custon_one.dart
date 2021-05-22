import 'package:devcredit/contains.dart';
import 'package:flutter/material.dart';

class AdvanceCustomAlert extends StatelessWidget {
  final String text;
  final String title;
  final String value;
  final Function pressYes;
  final Function pressNo;
  const AdvanceCustomAlert({
    Key key,
    this.text,
    this.title,
    this.pressNo,
    this.pressYes,
    this.value,
  }) : super(key: key);
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
              color:Colors.grey.shade200,
              height: 220,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      text,
                      style: TextStyle(fontSize: 15),
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
                                primary: kPrimaryDarkColor,
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                              ),
                              onPressed: pressYes,
                              child: Text(
                                'YES',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
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
                              onPressed: pressNo,
                              child: Text(
                                'NO',
                                style: TextStyle(
                                  color: kPrimaryDarkColor,
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
                top: -60,
                child: CircleAvatar(
                  backgroundColor: kPrimaryDarkColor,
                  radius: 60,
                  child: Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 50,
                  ),
                )),
          ],
        ));
  }
}
