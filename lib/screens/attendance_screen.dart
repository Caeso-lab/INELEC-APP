import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: AttendanceScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  
  bool isLectureView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F8),
      appBar: AppBar(
        title: const Text("ATTENDANCE TRACKER", 
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xFFA67C52),
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildSummaryHeader(),
          _buildToggleButtons(),
          Expanded(
            child: isLectureView ? _buildAttendanceList("Lecture") : _buildAttendanceList("TD"),
          ),
        ],
      ),
    );
  }

  
  Widget _buildSummaryHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFFA67C52),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _statItem("Total Classes", "42"),
          _statItem("Attended", "38"),
          _statItem("Percentage", "90%"),
        ],
      ),
    );
  }

  Widget _statItem(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }

  
  Widget _buildToggleButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => isLectureView = true),
                child: Container(
                  decoration: BoxDecoration(
                    color: isLectureView ? const Color(0xFF004D40) : Colors.transparent,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  alignment: Alignment.center,
                  child: Text("Lectures", 
                    style: TextStyle(color: isLectureView ? Colors.white : Colors.black54, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => isLectureView = false),
                child: Container(
                  decoration: BoxDecoration(
                    color: !isLectureView ? const Color(0xFF004D40) : Colors.transparent,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  alignment: Alignment.center,
                  child: Text("TD (Tutorials)", 
                    style: TextStyle(color: !isLectureView ? Colors.white : Colors.black54, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // List of attendance records
  Widget _buildAttendanceList(String type) {
    // Dummy Data
    final List<Map<String, String>> records = [
      {"module": "Math II", "date": "Oct 12, 2023", "status": "Present"},
      {"module": "Physics II", "date": "Oct 11, 2023", "status": "Absent"},
      {"module": "Algorithmic", "date": "Oct 10, 2023", "status": "Present"},
      {"module": "Chemistry", "date": "Oct 09, 2023", "status": "Present"},
    ];

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: records.length,
      itemBuilder: (context, index) {
        bool isPresent = records[index]["status"] == "Present";
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 2,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: isPresent ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
              child: Icon(
                isPresent ? Icons.check_circle : Icons.cancel,
                color: isPresent ? Colors.green : Colors.red,
              ),
            ),
            title: Text("${records[index]["module"]} ($type)", 
              style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(records[index]["date"]!),
            trailing: Text(
              records[index]["status"]!,
              style: TextStyle(
                color: isPresent ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
