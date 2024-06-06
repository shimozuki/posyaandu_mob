import 'dart:async';
import 'package:flutter/material.dart';
import 'package:posyandu/page/home_page.dart'; // Ensure you have this import

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    // Navigate to MyHomePage after 5 seconds
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                'assets/images/backg-1.png',
                fit: BoxFit.cover,
              ),
            ),
            // Other contents of the screen
            Container(
              padding: EdgeInsets.fromLTRB(
                  44,
                  MediaQuery.of(context).size.height * 0.1,
                  43.11,
                  MediaQuery.of(context).size.height * 0.01),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 1.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 65.5),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // You can add more widgets here if needed
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
