import 'package:flutter/material.dart';
import 'package:devcredit/apis/messagesApi/model/message_model.dart';

class ImageMessage extends StatelessWidget {
  final MessageResponseModel message;
  const ImageMessage({
    Key key,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: AspectRatio(
          aspectRatio: 1.6,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset("assets/images/dart.jpg"),
          )),
    );
  }
}
