import 'package:flutter/material.dart';
import 'sidemenu.dart';

class AssignmentsPage extends StatefulWidget {
  const AssignmentsPage({super.key});

  @override
  State<AssignmentsPage> createState() => _AssignmentsPageState();
}

class _AssignmentsPageState extends State<AssignmentsPage> {
  // Dummy data tugas
  List<Map<String, dynamic>> assignments = [
    {"title": "Laporan Modul 7", "deadline": "Besok", "isDone": false, "color": Colors.red},
    {"title": "Project Akhir Mobile", "deadline": "2 Minggu lagi", "isDone": false, "color": Colors.orange},
    {"title": "Presentasi PKN", "deadline": "3 Hari lagi", "isDone": true, "color": Colors.green},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Tugas"), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      drawer: const SideMenu(),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: assignments.length,
        itemBuilder: (context, index) {
          return Card(
            color: assignments[index]['isDone'] ? Colors.grey[200] : Colors.white,
            child: CheckboxListTile(
              activeColor: Colors.indigo,
              title: Text(
                assignments[index]['title'],
                style: TextStyle(
                  decoration: assignments[index]['isDone'] ? TextDecoration.lineThrough : TextDecoration.none,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "Deadline: ${assignments[index]['deadline']}",
                style: TextStyle(color: assignments[index]['color']),
              ),
              value: assignments[index]['isDone'],
              onChanged: (bool? value) {
                setState(() {
                  assignments[index]['isDone'] = value!;
                });
              },
              secondary: Icon(
                Icons.assignment,
                color: assignments[index]['isDone'] ? Colors.grey : assignments[index]['color'],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Logika tambah tugas bisa ditambahkan di sini
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Fitur tambah tugas segera hadir!")));
        },
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}