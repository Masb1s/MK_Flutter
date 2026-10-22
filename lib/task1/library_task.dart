abstract class LibraryItem {
  final String title;
  final int year;

  LibraryItem({
    required this.title,
    required this.year,
  });

  String describe();
}

class Book extends LibraryItem {
  final String author;

  Book({
    required super.title,
    required super.year,
    required this.author,
  });

  @override
  String describe() {
    return '$title ($year) — $author';
  }
}

class Magazine extends LibraryItem {
  final int issueNumber;

  Magazine({
    required super.title,
    required super.year,
    required this.issueNumber,
  });

  @override
  String describe() {
    return '$title ($year), випуск $issueNumber';
  }
}

class Library {
  final List<LibraryItem> _items = [];

  void addItem(LibraryItem item) {
    _items.add(item);
  }

  List<LibraryItem> findByYear(int year) {
    return _items.where((item) => item.year == year).toList();
  }

  List<String> get allDescriptions {
    return _items.map((item) => item.describe()).toList();
  }

  LibraryItem? findOldest() {
    if (_items.isEmpty) {
      return null;
    }

    LibraryItem oldest = _items.first;

    for (final item in _items) {
      if (item.year < oldest.year) {
        oldest = item;
      }
    }

    return oldest;
  }
}