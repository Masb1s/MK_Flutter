import 'package:flutter/material.dart';
import 'rating_badge.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  final ratingController = TextEditingController();
  final labelController = TextEditingController();

  double? rating;
  String? errorMessage;

  void showRating() {
    final value = double.tryParse(
      ratingController.text.trim(),
    );

    if (value == null) {
      setState(() {
        errorMessage = 'Введіть число';
        rating = null;
      });
      return;
    }

    if (value < 0 || value > 5) {
      setState(() {
        errorMessage =
            'Рейтинг повинен бути від 0 до 5';
        rating = null;
      });
      return;
    }

    setState(() {
      rating = value;
      errorMessage = null;
    });
  }

  @override
  void dispose() {
    ratingController.dispose();
    labelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Завдання 2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: ratingController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Рейтинг',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: labelController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Підпис',
              ),
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: showRating,
              child: const Text('Показати'),
            ),

            const SizedBox(height: 20),

            if (errorMessage != null)
              Text(
                errorMessage!,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),

            if (rating != null)
              RatingBadge(
                rating: rating!,
                label: labelController.text.trim(),
              ),
          ],
        ),
      ),
    );
  }
}