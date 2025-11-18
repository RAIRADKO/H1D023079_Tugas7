import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'schedule_page.dart';
import 'assignments_page.dart';
import 'profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.indigo, // Warna tema yang lebih elegan
        useMaterial3: true,
      ),
      // Mengatur route awal
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/schedule': (context) => const SchedulePage(), // Route Jadwal
        '/assignments': (context) => const AssignmentsPage(), // Route Tugas
        '/profile': (context) => const ProfilePage(), // Route Profil
      },
    );
  }
}