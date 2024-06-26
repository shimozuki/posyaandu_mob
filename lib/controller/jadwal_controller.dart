// jadwal_controller.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:posyandu/model/jadwal_model.dart';

class JadwalController {
  final String apiUrl = 'https://posyandulontoengal.xyz/api/jadwal';

  Future<List<JadwalModel>> fetchJadwal() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<JadwalModel> jadwals =
          data.map((json) => JadwalModel.fromJson(json)).toList();
      return jadwals;
    } else {
      throw Exception('Failed to load jadwal');
    }
  }
}
