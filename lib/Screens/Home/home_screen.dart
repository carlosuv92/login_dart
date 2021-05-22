import 'package:devcredit/contains.dart';
import 'package:devcredit/providers/login_state.dart';
import 'package:devcredit/screens/CalculatorScore/calculator_screen.dart';
import 'package:devcredit/screens/HistoryScore/score_screen.dart';
import 'package:devcredit/screens/Payments/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  var screens = [ScoreScreen(), Payments(), CalculatorScore()];

  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final loginState = Provider.of<LoginState>(context, listen: true);
    String _nameLead = loginState.getUser();
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(31, 45, 123, 1),
        title: new RichText(
          text: new TextSpan(
            style: new TextStyle(
              fontSize: 14.0,
              color: Colors.white,
            ),
            children: <TextSpan>[
              new TextSpan(text: 'wellcome, '),
              new TextSpan(
                  text: _nameLead,
                  style:
                      new TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
            ],
          ),
        ),
        leading: new Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 25,
            child: ClipOval(
              child:
                  Image.asset('assets/images/logo_ce.png', fit: BoxFit.cover),
            ),
          ),
        ),
      ),
      backgroundColor: kPrimaryColor,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_chart),
            label: 'Payments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Calculator',
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedTab = index;
          });
        },
        currentIndex: selectedTab,
        showUnselectedLabels: true,
        iconSize: 30,
      ),
      body: screens[selectedTab],
    );
  }
}
