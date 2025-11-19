import 'package:get/get.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttService {
  late MqttServerClient _client;
  
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
