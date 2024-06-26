import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posyandu/controller/jadwal_controller.dart';
import 'package:posyandu/controller/listAnak_controller.dart';
import 'package:posyandu/layout/footerbar.dart';
import 'package:posyandu/model/jadwal_model.dart';
import 'package:posyandu/model/listAnak_model.dart';
import 'package:posyandu/model/login_model.dart';

class DashboardScreen extends StatefulWidget {
  final User user;

  DashboardScreen({required this.user});
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  String selectedReport = 'Pilih Anak'; // Initial value for dropdown
  List<ChildModel> children = [];
  List<JadwalModel> jadwals = [];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    fetchDataJ();
  }

  void fetchDataJ() async {
    try {
      JadwalController controller = JadwalController();
      List<JadwalModel> fetchedJadwals = await controller.fetchJadwal();
      setState(() {
        jadwals = fetchedJadwals;
      });
    } catch (e) {
      print('Error fetching jadwal: $e');
    }
  }

  void fetchData() async {
    try {
      ListAnakController controller = ListAnakController();
      List<ChildModel> fetchedChildren = await controller.fetchChildren(
          '${widget.user.id}'); // Replace '17' with actual user id
      setState(() {
        children = fetchedChildren;
      });
    } catch (e) {
      print('Error fetching children: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    String selectedReport = 'Pilih Anak';
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Profile and Dropdown
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Posyandu Bulan suar 1 dan 2",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text('Hi, Bun ${widget.user.name}',
                            style: TextStyle(fontSize: 22)),
                      ],
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage(
                          "assets/profile.jpg"), // Change this to the path of your image
                    ),
                  ],
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: selectedReport,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Colors.grey, // Warna garis saat tidak fokus
                        width: 1.0, // Ketebalan garis
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Colors.grey, // Warna garis saat fokus
                        width: 1.0, // Ketebalan garis
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Colors.red, // Warna garis saat ada error
                        width: 1.0, // Ketebalan garis
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color:
                            Colors.red, // Warna garis saat fokus dan ada error
                        width: 1.0, // Ketebalan garis
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.transparent, // Latar belakang transparan
                  ),
                  isExpanded: true,
                  items: [
                    'Pilih Anak',
                    for (var child in children)
                      '${child.name}' // Customize this as per your requirement
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xFF858597),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedReport = newValue!;
                    });
                  },
                ),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jadwal Posyandu",
                      style: GoogleFonts.cabin(
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                        color: Color(0xFF858597),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Carousel Slider
                CarouselSlider(
                  options: CarouselOptions(
                    height: 150.0,
                    autoPlay: false,
                    enlargeCenterPage: true,
                  ),
                  items: jadwals.map((jadwal) {
                    return Container(
                      width: 490, // Set lebar sesuai keinginan
                      height: 200, // Set tinggi sesuai keinginan
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Colors.pink[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.calendar_today, color: Colors.white),
                              SizedBox(width: 8.0),
                              Text(
                                'Jadwal Posyandu',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.location_on, color: Colors.white),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Bulan suar 1 dan 2',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 14.0),
                          Container(
                            padding: EdgeInsets.all(9.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5.0,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: Colors.pink[100],
                                  size: 18,
                                ),
                                Text(
                                  '${jadwal.tanggal} 09.00 - 12.00',
                                  style: TextStyle(
                                    fontSize: 12.8,
                                    color: Colors.pink[100],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Container(
                  width: 350,
                  height: 145, // Set lebar sesuai keinginan
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Usia Anak',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        children: [
                          Text(
                            '20',
                            style: TextStyle(
                              fontSize: 48.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            'Tahun',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Child's Details
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    _buildCard("Usia Anak", "20 Tahun", Colors.blueAccent),
                    _buildCard("Imunisasi Ke", "2", Colors.pinkAccent),
                    _buildCard("Gizi Anak", "Normal", Colors.amberAccent),
                    _buildCard("Berat Badan", "2 Kg", Colors.lightBlueAccent),
                    _buildCard("Tinggi Badan", "100 Cm", Colors.purpleAccent),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: MyBottomNavigationBar(
          currentIndex: _selectedIndex,
          onTabTapped: _onTabTapped,
        ),
      ),
    );
  }

  Widget _buildCard(String title, String value, Color color) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(value, style: TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}
