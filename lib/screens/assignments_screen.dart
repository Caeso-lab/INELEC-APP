import 'package:flutter/material.dart';

class AssignmentsScreen extends StatelessWidget {
  const AssignmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Icon(Icons.school, color: Color(0xFF701B99), size: 50),
          const Text("Assignments", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF701B99), width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAssignmentItem("Electrical Engineering 1", "Due: April 5, 11:59 PM", "Problem_set_3A.pdf"),
                const Divider(height: 30),
                _buildAssignmentItem("Chemistry II", "Due: April 9, 11:59 PM", "Chem_II_Recit4.pdf"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssignmentItem(String title, String due, String fileName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Text(due, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF701B99)),
          icon: const Icon(Icons.picture_as_pdf, color: Colors.white),
          label: Text(fileName, style: const TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}