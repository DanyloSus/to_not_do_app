import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_not_do_app/features/full_app/data/data/_to_not_dos.dart';
import 'package:to_not_do_app/features/full_app/data/models/_tnd_args.dart';
import 'package:to_not_do_app/features/full_app/presentation/my_app/cubit/_cubit.dart';
import 'package:to_not_do_app/features/full_app/presentation/register_page/cubit/_cubit.dart';
import 'package:to_not_do_app/features/full_app/presentation/settings/components/widget.dart';
import 'package:to_not_do_app/features/full_app/presentation/to_do_page/alert.dart';
import 'package:to_not_do_app/features/full_app/presentation/show_tnd/components/widget.dart';

class TNDList extends StatefulWidget {
  const TNDList({
    super.key,
    required this.settings,
  });

  final Map<SettingsEnum, bool> settings;

  @override
  State<TNDList> createState() => _TNDListState();
}

class _TNDListState extends State<TNDList> {
  void _goToRegister(BuildContext context) async {
    bool? val = await showDialog(
      context: context,
      builder: (ctx) => const ExitAlert(),
    );

    if (val != null && val && context.mounted) {
      context.read<UserCubit>().setUser("");
      context.read<PageCubit>().changePage(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredToDos = widget.settings[SettingsEnum.showCompleted]!
        ? toNotDos
        : toNotDos.where((e) => !e.completed).toList();

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<UserCubit, String>(
            builder: (context, username) => TextButton(
              onPressed: () => _goToRegister(context),
              child: Text(
                username,
                style: GoogleFonts.dmSerifDisplay(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: filteredToDos.isNotEmpty
                ? ListView.builder(
                    itemCount: filteredToDos
                        .length, // Use filteredToDos.length instead of toNotDos.length
                    itemBuilder: (ctx, index) {
                      final originalIndex =
                          toNotDos.indexOf(filteredToDos[index]);
                      return TextButton(
                        onPressed: () async {
                          await Navigator.pushNamed(
                            context,
                            TNDShow.routeName,
                            arguments: TNDArguments(id: originalIndex),
                          );

                          setState(() {
                            toNotDos = toNotDos;
                          });
                        },
                        child: Text(
                          filteredToDos[index].title,
                          style: TextStyle(
                            decoration: filteredToDos[index].completed
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                      );
                    })
                : Center(
                    child: Text(
                      "It's nothing here yet...",
                      style: GoogleFonts.dmSerifDisplay(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
