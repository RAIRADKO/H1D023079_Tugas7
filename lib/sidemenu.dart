import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  String userName = "Loading...";
  String userNim = "";

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

  void _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Hapus semua data session
    if (context.mounted) {
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(userName, style: const TextStyle(fontWeight: FontWeight.bold)),
            accountEmail: Text("NIM: $userNim"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                userName.isNotEmpty ? userName[0].toUpperCase() : "A",
                style: const TextStyle(fontSize: 24.0, color: Colors.indigo),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.indigo,
              image: DecorationImage(
                image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'), // Dummy BG
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () => Navigator.pushReplacementNamed(context, '/home'),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: const Text('Jadwal Kuliah'),
            onTap: () => Navigator.pushReplacementNamed(context, '/schedule'),
          ),
          ListTile(
            leading: const Icon(Icons.assignment),
            title: const Text('Tugas'),
            onTap: () => Navigator.pushReplacementNamed(context, '/assignments'),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profil Saya'),
            onTap: () => Navigator.pushReplacementNamed(context, '/profile'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () => _logout(context),
          ),
        ],
      ),
    );
  }
}