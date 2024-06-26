class Anak {
  final int id;
  final int userId;
  final String name;
  final String umur;
  final String jenisKelamin;
  final DateTime createdAt;
  final DateTime updatedAt;

  Anak({
    required this.id,
    required this.userId,
    required this.name,
    required this.umur,
    required this.jenisKelamin,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Anak.fromJson(Map<String, dynamic> json) {
    return Anak(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      umur: json['umur'],
      jenisKelamin: json['jenis_kelamin'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
