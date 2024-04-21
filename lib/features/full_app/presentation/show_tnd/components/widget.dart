import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_not_do_app/features/full_app/data/data/_to_not_dos.dart';
import 'package:to_not_do_app/features/full_app/data/models/_tnd_args.dart';
import 'package:to_not_do_app/features/full_app/presentation/show_tnd/components/footer.dart';
import 'package:to_not_do_app/features/full_app/presentation/show_tnd/components/slider.dart';

class TNDShow extends StatefulWidget {
  const TNDShow({super.key});

  static const routeName = '/toNotDo';

  @override
  State<TNDShow> createState() => _TNDShowState();
}

class _TNDShowState extends State<TNDShow> {
  int _footerIndex = 0;

  late PageController _pageController;

  void _changePage(int newPage) {
    setState(() {
      _footerIndex = newPage;
      _pageController.animateToPage(
        newPage,
        duration: Durations.short4,
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final TNDArguments arguments =
        ModalRoute.of(context)!.settings.arguments as TNDArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          toNotDos[arguments.id].title,
          style: GoogleFonts.dmSerifDisplay(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
      body: SliderPage(
        changePage: _changePage,
        pageController: _pageController,
        toNotDo: toNotDos[arguments.id],
      ),
      bottomNavigationBar:
          Footer(selectedIndex: _footerIndex, onItemTapped: _changePage),
    );
  }
}
