import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hybrid/core/core.dart';
import 'package:hybrid/core/providers.dart';
import 'package:hybrid/core/type_def.dart';
import 'package:appwrite/models.dart';

final authAPIProvider = Provider((ref) {
  final account = ref.watch(appWriteAccountProvider);
  AuthApi(account: account);
});

abstract class IAuthAPI {
  FutureEither<User> signUp({
    required String email,
    required String password,
  });
}

class AuthApi implements IAuthAPI {
  final Account _account;
  AuthApi({required Account account}) : _account = account;

  @override
  FutureEither<User> signUp(
      {required String email, required String password}) async {
    try {
      final account = _account.create(
          userId: ID.unique(), email: email, password: password);
      return right(account as User);
    } on AppwriteException catch (e, stackTrace) {
      return left(
        Failure(e.message ?? "Some unexpected error occures", stackTrace),
      );
    }
  }
}
