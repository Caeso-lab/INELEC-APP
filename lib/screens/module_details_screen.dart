import 'package:flutter/material.dart';

class ModuleDetailsScreen extends StatelessWidget {
  const ModuleDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Module Details')),
      body: const Center(
        child: Text('Module Details Screen', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}