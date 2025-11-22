class Sector {
  final int id;
  final String name;
  final int deviceCount;
  final int userId;

  // Constructor
  Sector({
    required this.id,
    required this.name,
    required this.deviceCount,
    required this.userId,
  });

  factory Sector.fromJson(Map<String, dynamic> json) => Sector(
    id: json['id'],
    name: json['name'],
    deviceCount: json['device_count'],
    userId: json['user_id'],
  );

  // static List<Sector> fromJsonList(List<dynamic> list) =>
  //     list.map((e) => Sector.fromJson(e as Map<String, dynamic>)).toList();

  Sector copyWith({int? id, String? name, int? deviceCount, int? userId}) =>
      Sector(
        id: id ?? this.id,
        name: name ?? this.name,
        deviceCount: deviceCount ?? this.deviceCount,
        userId: userId ?? this.userId,
      );

  // Label jumlah perangkat yang akan ditampilkan pada ui
  String get deviceCountLabel =>
      deviceCount == 0 ? 'Tidak ada perangkat' : '$deviceCount perangkat';

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'device_count': deviceCount,
    'user_id': userId,
  };
}
