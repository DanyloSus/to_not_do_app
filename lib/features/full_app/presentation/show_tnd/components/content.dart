import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_not_do_app/features/full_app/data/models/_to_not_do.dart';

class TNDContent extends StatelessWidget {
  const TNDContent({
    super.key,
    required this.toNotDo,
  });

  final ToNotDo toNotDo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: ListView(
        children: [
          Text(
            toNotDo.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.dmSerifDisplay(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            toNotDo.description,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
