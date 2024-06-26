// jadwal_model.dart

class JadwalModel {
  final int id;
  final String adminId;
  final String tanggal;
  final String createdAt;
  final String updatedAt;

  JadwalModel({
    required this.id,
    required this.adminId,
    required this.tanggal,
    required this.createdAt,
    required this.updatedAt,
  });

  factory JadwalModel.fromJson(Map<String, dynamic> json) {
    return JadwalModel(
      id: json['id'],
      adminId: json['admin_id'],
      tanggal: json['tanggal'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
