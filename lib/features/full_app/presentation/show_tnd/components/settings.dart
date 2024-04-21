import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_not_do_app/features/full_app/data/data/_to_not_dos.dart';
import 'package:to_not_do_app/features/full_app/data/models/_to_not_do.dart';
import 'package:to_not_do_app/features/full_app/presentation/show_tnd/alert.dart';

class TNDSettings extends StatefulWidget {
  const TNDSettings({
    super.key,
    required this.toNotDo,
  });

  final ToNotDo toNotDo;

  @override
  State<TNDSettings> createState() => _NDoSettingsState();
}

class _NDoSettingsState extends State<TNDSettings> {
  late TextEditingController _titleController;
  late TextEditingController _descController;

  void _onDeleting() async {
    bool? val = await showDialog(
      context: context,
      builder: (ctx) => const DeleteAlert(),
    );

    if (val != null && val) {
      toNotDos.remove(widget.toNotDo);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController(text: widget.toNotDo.title);
    _descController = TextEditingController(text: widget.toNotDo.description);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SwitchListTile(
            value: widget.toNotDo.completed,
            onChanged: (isChecked) {
              if (isChecked) {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Are you serious?'),
                  ),
                );
              }

              setState(() {
                widget.toNotDo.toogle();
              });
            },
            title: Text(
              'Show completed',
              style: GoogleFonts.dmSerifDisplay(
                textStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            subtitle: const Text(
              'Show completed To NOT Dos.',
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          ),
          TextField(
            controller: _titleController,
            keyboardType: TextInputType.text,
            onChanged: (value) => setState(() {
              widget.toNotDo.title = value;
            }),
            maxLength: 20,
            decoration: const InputDecoration(
              label: Text(
                "Title",
              ),
            ),
          ),
          TextField(
            controller: _descController,
            keyboardType: TextInputType.text,
            onChanged: (value) => setState(() {
              widget.toNotDo.description = value;
            }),
            decoration: const InputDecoration(
              label: Text(
                "Description",
              ),
            ),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red[700]),
            onPressed: _onDeleting,
            child: const Text(
              "Delete",
            ),
          ),
        ],
      ),
    );
  }
}
