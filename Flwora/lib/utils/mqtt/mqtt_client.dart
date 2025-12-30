import 'dart:async';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:get/get.dart';

class TMqttClient {
  static TMqttClient get instance => Get.find();

  final String host;
  final int port;

  // Constructor
  TMqttClient({required this.host, this.port = 1883});

  final StreamController<MqttReceivedMessage<MqttMessage>> _controller =
      StreamController<MqttReceivedMessage<MqttMessage>>.broadcast();
}
