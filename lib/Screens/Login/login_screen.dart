import 'package:devcredit/Screens/Home/home_screen.dart';
import 'package:devcredit/Screens/Login/components/body.dart';
import 'package:devcredit/providers/login_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_auth/Screens/Login/components/body.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginState loginState = Provider.of<LoginState>(context, listen: true);
    return Scaffold(
      body:  loginState.isLoggedIn() ? HomeApp() : Body(),
    );
  }
}
