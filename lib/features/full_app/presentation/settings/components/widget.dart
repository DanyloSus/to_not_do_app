import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum SettingsEnum {
  showCompleted,
}

class Settings extends StatefulWidget {
  const Settings({
    super.key,
    required this.activeSettings,
  });

  final Map<SettingsEnum, bool> activeSettings;

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) return;

        Navigator.of(context).pop({
          SettingsEnum.showCompleted:
              widget.activeSettings[SettingsEnum.showCompleted] ?? false,
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Settings',
            style: GoogleFonts.dmSerifDisplay(
              textStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
        ),
        body: Column(
          children: [
            SwitchListTile(
              value: widget.activeSettings[SettingsEnum.showCompleted]!,
              onChanged: (isChecked) {
                setState(() {
                  widget.activeSettings[SettingsEnum.showCompleted] = isChecked;
                });
              },
              title: Text(
                'Show completed',
                style: GoogleFonts.dmSerifDisplay(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              subtitle: const Text(
                'Show completed To NOT Dos.',
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            ),
          ],
        ),
      ),
    );
  }
}
