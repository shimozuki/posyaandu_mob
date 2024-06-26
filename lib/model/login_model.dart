class LoginResponse {
  final String message;
  final User user;

  LoginResponse({required this.message, required this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'],
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  final int id;
  final String adminId;
  final String email;
  final String nik;
  final String name;
  final String noHp;
  final String alamat;
  final String isPregnant;
  final String createdAt;
  final String updatedAt;

  User({
    required this.id,
    required this.adminId,
    required this.email,
    required this.nik,
    required this.name,
    required this.noHp,
    required this.alamat,
    required this.isPregnant,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      adminId: json['admin_id'],
      email: json['email'],
      nik: json['nik'],
      name: json['name'],
      noHp: json['no_hp'],
      alamat: json['alamat'],
      isPregnant: json['is_pregnant'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
