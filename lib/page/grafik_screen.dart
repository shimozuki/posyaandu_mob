import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GrafikScreen extends StatefulWidget {
  @override
  _GrafikScreenState createState() => _GrafikScreenState();
}

class _GrafikScreenState extends State<GrafikScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('Grafik Berat Badan'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back action
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              color: Colors.pink[50],
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/profile.jpg'), // make sure to add your profile image in assets folder
                ),
                title: Text('Asraf Zahirul Ubaid'),
                subtitle: Text('4 Tahun'),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildWeightChangeCard('KeNaiakan', '+27kg', Colors.green),
                _buildWeightChangeCard('KeNaiakan', '-27kg', Colors.red),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                      leftTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                          getTitlesWidget: (value, meta) {
                            switch (value.toInt()) {
                              case 0:
                                return Text('Aug');
                              case 1:
                                return Text('Sep');
                              case 2:
                                return Text('Okt');
                              case 3:
                                return Text('Nov');
                              case 4:
                                return Text('Des');
                              case 5:
                                return Text('Jan');
                              default:
                                return Text(' ');
                            }
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    minX: 0,
                    maxX: 5,
                    minY: 0,
                    maxY: 6,
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 3),
                          FlSpot(1, 4),
                          FlSpot(2, 3.5),
                          FlSpot(3, 4.5),
                          FlSpot(4, 3),
                          FlSpot(5, 4),
                        ],
                        isCurved: true,
                        color: Colors.pinkAccent,
                        barWidth: 3,
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: [
                              Colors.pinkAccent.withOpacity(0.3),
                              Colors.pinkAccent.withOpacity(0.0),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
            icon: Icon(Icons.bar_chart),
            label: 'Grafik',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: 2,
        selectedItemColor: Colors.pinkAccent,
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }

  Widget _buildWeightChangeCard(String title, String weight, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title, style: TextStyle(color: color)),
            SizedBox(height: 10),
            Text(weight,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: GrafikScreen(),
  ));
}
