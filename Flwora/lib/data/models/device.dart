class Device {
  final int id;
  final String name;
  final int sectorId;
  final String macAddress;
  final bool status;

  // Constructor
  Device({
    required this.id,
    required this.name,
    required this.sectorId,
    required this.macAddress,
    required this.status,
  });

  factory Device.fromJson(Map<String, dynamic> json) => Device(
    id: json['id'],
    name: json['name'],
    sectorId: json['sector_id'],
    macAddress: json['mac_address'],
    status: json['status'] == 1,
  );

  static List<Device> fromJsonList(List<dynamic> list) =>
      list.map((e) => Device.fromJson(e as Map<String, dynamic>)).toList();

  Device copyWith({
    int? id,
    String? name,
    int? sectorId,
    String? macAddress,
    bool? status,
  }) => Device(
    id: id ?? this.id,
    name: name ?? this.name,
    sectorId: sectorId ?? this.sectorId,
    macAddress: macAddress ?? this.macAddress,
    status: status ?? this.status,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'sector_id': sectorId,
    'mac_address': macAddress,
    'status': status ? 1 : 0,
  };
}
