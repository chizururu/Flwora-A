import 'dart:async';

import 'package:flwora/utils/helpers/session_data_store.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttService extends GetxService {
  static MqttService get instance => Get.find();

  // Inisialisasi host dan port pada MQTT broker
  final String host;
  final int port;

  // Constructor
  MqttService({required this.host, this.port = 1883});

  final Logger logger = Logger();

  // Status koneksi MQTT
  final RxBool isConnected = false.obs;

  // Stream semua pesan dari broker
  final StreamController<MqttReceivedMessage<MqttMessage>> _stream =
      StreamController<MqttReceivedMessage<MqttMessage>>.broadcast();

  // Library of class MQTT
  late MqttServerClient _client;

  // Simpan user id yang sedang dipakai sebagai client id
  String? _currentUserId;

  // Penyimpanan session
  SessionDataStore get _session => Get.find<SessionDataStore>();

  Future<MqttService> init() async {
    // Listen perubahan user dari session data store
    ever(_session.sessionUserId, _handleUserIdChanged);

    // Jalankan sekali untuk nilai awal (user sudah login)
    _handleUserIdChanged(_session.sessionUserId.value);

    return this;
  }

  Future<void> _handleUserIdChanged(String userId) async {
    // Backoff
    if (userId.isEmpty) {
      _currentUserId = null;
      if (isConnected.value) _client.disconnect();
      logger.w('MQTT : NO ID CLIENT');
      return;
    }

    // Tidak perlu koneksi ulang, jika token dipakai saat ini
    if (_currentUserId == userId && isConnected.value) {
      logger.i('MQTT : Already Connected');
      return;
    }

    // User baru atau berubah
    _currentUserId = userId;
    await connect(userId);
  }

  Future<void> connect(String userId) async {
    // Putus terlebih dahulu
    if (isConnected.value) {
      _client.disconnect();
      isConnected.value = false;
    }

    // Generate client baru
    _client = MqttServerClient.withPort(host, '', port)
      ..logging(on: false)
      ..keepAlivePeriod = 20
      ..autoReconnect = true
      ..resubscribeOnAutoReconnect = true;

    _client.onConnected = () {
      logger.i('MQTT : Connected');
      isConnected.value = true;
    };

    _client.onDisconnected = () {
      isConnected.value = false;
    };

    final connMess = MqttConnectMessage()
      ..withClientIdentifier('app-$userId')
      ..startClean().withWillQos(MqttQos.atLeastOnce);

    _client.connectionMessage = connMess;

    try {
      // Koneksi ke MQTT Broker / Server
      await _client.connect();

      if (_client.connectionStatus?.state != MqttConnectionState.connected) {
        _client.disconnect();
        logger.w('MQTT : Can connected');
        return;
      }

      // Jika sudah terhubung, maka listener update dapat digunakan sebagai broadcasting data dari subscribe (menerima kiriman data)
      _client.updates!.listen((
        List<MqttReceivedMessage<MqttMessage>> messages,
      ) {
        for (var message in messages) {
          _stream.add(message);
        }
      });
    } catch (e) {
      _client.disconnect();
    }
  }

  // Subscribe topic untuk menerima data
  void subscribe({
    required String topic,
    MqttQos qos = MqttQos.atLeastOnce,
  }) async {
    // if (_client.connectionStatus?.state != MqttConnectionState.connected) {
    //   return;
    // }

    if (!isConnected.value) {
      // logger.w('Skip subscribe "$topic": MQTT belum terkoreksi');
      return;
    }

    _client.subscribe(topic, qos);
  }

  // Stream pesan teks atau data berdasarkan topic
  Stream<String> onMessage(String topic) {
    return _stream.stream.where((m) => m.topic == topic).map((m) {
      final payload = m.payload as MqttPublishMessage;

      return MqttPublishPayload.bytesToStringAsString(payload.payload.message);
    });
  }

  // Publish topic untuk mengirim data
  void publish({
    required String topic,
    required String data,
    MqttQos qos = MqttQos.atLeastOnce,
    bool retain = false,
  }) {
    // if (_client.connectionStatus?.state != MqttConnectionState.connected) {
    //   return;
    // }
    if (!isConnected.value) return;

    final builder = MqttClientPayloadBuilder().addString(data);
    _client.publishMessage(topic, qos, builder.payload!, retain: retain);
  }

  // Unsubscribe
  void unsubscribe({required String topic}) {
    if (!isConnected.value) return;
    _client.unsubscribe(topic);
  }
}
