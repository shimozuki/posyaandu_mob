import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posyandu/layout/footerbar.dart';
import 'package:posyandu/page/dashboard_page.dart';
import 'package:posyandu/page/grafik_screen.dart';
import 'package:posyandu/page/home_page.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 3;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    } else if (_selectedIndex == 1) {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => DashboardScreen()),
      // );
    } else if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GrafikScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFFFF),
          title: Center(
            child: Text(
              'Profile',
              style: GoogleFonts.cabin(
                textStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFFFFA4B6),
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 50,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Toreto',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Sumbawa, Indonesia',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 30),
              _buildAccountSettingItem(
                context,
                Icons.person,
                'Profile setting',
                () {
                  // Handle Profile setting navigation
                },
              ),
              _buildAccountSettingItem(
                context,
                Icons.location_on,
                'Lokasi Posyandu',
                () {
                  // Handle Lokasi Posyandu navigation
                },
              ),
              _buildAccountSettingItem(
                context,
                Icons.privacy_tip,
                'Privacy Policy',
                () {
                  // Handle Privacy Policy navigation
                },
              ),
              _buildAccountSettingItem(
                context,
                Icons.description,
                'Term & Condition',
                () {
                  // Handle Term & Condition navigation
                },
              ),
              _buildAccountSettingItem(
                context,
                Icons.logout,
                'Sign Out',
                () {
                  // Handle Sign Out
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: MyBottomNavigationBar(
          currentIndex: _selectedIndex,
          onTabTapped: _onTabTapped,
        ),
      ),
    );
  }

  Widget _buildAccountSettingItem(
      BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(
        icon,
        color: Color(0xFFFFA4B6),
      ),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
