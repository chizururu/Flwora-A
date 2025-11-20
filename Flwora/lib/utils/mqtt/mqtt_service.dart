import 'dart:async';

import 'package:get/get.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttService {
  late MqttServerClient _client;

  final _messageStream =
      StreamController<MqttReceivedMessage<MqttMessage>>.broadcast();

  // Connect
  Future<void> connect({
    required String broker,
    required String cliendId,
    String username = '',
    String password = '',
    int port = 1883,
  }) async {
    _client = MqttServerClient(broker, cliendId)
      ..port = port
      ..keepAlivePeriod = 30
      ..logging(on: false)..onConnected = () => ()
    ;
  }

  // Subscribe
  void subscribe({
    required String topic,
    required String payload,
    MqttQos qos = MqttQos.atLeastOnce,
    bool retain = true,
  }) async {}

  // Publish
  void publish({
    required topic,
    required Map<String, dynamic> data,
    MqttQos qos = MqttQos.atLeastOnce,
    bool retain = false,
  }) async {}
}
