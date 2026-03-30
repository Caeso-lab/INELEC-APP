import 'package:flutter/material.dart';

class GradesScreen extends StatelessWidget {
  const GradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // We use a Column inside the body instead of an AppBar 
      // to match your custom design with the back arrow.
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Custom Header with Back Button
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_circle_left_outlined, size: 30),
                    onPressed: () => Navigator.maybePop(context),
                  ),
                  const Spacer(),
                  const Icon(Icons.school, color: Color(0xFF701B99), size: 50),
                  const Spacer(),
                  const SizedBox(width: 48), // Balancing the back button space
                ],
              ),
              const Text(
                "Grade Calculator", 
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
              ),
              const SizedBox(height: 20),
              
              // Table Container
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF701B99), width: 1.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SingleChildScrollView(
                    child: DataTable(
                      columnSpacing: 20,
                      columns: const [
                        DataColumn(label: Text('Module Name', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Grade', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Coeff', style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                      rows: const [
                        DataRow(cells: [DataCell(Text('Math II')), DataCell(Text('12.5')), DataCell(Text('2'))]),
                        DataRow(cells: [DataCell(Text('Math III')), DataCell(Text('11.3')), DataCell(Text('2'))]),
                        DataRow(cells: [DataCell(Text('Physics II')), DataCell(Text('9.5')), DataCell(Text('3'))]),
                        DataRow(cells: [DataCell(Text('Chemistry II')), DataCell(Text('11.7')), DataCell(Text('2'))]),
                        DataRow(cells: [DataCell(Text('English II')), DataCell(Text('16.6')), DataCell(Text('1'))]),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              
              // Bottom Summary Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: const Color(0xFF701B99),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Weighted Average: 13.53", 
                      style: TextStyle(color: Colors.white, fontSize: 16)
                    ),
                    Text(
                      "Passed", 
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}