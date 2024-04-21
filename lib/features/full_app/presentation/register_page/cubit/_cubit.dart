import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCubit extends Cubit<String> {
  UserCubit() : super("");

  Future<void> loadValues() async {
    SharedPreferences.getInstance().then((prefs) {
      emit(prefs.getString('username') ?? "");
    });
  }

  void setUser(String newUser) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('username', newUser);

    emit(newUser);
  }
}
