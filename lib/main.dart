import 'package:flutter/material.dart';
import 'package:posyandu/page/login_screen.dart';
import 'package:posyandu/page/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      routes: {
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
