import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Ensure these file names match your actual filenames in lib/screens/
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/modules_screen.dart';
import 'screens/assignments_screen.dart';
import 'screens/attendance_screen.dart';
import 'screens/grades_screen.dart'; // This file should contain class GradesScreen
import 'screens/planner_screen.dart';
import 'screens/calendar_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  // Added device preview for easier testing on different screen sizes during development.
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const InelecApp(),
    ),
  );
}

class InelecApp extends StatelessWidget {
  const InelecApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'INELEC APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Using the Purple from your design
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF701B99)),
        useMaterial3: true,
      ),
      // Typically, you'd start at a Login Screen.
      // For now, let's start at the Navigation Shell.
      home: const MainNavigationShell(),
    );
  }
}

class MainNavigationShell extends StatefulWidget {
  const MainNavigationShell({super.key});

  @override
  State<MainNavigationShell> createState() => _MainNavigationShellState();
}

class _MainNavigationShellState extends State<MainNavigationShell> {
  int _selectedIndex = 0;

  // The 5 main views for the Bottom Navigation Bar
  final List<Widget> _bottomBarScreens = [
    const HomeScreen(), // Main Menu with the 4 big buttons
    const ModulesScreen(), // Modules list
    const AssignmentsScreen(), // Assignments view
    const AttendanceScreen(), // Attendance view
    const GradesScreen(), // Grade Calculator / Grades view
  ];

  void _navigateTo(Widget screen) {
    Navigator.pop(context); // Close drawer
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'INELEC APP',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () => _navigateTo(const NotificationsScreen()),
          ),
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            onPressed: () => _navigateTo(const ProfileScreen()),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF701B99)),
              child: Center(
                child: Icon(Icons.school, color: Colors.white, size: 60),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.calculate_outlined),
              title: const Text('Grade Planner'),
              onTap: () => _navigateTo(const GradePlannerScreen()),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month_outlined),
              title: const Text('Calendar'),
              onTap: () => _navigateTo(const CalendarScreen()),
            ),
            const Spacer(),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Settings'),
              onTap: () => _navigateTo(const SettingsScreen()),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      body: IndexedStack(index: _selectedIndex, children: _bottomBarScreens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF701B99),
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            label: 'Modules',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.co_present_outlined),
            label: 'Attendance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.poll_outlined),
            label: 'Grades',
          ),
        ],
      ),
    );
  }
}
