import 'package:devcredit/providers/login_state.dart';
import 'package:devcredit/providers/score_state.dart';
import 'package:provider/provider.dart';
import 'Screens/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'contains.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginState>(create: (_) => LoginState()),
        ChangeNotifierProvider<ScoreState>(create: (_) => ScoreState()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AMG Credit Experts',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}
