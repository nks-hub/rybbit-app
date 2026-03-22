class User {
  final String? email;
  final String? name;
  final String? id;
  final String? role;

  const User({this.email, this.name, this.id, this.role});

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json['email'] as String?,
        name: json['name'] as String?,
        id: json['id']?.toString(),
        role: json['role'] as String?,
      );
}
