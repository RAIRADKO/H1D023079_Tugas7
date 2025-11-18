import 'package:flutter/material.dart';
import 'sidemenu.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  final List<Map<String, String>> schedule = const [
    {
      "day": "Senin",
      "subject": "Pemrograman Mobile",
      "time": "08:00 - 10:30",
      "room": "Lab Komputer 1",
      "dosen": "Bpk. Flutter"
    },
    {
      "day": "Senin",
      "subject": "Kecerdasan Buatan",
      "time": "13:00 - 15:30",
      "room": "R. Teori 3",
      "dosen": "Ibu AI"
    },
    {
      "day": "Rabu",
      "subject": "Basis Data Lanjut",
      "time": "09:00 - 11:30",
      "room": "Lab Komputer 2",
      "dosen": "Bpk. SQL"
    },
    {
      "day": "Jumat",
      "subject": "Manajemen Proyek",
      "time": "14:00 - 16:00",
      "room": "R. Seminar",
      "dosen": "Ibu Agile"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Jadwal Kuliah"), backgroundColor: Colors.indigo, foregroundColor: Colors.white,),
      drawer: const SideMenu(),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: schedule.length,
        itemBuilder: (context, index) {
          final item = schedule[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Container(
              decoration: BoxDecoration(
                border: Border(left: BorderSide(color: Colors.indigo, width: 5)), // Aksen warna di kiri
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: CircleAvatar(
                  backgroundColor: Colors.indigo[50],
                  child: Text(item['day']!.substring(0, 3).toUpperCase(), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                ),
                title: Text(item['subject']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Row(children: [Icon(Icons.access_time, size: 16, color: Colors.grey), SizedBox(width: 5), Text(item['time']!)]),
                    const SizedBox(height: 4),
                    Row(children: [Icon(Icons.location_on, size: 16, color: Colors.grey), SizedBox(width: 5), Text(item['room']!)]),
                    const SizedBox(height: 4),
                    Row(children: [Icon(Icons.person, size: 16, color: Colors.grey), SizedBox(width: 5), Text(item['dosen']!)]),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}