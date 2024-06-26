import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.pinkAccent,
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Jadwal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Grafik',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: 3,
        selectedItemColor: Colors.pinkAccent,
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }

  Widget _buildAccountSettingItem(
      BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.pinkAccent,
      ),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfileScreen(),
  ));
}
