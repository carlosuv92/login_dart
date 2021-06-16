import 'package:devcredit/apis/messagesApi/api/api_message.dart';
import 'package:devcredit/providers/login_state.dart';
import 'package:devcredit/providers/messages_state.dart';
import 'package:devcredit/providers/score_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../contains.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController inputMessage = new TextEditingController();
    final _infoUser = Provider.of<LoginState>(context, listen: false);
    final _scoreAdvisor = Provider.of<ScoreState>(context, listen: false);
    final _messageState = Provider.of<MessageState>(context, listen: false);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 32,
            color: Colors.grey.withOpacity(0.2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            SizedBox(width: 15),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    Icon(Icons.sentiment_satisfied_alt_outlined),
                    SizedBox(width: 5),
                    Expanded(
                      child: TextField(
                        controller: inputMessage,
                        textInputAction: TextInputAction.go,
                        onSubmitted: (value) {
                          _messageState.setMessage(value.toString(), true);
                          APISetMessage apiMessage = new APISetMessage();
                          apiMessage
                              .setMessage(value, _infoUser.getAccount(), _scoreAdvisor.getAdvisorId(),
                                  _infoUser.getToken())
                              .then((value) {
                            inputMessage.text = "";
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Type Message",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.attach_file_outlined),
                    SizedBox(width: 5),
                    Icon(Icons.camera_alt_outlined),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
