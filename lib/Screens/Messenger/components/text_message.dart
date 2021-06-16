import 'package:flutter/material.dart';
import 'package:devcredit/apis/messagesApi/model/message_model.dart';

import '../../../contains.dart';

class TextMessage extends StatelessWidget {
  final MessageResponseModel message;
  const TextMessage({
    Key key,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        constraints: BoxConstraints(minWidth: 100, maxWidth: 300),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(message.isSender ? 1 : 0.08),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          message.text,
          style:
              TextStyle(color: message.isSender ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
