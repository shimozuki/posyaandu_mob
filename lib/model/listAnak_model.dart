// listAnak_model.dart

class ChildModel {
  final int id;
  final String userId;
  final String name;
  final int umur;
  final String jenisKelamin;
  final String createdAt;
  final String updatedAt;

  ChildModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.umur,
    required this.jenisKelamin,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ChildModel.fromJson(Map<String, dynamic> json) {
    return ChildModel(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      umur: int.parse(json['umur']),
      jenisKelamin: json['jenis_kelamin'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
