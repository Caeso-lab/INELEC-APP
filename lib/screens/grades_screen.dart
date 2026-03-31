import 'package:flutter/material.dart';

// class GradesScreen extends StatelessWidget {
//   const GradesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // We use a Column inside the body instead of an AppBar
//       // to match your custom design with the back arrow.
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               // Custom Header with Back Button
//               Row(
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.arrow_circle_left_outlined, size: 30),
//                     onPressed: () => Navigator.maybePop(context),
//                   ),
//                   const Spacer(),
//                   const Icon(Icons.school, color: Color(0xFF701B99), size: 50),
//                   const Spacer(),
//                   const SizedBox(width: 48), // Balancing the back button space
//                 ],
//               ),
//               const Text(
//                 "Grade Calculator",
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
//               ),
//               const SizedBox(height: 20),

//               // Table Container
//               Expanded(
//                 child: Container(
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: const Color(0xFF701B99), width: 1.5),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: SingleChildScrollView(
//                     child: DataTable(
//                       columnSpacing: 20,
//                       columns: const [
//                         DataColumn(label: Text('Module Name', style: TextStyle(fontWeight: FontWeight.bold))),
//                         DataColumn(label: Text('Grade', style: TextStyle(fontWeight: FontWeight.bold))),
//                         DataColumn(label: Text('Coeff', style: TextStyle(fontWeight: FontWeight.bold))),
//                       ],
//                       rows: const [
//                         DataRow(cells: [DataCell(Text('Math II')), DataCell(Text('12.5')), DataCell(Text('2'))]),
//                         DataRow(cells: [DataCell(Text('Math III')), DataCell(Text('11.3')), DataCell(Text('2'))]),
//                         DataRow(cells: [DataCell(Text('Physics II')), DataCell(Text('9.5')), DataCell(Text('3'))]),
//                         DataRow(cells: [DataCell(Text('Chemistry II')), DataCell(Text('11.7')), DataCell(Text('2'))]),
//                         DataRow(cells: [DataCell(Text('English II')), DataCell(Text('16.6')), DataCell(Text('1'))]),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 15),

//               // Bottom Summary Bar
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF701B99),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Weighted Average: 13.53",
//                       style: TextStyle(color: Colors.white, fontSize: 16)
//                     ),
//                     Text(
//                       "Passed",
//                       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// The above is a static version of the GradesScreen.
// Below is a dynamic version that allows users to add modules,
// grades, and coefficients, and calculates the weighted average accordingly.

class GradesScreen extends StatefulWidget {
  const GradesScreen({super.key});

  @override
  State<GradesScreen> createState() => _GradesScreenState();
}

class _GradesScreenState extends State<GradesScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _moduleController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();
  final TextEditingController _coeffController = TextEditingController();
  final List<_GradeEntry> _entries = [];

  double get _weightedAverage {
    final totalWeight = _entries.fold<double>(
      0,
      (sum, entry) => sum + entry.coeff,
    );
    if (totalWeight == 0) return 0;
    final totalPoints = _entries.fold<double>(
      0,
      (sum, entry) => sum + entry.grade * entry.coeff,
    );
    return totalPoints / totalWeight;
  }

  bool get _isPassed => _weightedAverage >= 10;

  void _addEntry() {
    if (!_formKey.currentState!.validate()) return;

    final moduleName = _moduleController.text.trim();
    final grade = double.parse(_gradeController.text.trim());
    final coeff = double.parse(_coeffController.text.trim());

    setState(() {
      _entries.add(_GradeEntry(moduleName, grade, coeff));
      _moduleController.clear();
      _gradeController.clear();
      _coeffController.clear();
    });
  }

  void _removeEntry(int index) {
    setState(() {
      _entries.removeAt(index);
    });
  }

  @override
  void dispose() {
    _moduleController.dispose();
    _gradeController.dispose();
    _coeffController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_circle_left_outlined,
                      size: 30,
                    ),
                    onPressed: () => Navigator.maybePop(context),
                  ),
                  const Spacer(),
                  const Icon(Icons.school, color: Color(0xFF701B99), size: 50),
                  const Spacer(),
                  const SizedBox(width: 48),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Grade Calculator',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _moduleController,
                      decoration: const InputDecoration(
                        labelText: 'Module Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Enter the module name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _gradeController,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            decoration: const InputDecoration(
                              labelText: 'Grade',
                              hintText: 'e.g. 14.5',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Enter a grade';
                              }
                              final grade = double.tryParse(value);
                              if (grade == null || grade < 0 || grade > 20) {
                                return 'Grade must be 0-20';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            controller: _coeffController,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            decoration: const InputDecoration(
                              labelText: 'Coeff',
                              hintText: 'e.g. 2',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Enter a coefficient';
                              }
                              final coeff = double.tryParse(value);
                              if (coeff == null || coeff <= 0) {
                                return 'Coeff must be > 0';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.add, color: Colors.white),
                        label: const Text(
                          'Add Module',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF701B99),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: _addEntry,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: _entries.isEmpty
                    ? Center(
                        child: Text(
                          'Add modules to calculate your weighted average.',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF701B99),
                            width: 1.3,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: SingleChildScrollView(
                          child: DataTable(
                            headingRowColor: MaterialStateProperty.all(
                              const Color(0xFFEDE6F3),
                            ),
                            columnSpacing: 16,
                            columns: const [
                              DataColumn(
                                label: Text(
                                  'Module',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Grade',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Coeff',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              DataColumn(label: Text('')),
                            ],
                            rows: List.generate(_entries.length, (index) {
                              final entry = _entries[index];
                              return DataRow(
                                cells: [
                                  DataCell(Text(entry.module)),
                                  DataCell(
                                    Text(entry.grade.toStringAsFixed(1)),
                                  ),
                                  DataCell(
                                    Text(entry.coeff.toStringAsFixed(1)),
                                  ),
                                  DataCell(
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete_outline,
                                        color: Colors.redAccent,
                                      ),
                                      onPressed: () => _removeEntry(index),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ),
                        ),
                      ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 18,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F0FA),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFDDD7EB)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Weighted Average: ${_weightedAverage.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Result:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          _entries.isEmpty
                              ? 'No modules added'
                              : (_isPassed ? 'Passed' : 'Failed'),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: _entries.isEmpty
                                ? Colors.grey
                                : (_isPassed ? Colors.green : Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GradeEntry {
  final String module;
  final double grade;
  final double coeff;

  _GradeEntry(this.module, this.grade, this.coeff);
}
