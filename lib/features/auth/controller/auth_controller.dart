import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hybrid/api/auth_api.dart';
import 'package:hybrid/core/utils.dart';


class AuthProvider extends StateNotifier<bool> {
  final AuthApi _authAPI;

  AuthProvider({required AuthApi authApi})
      : _authAPI = authApi,
        super(false);

  void signUp(
      {required String email,
      required String password,
      required BuildContext context}) async {
    state = true;
    final res = await _authAPI.signUp(email: email, password: password);

    res.fold((l) => showSnackbar(context, l.message), (r) => print(r.name));
  }
}
