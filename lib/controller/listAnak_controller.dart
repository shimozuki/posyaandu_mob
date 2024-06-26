import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/listAnak_model.dart';

class ListAnakController {
  final String endpoint = 'https://posyandulontoengal.xyz/api/children';

  Future<List<Anak>> fetchAnak(int userId) async {
    final response = await http.post(
      Uri.parse(endpoint),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'user_id': userId}),
    );

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Anak> anakList =
          body.map((dynamic item) => Anak.fromJson(item)).toList();
      return anakList;
    } else {
      throw Exception('Failed to load children');
    }
  }
}
