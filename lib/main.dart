import 'package:flutter/material.dart';

import 'task1/library_task.dart';
import 'task2/rating_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Практична робота',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Практичні завдання'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Завдання 1'),
            subtitle: const Text('Класи та колекції'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const LibraryScreen(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Завдання 2'),
            subtitle: const Text('RatingBadge'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const RatingScreen(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.navigation),
            title: const Text('Завдання 3'),
            subtitle: const Text('Навігація'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const Task3Screen(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.cloud),
            title: const Text('Завдання 4'),
            subtitle: const Text('Future та Stream'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Task 4 буде додано пізніше',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Task3Screen extends StatelessWidget {
  const Task3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Завдання 3')),
      body: const Center(child: Text('Навігація')),
    );
  }
}