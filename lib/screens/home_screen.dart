import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Wrap with SingleChildScrollView to prevent overflow
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20), // Spacing from top
            // The Purple Cap Icon
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFF701B99),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(Icons.school, color: Colors.white, size: 40),
            ),
            const SizedBox(height: 40),
            
            // Navigation Buttons
            _buildMenuButton(context, Icons.grid_view, 'Time Table'),
            _buildMenuButton(context, Icons.access_time, 'Assignments'),
            _buildMenuButton(context, Icons.calendar_today, 'Exam Schedule'),
            _buildMenuButton(context, Icons.calculate, 'Grade Calculator'),
            
            const SizedBox(height: 20), // Bottom padding to ensure last item is clear
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: InkWell( // Use InkWell for better touch feedback
        onTap: () {
          print("$title clicked");
        },
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF701B99), width: 1.5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center( // Using Center + Row for more control than ListTile
            child: Row(
              children: [
                const SizedBox(width: 20),
                Icon(icon, color: Colors.black, size: 30),
                const SizedBox(width: 20),
                Text(
                  title,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}