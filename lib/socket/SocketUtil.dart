import 'package:flutter/services.dart';
import 'package:flutter_pusher/pusher.dart';

class SocketUtil {

  Future<void> initPusher() async {
    try {
      await Pusher.init(
          "1958aa54e93beed582d0",
          PusherOptions(
            cluster: "us2",
            host: "192.168.1.143",
            port: 6001,
            encrypted: false,
          ),
          enableLogging: true);
    } on PlatformException catch (e) {
      print(e.message);
    }
    Pusher.connect();
  }
}
