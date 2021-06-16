import 'package:devcredit/providers/login_state.dart';
import 'package:devcredit/providers/messages_state.dart';
import 'package:devcredit/providers/payment_state.dart';
import 'package:devcredit/providers/score_state.dart';
import 'package:devcredit/services/notification.dart';
import 'package:provider/provider.dart';
import 'Screens/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'contains.dart';
import 'package:workmanager/workmanager.dart';

const simplePeriodicTask = "simplePeriodicTask";
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Workmanager().initialize(callbackDispatcher,
      isInDebugMode:
          false); //to true if still in testing lev turn it to false whenever you are launching the app
  await Workmanager().registerPeriodicTask("5", simplePeriodicTask,
      existingWorkPolicy: ExistingWorkPolicy.replace,
      frequency: Duration(minutes: 15), //when should it check the link
      initialDelay:
          Duration(seconds: 5), //duration before showing the notification
      constraints: Constraints(
        networkType: NetworkType.connected,
      ));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginState>(create: (_) => LoginState()),
        ChangeNotifierProvider<ScoreState>(create: (_) => ScoreState()),
        ChangeNotifierProvider<PaymentState>(create: (_) => PaymentState()),
        ChangeNotifierProvider<MessageState>(create: (_) => MessageState()),
        ChangeNotifierProvider<NotificationService>(
            create: (_) => NotificationService()),
      ],
      child: MyApp(),
    ),
  );
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    NotificationService notification = new NotificationService();
    notification.initialize();

    //var response= await http.post('https://seeviswork.000webhostapp.com/api/testapi.php');
    // print("here================");
    //print(response);
    //var convert = json.decode(response.body);
    if (/*convert['status']*/ true == true) {
      notification.instantNofitication();
    } else {
      print("no messgae");
    }

    return Future.value(true);
  });
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
