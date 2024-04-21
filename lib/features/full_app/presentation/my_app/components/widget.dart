import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_not_do_app/features/full_app/presentation/my_app/cubit/_cubit.dart';
import 'package:to_not_do_app/features/full_app/presentation/my_app/view.dart';
import 'package:to_not_do_app/features/full_app/presentation/register_page/cubit/_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PageCubit>(
          create: (_) => PageCubit(),
        ),
        BlocProvider<UserCubit>(
          create: (_) => UserCubit(),
        ),
      ],
      child: const MyAppView(),
    );
  }
}
