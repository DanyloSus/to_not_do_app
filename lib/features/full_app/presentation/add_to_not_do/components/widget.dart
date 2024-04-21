import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_not_do_app/features/full_app/data/data/_to_not_dos.dart';
import 'package:to_not_do_app/features/full_app/data/models/_to_not_do.dart';

class TNDAdd extends StatelessWidget {
  TNDAdd({super.key});

  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  void _onSubmit(BuildContext context) {
    if (_titleController.text.trim().isEmpty ||
        _descController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text(
            "Invalid input",
          ),
          content: const Text(
            "Please, make sure a valid title and description was entered.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("Okay"),
            ),
          ],
        ),
      );
      return;
    }

    toNotDos.add(
      ToNotDo(title: _titleController.text, description: _descController.text),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add To NOT Do",
          style: GoogleFonts.dmSerifDisplay(
            textStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: _titleController,
              keyboardType: TextInputType.text,
              maxLength: 20,
              decoration: const InputDecoration(
                label: Text(
                  "Title",
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: _descController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                label: Text(
                  "Description",
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            FilledButton(
              onPressed: () => _onSubmit(context),
              child: const Text(
                "Submit",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
