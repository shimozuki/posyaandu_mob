// controller_list.dart

import 'package:http/http.dart' as http;
import 'package:posyandu/model/model_list.dart';
import 'dart:convert';

class ListController {
  final String apiUrl = 'https://posyandulontoengal.xyz/api/list';

  Future<List<ListItem>> fetchListItems() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'] as List;
      return ListItem.listFromJson(data);
    } else {
      throw Exception('Failed to load list items');
    }
  }
}
