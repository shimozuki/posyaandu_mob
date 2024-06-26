import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posyandu/controller/login_controller.dart';
import 'package:posyandu/page/dashboard_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginController _loginController = LoginController();

  void _login() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final response = await _loginController.login(email, password);

    if (response != null && response.message == "Login successful") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardScreen(user: response.user),
        ),
      );
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Image or Illustration
              Container(
                height: 200,
                child: Image.asset(
                    'assets/images/bg.png'), // make sure to add your image in assets folder
              ),
              SizedBox(height: 20),
              // Email Field
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email ID',
                  labelStyle: TextStyle(color: Color(0xFFFFA4B6)),
                  prefixIcon: Icon(
                    Icons.alternate_email,
                    color: Color(0xFFFFA4B6),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Password Field
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Color(0xFFFFA4B6)),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Color(0xFFFFA4B6),
                  ),
                  suffixText: 'Forgot?',
                ),
              ),
              SizedBox(height: 20),
              // Login Button
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFA4B6),
                  padding: EdgeInsets.symmetric(horizontal: 120, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  'Login',
                  style: GoogleFonts.cabin(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Footer Text
              Text(
                'Aplikasi Posyandu',
                style: GoogleFonts.cabin(
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  color: Color(0xFF878787),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
