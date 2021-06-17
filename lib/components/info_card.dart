import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String text;
  final String amount;
  final int columnInfo;
  const InfoCard({
    Key key,
    this.text, this.columnInfo, this.amount = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth / columnInfo - 15,
        decoration: BoxDecoration(
            color: Colors.blue.shade50, borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF9C00).withOpacity(0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.notifications, color: Colors.orange),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10, top: 0, right: 10, bottom: 10),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                              text: "Total     ",
                              style: TextStyle(fontSize: 14, height: 2)),
                          TextSpan(
                              text: "\$ " + amount,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
