import 'dart:math';

class WeatherService {
  final Random _random = Random();

  Future<Map<String, dynamic>> fetchCurrentWeather(
    String city,
  ) async {
    if (city.trim().isEmpty) {
      throw ArgumentError('Місто не вказано');
    }

    await Future.delayed(
      const Duration(seconds: 2),
    );

    const conditions = [
      'Сонячно',
      'Хмарно',
      'Дощ',
      'Вітряно',
    ];

    return {
      'city': city,
      'temp': _random.nextInt(36) - 5,
      'condition':
          conditions[_random.nextInt(conditions.length)],
    };
  }

  Stream<int> temperatureUpdates({
    int times = 5,
  }) async* {
    for (int i = 0; i < times; i++) {
      await Future.delayed(
        const Duration(seconds: 1),
      );

      yield _random.nextInt(36) - 5;
    }
  }
}