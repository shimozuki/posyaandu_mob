// ignore: unused_import
import 'dart:convert';

class ListItem {
  int id;
  String judul;
  String deskripsi;
  String tipe;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  ListItem({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.tipe,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ListItem.fromJson(Map<String, dynamic> json) {
    return ListItem(
      id: json['id'],
      judul: json['judul'],
      deskripsi: json['deskripsi'],
      tipe: json['tipe'],
      image: 'https://posyandulontoengal.xyz/storage/${json['image']}',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  static List<ListItem> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => ListItem.fromJson(json)).toList();
  }
}
