import 'package:flutter/material.dart';
import 'package:to_not_do_app/features/full_app/data/models/_to_not_do.dart';
import 'package:to_not_do_app/features/full_app/presentation/show_tnd/components/content.dart';
import 'package:to_not_do_app/features/full_app/presentation/show_tnd/components/settings.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({
    super.key,
    required this.pageController,
    required this.changePage,
    required this.toNotDo,
  });

  final PageController pageController;
  final void Function(int) changePage;
  final ToNotDo toNotDo;

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: PageView(
        controller: widget.pageController,
        onPageChanged: widget.changePage,
        children: [
          TNDContent(toNotDo: widget.toNotDo),
          TNDSettings(toNotDo: widget.toNotDo),
        ],
      ),
    );
  }
}
