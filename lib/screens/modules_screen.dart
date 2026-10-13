import 'package:flutter/material.dart';

class ModulesScreen extends StatelessWidget {
  const ModulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          backgroundColor: colorScheme.primary,
          elevation: 0,
          title: const Text(
            'MODULES',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          foregroundColor: colorScheme.onPrimary,
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: colorScheme.onPrimary,
            indicatorWeight: 3,
            labelColor: colorScheme.onPrimary,
            unselectedLabelColor: colorScheme.onPrimary.withValues(alpha: 0.7),
            tabs: [
              Tab(text: 'SEMESTRE 1'),
              Tab(text: 'SEMESTRE 2'),
            ],
          ),
        ),
        body: TabBarView(
          children: [_buildModuleList1(context), _buildModuleList2(context)],
        ),
      ),
    );
  }

  Widget _buildModuleList1(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(width: 8),
              Text(
                'Semester I',
                style: TextStyle(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    spreadRadius: 2,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: ListView(
                // Add all your modules here
                children: const [
                  ModuleItemTile(title: "Algorithmic"),
                  ModuleItemTile(title: "Math I"),
                  ModuleItemTile(title: "Chemistry I"),
                  ModuleItemTile(title: "Physics I"),
                  ModuleItemTile(title: "Physics I Lab"),
                  ModuleItemTile(title: "English I"),
                  ModuleItemTile(
                    title: "Writing Methods, Ethics and Deontology",
                  ),
                  ModuleItemTile(title: "Free and Open-Source Software"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildModuleList2(BuildContext context) {
  final colorScheme = Theme.of(context).colorScheme;
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(width: 8),
            Text(
              'Semester II',
              style: TextStyle(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 2,
                  blurRadius: 10,
                ),
              ],
            ),
            child: ListView(
              // Add all your modules here
              children: const [
                ModuleItemTile(title: "Math II "),
                ModuleItemTile(title: "Math III"),
                ModuleItemTile(title: "Chemistry II"),
                ModuleItemTile(title: "Physics II"),
                ModuleItemTile(title: "Physics II Lab"),
                ModuleItemTile(title: "English II"),
                ModuleItemTile(title: "Electrical Engineering I"),
                ModuleItemTile(title: "Electrical Engineering I Lab"),
                ModuleItemTile(title: "Introduction to C programming"),
                ModuleItemTile(
                  title: "Oral Presentation and information techniques",
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

class ModuleItemTile extends StatelessWidget {
  final String title;

  const ModuleItemTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
      ),
    );
  }
}
