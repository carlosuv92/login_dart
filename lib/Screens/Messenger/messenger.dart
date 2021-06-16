import 'package:devcredit/screens/Messenger/body.dart';
import 'package:flutter/material.dart';

class Messenger extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MessengerState createState() => _MessengerState();
}

class _MessengerState extends State<Messenger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            BackButton(),
            CircleAvatar(
                backgroundImage: AssetImage('assets/images/logo_ce.png')),
            SizedBox(width: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "AMG Credit Experts",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Response time of 5 minutes",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.attach_file),
            onPressed: () {},
          ),
        ],
      ),
      body: Body(),
    );
  }
}
