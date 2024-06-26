import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:posyandu/model/login_model.dart';

class LoginController {
  Future<LoginResponse?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('https://posyandulontoengal.xyz/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      // Handle errors
      return null;
    }
  }
}
