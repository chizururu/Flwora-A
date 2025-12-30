class User {
  final int id;
  final String name;
  final String email;
  final String token;

  // Constructor
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    token: json['token'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'token': token,
  };
}
