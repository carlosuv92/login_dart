import 'dart:convert';
import 'package:devcredit/contains.dart';
import 'package:devcredit/providers/login_state.dart';
import 'package:devcredit/providers/messages_state.dart';
import 'package:devcredit/screens/HistoryScore/score_screen.dart';
import 'package:devcredit/screens/ListTips/list_screen.dart';
import 'package:devcredit/screens/Messenger/messenger.dart';
import 'package:devcredit/screens/Payments/payment_screen.dart';
import 'package:devcredit/services/notification.dart';
import 'package:devcredit/socket/SocketUtil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_pusher/pusher.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:devcredit/components/alert_custon_one.dart';
import 'package:flutter/services.dart';

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  var screens = [ScoreScreen(), Payments(), ListScreen()];
  int selectedTab = 0;
  Channel channel;
  SocketUtil socket = SocketUtil();
  final storage = new FlutterSecureStorage();
  NotificationService notification = new NotificationService();

  @override
  void initState() {
    super.initState();
    socket.initPusher();
    listenMessage();
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
        pressYes: () async {
          await storage.deleteAll();
          SystemNavigator.pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loginState = Provider.of<LoginState>(context, listen: false);
    String _nameLead = loginState.getUser();
    return Scaffold(
      appBar: new AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromRGBO(31, 45, 123, 1),
          title: new RichText(
            text: new TextSpan(
              style: new TextStyle(
                fontSize: 14.0,
                color: Colors.white,
              ),
              children: <TextSpan>[
                new TextSpan(text: 'Welcome, '),
                new TextSpan(
                    text: _nameLead,
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17)),
              ],
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications_active),
              color: Colors.white,
              onPressed: () {
                _willPopCallback();
              },
            ),
            Container(
              padding: const EdgeInsets.all(6.0),
              child: CircleAvatar(
                radius: 25,
                child: ClipOval(
                  child: Image.asset('assets/images/logo_ce.png',
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ]),
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
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.message),
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return Messenger();
              },
            ));
          }),
    );
  }

  Future<void> listenMessage() async {
    channel = await Pusher.subscribe('channel-chat');
    final _messageState = Provider.of<MessageState>(context, listen: false);
    final _infoUser = Provider.of<LoginState>(context, listen: false);
    await channel.bind('client-messaging', (x) {
      if (mounted) {
        Map<String, dynamic> message = jsonDecode(x.data);
        if (_infoUser.getAccount() != message['fromUser'] &&
            _infoUser.getAccount() == message['toUser']) {
          _messageState.setMessage(message['message'], false);

          notification.initialize();
          notification.stylishNotification();
        }
      }
    });
  }
}
