class ChildModel {
  final int id;
  final String userId;
  final String name;
  final int umur;
  final String jenisKelamin;
  final String createdAt;
  final String updatedAt;
  final int imunCount;
  final List<LayananAnak> layananAnak;

  ChildModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.umur,
    required this.jenisKelamin,
    required this.createdAt,
    required this.updatedAt,
    required this.imunCount,
    required this.layananAnak,
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
      imunCount: int.parse(json['imun_count']),
      layananAnak: (json['layanan_anak'] as List)
          .map((i) => LayananAnak.fromJson(i))
          .toList(),
    );
  }
}

class LayananAnak {
  final int id;
  final int anakId;
  final int beratBadan;
  final int tinggiBadan;
  final int lingkarkepala;

  LayananAnak({
    required this.id,
    required this.anakId,
    required this.beratBadan,
    required this.tinggiBadan,
    required this.lingkarkepala,
  });

  factory LayananAnak.fromJson(Map<String, dynamic> json) {
    return LayananAnak(
      id: json['id'],
      anakId: int.parse(json['anak_id']),
      beratBadan: int.parse(json['berat_badan']),
      tinggiBadan: int.parse(json['tinggi_badan']),
      lingkarkepala: int.parse(json['lingkar_kepala']),
    );
  }
}
