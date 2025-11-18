import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'sidemenu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = "";

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  void _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('user_name') ?? "User";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Mahasiswa'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const SideMenu(), // Panggil Side Menu yang sudah dibuat
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Selamat Datang, $userName!",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildMenuCard(
                    Icons.book,
                    "Jadwal Kuliah",
                    Colors.blue,
                    () => Navigator.pushNamed(context, '/schedule'), // navigate to schedule
                  ),
                  _buildMenuCard(
                    Icons.assignment,
                    "Tugas",
                    Colors.orange,
                    () => Navigator.pushNamed(context, '/assignments'), // navigate to assignments
                  ),
                  _buildMenuCard(Icons.grade, "Nilai", Colors.green),
                  _buildMenuCard(Icons.settings, "Pengaturan", Colors.grey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget helper untuk membuat kartu menu
  Widget _buildMenuCard(IconData icon, String title, Color color, [VoidCallback? onTap]) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap ?? () {},
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: color),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}