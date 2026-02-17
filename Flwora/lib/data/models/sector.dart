class Sector {
  final int id;
  final String name;
  final int deviceCount;
  final int userId;

  Sector({
    required this.id,
    required this.name,
    required this.deviceCount,
    required this.userId,
  });

  factory Sector.fromJson(Map<String, dynamic> json) => Sector(
    id: json['id'],
    name: json['name'],
    deviceCount: json['device_count'] ?? 0,
    userId: json['user_id'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'device_count': deviceCount,
    'user_id': userId,
  };
}
