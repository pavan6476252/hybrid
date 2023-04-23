import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hybrid/constants/app_write_constants.dart';

final appWriteClientProvider = Provider((ref) {
  Client client = Client();
  client
      .setEndpoint(AppWriteConstants.endPoint)
      .setProject(AppWriteConstants.projectId)
      .setSelfSigned(status: true);
});


final appWriteAccountProvider = Provider((ref) {
  final client =ref.read(appWriteClientProvider);
  return Account(client);
});