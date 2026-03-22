class OrgMember {
  final String userId;
  final String? email;
  final String? name;
  final String role;

  const OrgMember({
    required this.userId,
    this.email,
    this.name,
    required this.role,
  });

  factory OrgMember.fromJson(Map<String, dynamic> json) {
    return OrgMember(
      userId: json['user_id'] as String? ??
          json['userId'] as String? ??
          json['id'] as String? ??
          '',
      email: json['email'] as String?,
      name: json['name'] as String?,
      role: json['role'] as String? ?? 'member',
    );
  }
}
