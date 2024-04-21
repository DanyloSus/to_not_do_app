import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_not_do_app/features/full_app/presentation/add_to_not_do/components/widget.dart';
import 'package:to_not_do_app/features/full_app/presentation/my_app/cubit/_cubit.dart';
import 'package:to_not_do_app/features/full_app/presentation/register_page/components/widget.dart';
import 'package:to_not_do_app/features/full_app/presentation/register_page/cubit/_cubit.dart';
import 'package:to_not_do_app/features/full_app/presentation/show_tnd/components/widget.dart';
import 'package:to_not_do_app/features/full_app/presentation/to_do_page/components/widget.dart';

class MyAppView extends StatefulWidget {
  const MyAppView({super.key});

  @override
  State<MyAppView> createState() => _MyAppViewState();
}

class _MyAppViewState extends State<MyAppView> {
  getData() {
    BlocProvider.of<PageCubit>(context).loadValues();
    BlocProvider.of<UserCubit>(context).loadValues();
  }

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      getData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      home: BlocBuilder<PageCubit, int>(
        builder: (_, pageIndex) =>
            pageIndex == 0 ? RegisterPage() : const ToDoPage(),
      ),
      routes: {
        TNDShow.routeName: (ctx) => const TNDShow(),
        '/add': (ctx) => TNDAdd(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == TNDShow.routeName) {
          return MaterialPageRoute(
            builder: (context) {
              return const TNDShow();
            },
          );
        }

        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
    );
  }
}
