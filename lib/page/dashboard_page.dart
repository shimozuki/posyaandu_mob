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
  String? selectedReport; // Initial value for dropdown
  List<ChildModel> children = [];
  List<JadwalModel> jadwals = [];
  ChildModel? selectedChild;

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
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 1.0,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 1.0,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                  isExpanded: true,
                  items: [
                    'Pilih Anak',
                    for (var child in children) child.name,
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
                      selectedChild = children
                          .firstWhere((child) => child.name == newValue);
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
                if (selectedChild != null)
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
                              '${selectedChild!.umur}',
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
                if (selectedChild != null)
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      _buildCard(
                          "Imunisasi Ke",
                          "${selectedChild!.imunCount}",
                          Color.fromARGB(255, 252, 182, 196),
                          Icons.local_hospital),
                      _buildCard("Gizi Anak", "Normal",
                          Color.fromARGB(255, 252, 233, 184), Icons.person),
                      _buildCard(
                          "Berat Badan",
                          "${selectedChild!.layananAnak.last.beratBadan} Kg",
                          Color.fromARGB(255, 174, 226, 250),
                          Icons.balance),
                      _buildCard(
                          "Tinggi Badan",
                          "${selectedChild!.layananAnak.last.tinggiBadan} Cm",
                          Color.fromARGB(255, 197, 249, 201),
                          Icons.height),
                      _buildCard(
                          "Lingkar Kepala",
                          "${selectedChild!.layananAnak.last.lingkarkepala} Cm",
                          Color.fromARGB(255, 197, 249, 201),
                          Icons.health_and_safety),
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

  Widget _buildCard(String title, String value, Color color, IconData icon) {
    return Card(
      color: color,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 9, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40), // Atur ukuran ikon sesuai kebutuhan
            SizedBox(height: 0), // Ubah jarak antar elemen sesuai kebutuhan
            Text(title,
                style: GoogleFonts.cabin(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                )),
            SizedBox(height: 10),
            Text(value, style: TextStyle(fontSize: 35)),
          ],
        ),
      ),
    );
  }
}
