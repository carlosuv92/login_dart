import 'dart:ui';
import 'package:devcredit/Screens/Login/login_screen.dart';
import 'package:devcredit/Screens/Welcome/components/background.dart';
import 'package:devcredit/components/rounded_button.dart';
import 'package:devcredit/providers/login_state.dart';
import 'package:devcredit/screens/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class Body extends StatefulWidget {
  @override
  _BodyPageState createState() => _BodyPageState();
}

class _BodyPageState extends State<Body> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var loginState = Provider.of<LoginState>(context, listen: true);

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME TO CREDIT EXPERTS",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black.withBlue(100)),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset('assets/images/logo_ce.png',
                height: size.height * 0.25),
            SizedBox(height: size.height * 0.03),
            RoundedButton(
              text: "ENTER",
              press: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return loginState.isLoggedIn() ? HomeApp() : LoginScreen();
                  },
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
