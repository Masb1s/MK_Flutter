import 'package:flutter/material.dart';

class RatingBadge extends StatelessWidget {
  final double rating;
  final String? label;

  const RatingBadge({
    super.key,
    required this.rating,
    this.label,
  });

  Color get ratingColor {
    if (rating >= 4.0) {
      return Colors.green;
    }

    if (rating >= 2.5) {
      return Colors.orange;
    }

    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.star,
              color: ratingColor,
              size: 40,
            ),
            const SizedBox(height: 8),
            Text(
              rating.toStringAsFixed(1),
              style: TextStyle(
                fontSize: 24,
                color: ratingColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (label != null && label!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(label!),
              ),
          ],
        ),
      ),
    );
  }
}