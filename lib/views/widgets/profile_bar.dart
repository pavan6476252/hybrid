import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hybrid/providers/appwrite_provider.dart';
import 'package:ionicons/ionicons.dart';

class ProfileBar extends ConsumerStatefulWidget {
  const ProfileBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileBarState();
}

class _ProfileBarState extends ConsumerState<ProfileBar> {
  @override
  Widget build(BuildContext context) {
    final _isLoggesIn = ref.watch(userLoggedInProvider.notifier).state;
    final _user = ref.read(userProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
          child: _isLoggesIn!
              ? _user.when(
                  data: (data) => ListTile(
                    title: Text(data!.name),
                  ),
                  error: (error, stackTrace) {
                    return Text(error.toString());
                  },
                  loading: () {
                    return CircularProgressIndicator();
                  },
                )
              : ListTile(
                  leading: const Icon(
                    Ionicons.person_circle_outline,
                    size: 45,
                  ),
                  title: OutlinedButton(
                      onPressed: () {
                        context.push('/login');
                      },
                      child: const Text("Login now")),
                  trailing: const Icon(
                    Ionicons.search_circle,
                    size: 45,
                  ),
                )),
    );
  }
}
