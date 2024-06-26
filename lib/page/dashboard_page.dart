import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String _selectedPosyandu = 'Posyandu Lonto Engal';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal Posyandu'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            // Add menu action
          },
        ),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage(
                'assets/profile.jpg'), // make sure to add your profile image in assets folder
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Posyandu Lonto Engal',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Nama Anak',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: _selectedPosyandu,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.pinkAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  if (newValue != null) {
                    _selectedPosyandu = newValue;
                  }
                });
              },
              items: <String>['Posyandu Lonto Engal', 'Posyandu Semu Raya']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            Text(
              'Jadwal Posyandu',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Card(
                    color: Colors.pink[100],
                    child: Container(
                      width: 150,
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Jadwal Posyandu',
                              style: TextStyle(fontSize: 16)),
                          SizedBox(height: 10),
                          Text('Semu Raya'),
                          SizedBox(height: 10),
                          Text('Minggu, 15 Januari 09.00 - 12.00'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.pink[200],
                    child: Container(
                      width: 150,
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Jadwal Posyandu',
                              style: TextStyle(fontSize: 16)),
                          SizedBox(height: 10),
                          Text('Lonto Engal'),
                          SizedBox(height: 10),
                          Text('Senin, 16 Januari 09.00 - 12.00'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    color: Colors.blue[100],
                    child: Column(
                      children: [
                        Text('Usia Anak', style: TextStyle(fontSize: 18)),
                        SizedBox(height: 10),
                        Text('20',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        Text('Tahun'),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    color: Colors.pink[100],
                    child: Column(
                      children: [
                        Text('Imunisasi Ke', style: TextStyle(fontSize: 18)),
                        SizedBox(height: 10),
                        Text('2',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    color: Colors.yellow[100],
                    child: Column(
                      children: [
                        Text('Gizi Anak', style: TextStyle(fontSize: 18)),
                        SizedBox(height: 10),
                        Text('Normal',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    color: Colors.green[100],
                    child: Column(
                      children: [
                        Text('Berat Badan', style: TextStyle(fontSize: 18)),
                        SizedBox(height: 10),
                        Text('2',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.purple[100],
              child: Column(
                children: [
                  Text('Tinggi Badan', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  Text('100',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text('Cm'),
                ],
              ),
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
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.pink,
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DashboardScreen(),
  ));
}
