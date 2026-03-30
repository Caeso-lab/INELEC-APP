import 'package:flutter/material.dart';

class GradePlannerScreen extends StatelessWidget {
  const GradePlannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grade Planner')),
      body: const Center(
        child: Text('Grade Planner Screen', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}