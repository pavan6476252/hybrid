import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:hybrid/hybrid_theme.dart';
import 'package:hybrid/providers/appwrite_provider.dart';
import 'package:hybrid/providers/theme_provider.dart';
import 'package:hybrid/views/auth/login_page.dart';
import 'package:hybrid/views/auth/signup_page.dart';

import 'views/home/home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  Future<void> _init(WidgetRef ref) async {
    //  This is how you can access providers in stateful widgets
    final user = await ref.read(authProvider).getAccount();
    if (user != null) {
      //  This is how you can modify the state of the providers

      ref.read(userLoggedInProvider.notifier).state = true;
    } else {
      ref.read(userLoggedInProvider.notifier).state = false;
    }
  }

  @override
  void initState() {
    super.initState();
    _init(ref);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: "Hybrid",
      darkTheme: HybridTheme.darkTheme(),
      theme: HybridTheme.lightTheme(),
      themeMode: ref.watch(themeModeProvider),
    );
  }
}

final GoRouter _router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: '/signup',
    builder: (context, state) => const SignUpPage(),
  )
]);
