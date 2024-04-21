import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_not_do_app/core/helper/observer.dart';
import 'package:to_not_do_app/features/full_app/presentation/my_app/components/widget.dart';

void main() {
  Bloc.observer = const AppBlocObserver();

  runApp(const MyApp());
}
