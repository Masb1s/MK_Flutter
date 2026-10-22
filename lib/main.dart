import 'package:flutter/material.dart';

import 'task1/library_task.dart';
import 'task2/rating_badge.dart';
import 'task3/home_screen.dart';
import 'task4/weather_service.dart';

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
            title: const Text('Завдання 1'),
            subtitle: const Text('Класи та колекції'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Завдання 2'),
            subtitle: const Text('RatingBadge'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Завдання 3'),
            subtitle: const Text('Навігація'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Завдання 4'),
            subtitle: const Text('Future та Stream'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}