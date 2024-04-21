import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_not_do_app/features/full_app/presentation/my_app/cubit/_cubit.dart';
import 'package:to_not_do_app/features/full_app/presentation/register_page/cubit/_cubit.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final _usernameControler = TextEditingController();
  final _passwordControler = TextEditingController();

  void _onSubmit(BuildContext context) {
    if (_usernameControler.text.trim().isEmpty ||
        _passwordControler.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text(
            "Invalid input",
          ),
          content: const Text(
            "Please, make sure a valid username and password was entered.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("Okay"),
            ),
          ],
        ),
      );
      return;
    }

    context.read<UserCubit>().setUser(_usernameControler.text);
    context.read<PageCubit>().changePage(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Register",
              style: GoogleFonts.dmSerifDisplay(
                textStyle: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: _usernameControler,
              keyboardType: TextInputType.text,
              maxLength: 20,
              decoration: const InputDecoration(
                label: Text(
                  "Username",
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: _passwordControler,
              keyboardType: TextInputType.text,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              maxLength: 20,
              decoration: const InputDecoration(
                label: Text(
                  "Password",
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            FilledButton(
              onPressed: () => _onSubmit(context),
              child: const Text(
                "Login",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
