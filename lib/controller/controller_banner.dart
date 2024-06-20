import 'package:http/http.dart' as http;
import 'package:posyandu/model/model_banner.dart';
import 'dart:convert';

class CustomBannerController {
  final String apiUrl = 'https://posyandulontoengal.xyz/api/banner';

  Future<List<CustomBanner>> fetchBanners() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'] as List;
      return CustomBanner.listFromJson(data);
    } else {
      throw Exception('Failed to load banners');
    }
  }
}
