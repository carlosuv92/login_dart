import 'dart:convert';

import 'package:devcredit/apis/messagesApi/model/message_model.dart';
// import 'package:devcredit/providers/login_state.dart';
import 'package:devcredit/providers/messages_state.dart';
import 'package:devcredit/screens/Messenger/components/message_box.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_pusher/pusher.dart';
import 'package:provider/provider.dart';
import 'components/audio_message.dart';
import 'components/image_message.dart';
import 'components/text_message.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // Channel channel;
  @override
  initState() {
    super.initState();
    _getPayments(context);
    // listenMessage();
  }

  @override
  Widget build(BuildContext context) {
    final _messageState = Provider.of<MessageState>(context, listen: false);
    final List<dynamic> demoChat = _messageState.getMessage();

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: demoChat.length,
              itemBuilder: (content, index) => Message(
                message: Provider.of<MessageState>(context).getMessage()[index],
              ),
            ),
          ),
        ),
        MessageBox(),
      ],
    );
  }

  // GET PAYMENTS ON LOAD
  Future _getPayments(BuildContext context) async {
    final _messageState = Provider.of<MessageState>(context, listen: false);
    await _messageState.getApiMessage("user", "pass");
    if (!mounted) return;
    setState(() {});
  }

  //Channel Open
  // Future<void> listenMessage() async {
  //   channel = await Pusher.subscribe('channel-chat');
  //   final _messageState = Provider.of<MessageState>(context, listen: false);
  //   final _infoUser = Provider.of<LoginState>(context, listen: false);
  //   await channel.bind('client-messaging', (x) {
  //     if (mounted) {
  //       Map<String, dynamic> message = jsonDecode(x.data);
  //       if (_infoUser.getAccount() != message['user']) {
  //         _messageState.setMessage(message['message'], false);
  //       }
  //     }
  //   });
  // }
}

//**Widget Message */
class Message extends StatelessWidget {
  const Message({
    Key key,
    @required this.message,
  }) : super(key: key);
  final MessageResponseModel message;

  @override
  Widget build(BuildContext context) {
    Widget messageContaint(MessageResponseModel message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(message: message);
          break;
        case ChatMessageType.audio:
          return AudioMessage(message: message);
          break;

        case ChatMessageType.video:
          return ImageMessage(message: message);
          break;
        default:
          return SizedBox();
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage('assets/images/logo_ce.png'),
            ),
            SizedBox(width: 10)
          ],
          messageContaint(message),
        ],
      ),
    );
  }
}
