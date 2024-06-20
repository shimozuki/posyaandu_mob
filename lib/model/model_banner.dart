// ignore: unused_import
import 'dart:convert';

class CustomBanner {
  int id;
  String judul;
  String deskripsi;
  String tipe;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  CustomBanner({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.tipe,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CustomBanner.fromJson(Map<String, dynamic> json) {
    return CustomBanner(
      id: json['id'],
      judul: json['judul'],
      deskripsi: json['deskripsi'],
      tipe: json['tipe'],
      image: json['image'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'judul': judul,
      'deskripsi': deskripsi,
      'tipe': tipe,
      'image': image,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  static List<CustomBanner> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => CustomBanner.fromJson(json)).toList();
  }

  static List<dynamic> listToJson(List<CustomBanner> banners) {
    return banners.map((banner) => banner.toJson()).toList();
  }
}
