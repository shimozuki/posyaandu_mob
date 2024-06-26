// listAnak_controller.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:posyandu/model/listAnak_model.dart';

class ListAnakController {
  final String apiUrl = 'https://posyandulontoengal.xyz/api/children';

  Future<List<ChildModel>> fetchChildren(String userId) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode({'user_id': userId}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<ChildModel> children =
          data.map((json) => ChildModel.fromJson(json)).toList();
      return children;
    } else {
      throw Exception('Failed to load children');
    }
  }
}
