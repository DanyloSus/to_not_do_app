import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_not_do_app/features/full_app/presentation/settings/components/widget.dart';
import 'package:to_not_do_app/features/full_app/presentation/to_do_page/components/index.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  Map<SettingsEnum, bool> settings = {
    SettingsEnum.showCompleted: false,
  };

  void _goToSettings(BuildContext context) async {
    final res = (await Navigator.of(context).push<Map<SettingsEnum, bool>>(
      MaterialPageRoute(
        builder: (ctx) => Settings(
          activeSettings: settings,
        ),
      ),
    ))!;

    setState(() {
      settings = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'To Not Do',
          style: GoogleFonts.dmSerifDisplay(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _goToSettings(context),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: TNDList(
        settings: settings,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(
            context,
            '/add',
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
