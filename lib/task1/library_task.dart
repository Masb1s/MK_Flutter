import 'package:flutter/material.dart';
import 'library_models.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final Library library = Library();

  final titleController = TextEditingController();
  final yearController = TextEditingController();
  final authorController = TextEditingController();

  final magazineTitleController = TextEditingController();
  final magazineYearController = TextEditingController();
  final issueController = TextEditingController();

  final searchYearController = TextEditingController();

  String message = '';
  List<LibraryItem> searchResults = [];

  void addBook() {
    final title = titleController.text.trim();
    final year = int.tryParse(yearController.text.trim());
    final author = authorController.text.trim();

    if (title.length < 3 || author.length < 2) {
     setState(() {
     message = 'Замало даних для книги';
    });
    return;
    }

    final currentYear = DateTime.now().year;

if (year == null || year < 1000 || year > currentYear) {
  setState(() {
    message = 'Введіть коректний рік';
  });
  return;
}

    library.addItem(
      Book(
        title: title,
        year: year,
        author: author,
      ),
    );

    titleController.clear();
    yearController.clear();
    authorController.clear();

    setState(() {
      message = 'Книгу додано';
    });
  }

  void addMagazine() {
    final title = magazineTitleController.text.trim();
    final year = int.tryParse(
      magazineYearController.text.trim(),
    );
    final issue = int.tryParse(issueController.text.trim());

    if (title.length < 3) {
     setState(() {
      message = 'Назва журналу занадто коротка';
     });
     return;
}

    final currentYear = DateTime.now().year;

if (year == null || year < 1000 || year > currentYear) {
  setState(() {
    message = 'Введіть коректний рік';
  });
  return;
}

    if (issue == null || issue <= 0) {
      setState(() {
        message = 'Некоректний номер випуску';
      });
      return;
    }

    library.addItem(
      Magazine(
        title: title,
        year: year,
        issueNumber: issue,
      ),
    );

    magazineTitleController.clear();
    magazineYearController.clear();
    issueController.clear();

    setState(() {
      message = 'Журнал додано';
    });
  }

  void searchByYear() {
    final year = int.tryParse(
      searchYearController.text.trim(),
    );

    if (year == null || year < 1000) {
     setState(() {
     message = 'Введіть правильний рік';
    });
  return;
}

    setState(() {
      searchResults = library.findByYear(year);
      message =
          'Знайдено елементів: ${searchResults.length}';
    });
  }

  void showOldest() {
    final oldest = library.findOldest();

    setState(() {
      if (oldest == null) {
        message = 'Бібліотека порожня';
      } else {
        message = 'Найстаріший: ${oldest.describe()}';
      }
    });
  }

  Widget buildInput(
    TextEditingController controller,
    String label,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    yearController.dispose();
    authorController.dispose();

    magazineTitleController.dispose();
    magazineYearController.dispose();
    issueController.dispose();

    searchYearController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = library.allDescriptions;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Завдання 1'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Додати книгу',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            buildInput(titleController, 'Назва'),
            buildInput(yearController, 'Рік'),
            buildInput(authorController, 'Автор'),

            ElevatedButton(
              onPressed: addBook,
              child: const Text('Додати книгу'),
            ),

            const SizedBox(height: 25),

            const Text(
              'Додати журнал',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            buildInput(
              magazineTitleController,
              'Назва',
            ),
            buildInput(
              magazineYearController,
              'Рік',
            ),
            buildInput(
              issueController,
              'Номер випуску',
            ),

            ElevatedButton(
              onPressed: addMagazine,
              child: const Text('Додати журнал'),
            ),

            const Divider(height: 40),

            buildInput(
              searchYearController,
              'Пошук за роком',
            ),

            ElevatedButton(
              onPressed: searchByYear,
              child: const Text('Знайти'),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: showOldest,
              child: const Text('Найстаріший елемент'),
            ),

            const SizedBox(height: 15),

            Text(
              message,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const Divider(height: 40),

            const Text(
              'Усі елементи',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            ...items.map(
              (item) => ListTile(
                leading: const Icon(Icons.menu_book),
                title: Text(item),
              ),
            ),

            if (searchResults.isNotEmpty) ...[
              const SizedBox(height: 20),
              const Text(
                'Результати пошуку',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ...searchResults.map(
                (item) => ListTile(
                  title: Text(item.describe()),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}