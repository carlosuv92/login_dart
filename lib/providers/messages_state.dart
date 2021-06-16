import 'package:devcredit/apis/messagesApi/model/message_model.dart';
import 'package:flutter/material.dart';

class MessageState with ChangeNotifier {
  List<dynamic> _messageChat = [];
  MessageRequestModel requestModel = new MessageRequestModel();

  List<dynamic> getMessage() => _messageChat;

  void setMessage(String message, bool isSender) {
    _messageChat.add(MessageResponseModel(
      text: message,
      messageType: ChatMessageType.text,
      messageStatus: MessageStatus.viewed,
      isSender: isSender,
    ));
    notifyListeners();
  }

  Future<void> getApiMessage(String user, String pass) async {
    _messageChat = [
      MessageResponseModel(
        text: "Hola que tal",
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: false,
      )
    ];
  }
}
