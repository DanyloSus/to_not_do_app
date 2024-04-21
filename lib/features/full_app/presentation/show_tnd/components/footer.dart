import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  final int selectedIndex;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onItemTapped,
      currentIndex: selectedIndex,
      items: const [
        BottomNavigationBarItem(
          label: "To NOT Do",
          icon: Icon(
            Icons.text_fields,
          ),
        ),
        BottomNavigationBarItem(
          label: "Settings",
          icon: Icon(
            Icons.settings,
          ),
        ),
      ],
    );
  }
}
