import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key, required this.themeModeNotifier});

  final ValueNotifier<ThemeMode> themeModeNotifier;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Display Mode',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ValueListenableBuilder<ThemeMode>(
              valueListenable: themeModeNotifier,
              builder: (context, mode, child) {
                return RadioGroup<ThemeMode>(
                  groupValue: mode,
                  onChanged: (ThemeMode? value) {
                    if (value != null) {
                      themeModeNotifier.value = value;
                    }
                  },
                  child: Column(
                    children: const [
                      RadioListTile<ThemeMode>(
                        title: Text('Light Mode'),
                        value: ThemeMode.light,
                      ),
                      RadioListTile<ThemeMode>(
                        title: Text('Dark Mode'),
                        value: ThemeMode.dark,
                      ),
                      RadioListTile<ThemeMode>(
                        title: Text('System Default'),
                        value: ThemeMode.system,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
