import 'package:flutter/material.dart';
import 'weather_service.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() =>
      _WeatherScreenState();
}

class _WeatherScreenState
    extends State<WeatherScreen> {
  final cityController = TextEditingController();

  final WeatherService service =
      WeatherService();

  String result = '';
  List<int> temperatures = [];

  Future<void> loadWeather() async {
    try {
      final weather =
          await service.fetchCurrentWeather(
        cityController.text.trim(),
      );

      setState(() {
        result =
            '${weather['city']}: '
            '${weather['temp']}°C, '
            '${weather['condition']}';
      });
    } catch (e) {
      setState(() {
        result = 'Помилка: $e';
      });
    }
  }

  Future<void> startStream() async {
    temperatures.clear();

    await for (final temp
        in service.temperatureUpdates(
      times: 5,
    )) {
      setState(() {
        temperatures.add(temp);
      });
    }
  }

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Завдання 4'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: cityController,
              decoration:
                  const InputDecoration(
                labelText: 'Місто',
                border:
                    OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: loadWeather,
              child: const Text(
                'Отримати погоду',
              ),
            ),

            const SizedBox(height: 12),

            Text(
              result,
              style: const TextStyle(
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const Divider(height: 40),

            ElevatedButton(
              onPressed: startStream,
              child: const Text(
                'Запустити Stream',
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount:
                    temperatures.length,
                itemBuilder:
                    (context, index) {
                  return ListTile(
                    leading: const Icon(
                      Icons.thermostat,
                    ),
                    title: Text(
                      '${temperatures[index]}°C',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}