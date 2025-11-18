import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'sidemenu.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = "Loading...";
  String userNim = "Loading...";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('user_name') ?? "Mahasiswa";
      userNim = prefs.getString('user_nim') ?? "-";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profil Mahasiswa"), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      drawer: const SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bagian Header Profil
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              decoration: const BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Text(
                      userName.isNotEmpty ? userName[0].toUpperCase() : "?",
                      style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.indigo),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(userName, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  Text(userNim, style: const TextStyle(color: Colors.white70, fontSize: 16)),
                ],
              ),
            ),
            
            // Bagian Detail Informasi
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildProfileItem(Icons.email, "Email", "$userNim@student.university.ac.id"),
                  _buildProfileItem(Icons.school, "Program Studi", "Teknik Informatika"),
                  _buildProfileItem(Icons.calendar_today, "Angkatan", "2022"),
                  _buildProfileItem(Icons.phone, "No. HP", "+62 812-3456-7890"),
                  
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: () {
                       // Logika Edit Profil
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text("Edit Profil"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title, String value) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon, color: Colors.indigo),
        title: Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        subtitle: Text(value, style: const TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w500)),
      ),
    );
  }
}