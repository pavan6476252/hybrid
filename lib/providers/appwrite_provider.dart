// ignore_for_file: use_build_context_synchronously

import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hybrid/constants/app_write_constants.dart';
import 'package:hybrid/views/widgets/utils.dart';

final clientProvider = Provider<Client>((ref) {
  return Client()
      .setProject(AppWriteConstants.projectId)
      .setEndpoint(AppWriteConstants.endPoint);
});
final accountProvider = Provider<Account>((ref) {
  return Account(ref.read(clientProvider));
});

final authProvider = Provider<Authentication>((ref) {
  return Authentication(ref.watch(accountProvider));
});

final userLoggedInProvider = StateProvider<bool?>((ref) {
  return false;
});

final userProvider = FutureProvider<User?>((ref) async {
  final user = ref.watch(authProvider).getAccount();
  return user;
});

class Authentication {
  late Account account;

  Authentication(this.account);

  // get user data
  Future<User?> getAccount() async {
    try {
      return await account.get();
    } on AppwriteException catch (e) {
      print(e.toString());
      return null;
    }
  }

  // login user
  Future<void> login(String email, String password,
      BuildContext context) async {
    try {
      await account.createEmailSession(email: email, password: password);
      context.go('/');
    } on AppwriteException catch (e) {
      await showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error Occured'),
          content: Text(e.toString()),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Ok"))
          ],
        ),
      );
    }
  }

  //sign up

  Future<void> signUp(String userName,
      String email, String password, BuildContext context) async {
    try {
      await account.create(name: userName,
          email: email, password: password, userId: 'unique()');
      // We will creating a userId as the email id(UNIQUE)

      await account.createEmailSession(email: email, password: password);

      context.go('/');
    } catch (e) {
      print(" Sign Up $e");
      await showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error Occured'),
          content: Text(e.toString()),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Ok"))
          ],
        ),
      );
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      await account.deleteSession(sessionId: 'current');
      showScaffoldMsg(context, "Logged out Successfully", false);
      context.go('/');
    } catch (e) {
      // print(e);
      await showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('Something went wrong'),
                content: Text(e.toString()),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Ok"))
                ],
              ));
    }
  }
}
