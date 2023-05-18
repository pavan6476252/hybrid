

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hybrid/hybrid_theme.dart';
import 'package:hybrid/providers/theme_provider.dart';

import 'views/home/home_page.dart';

void main(){
  runApp(const ProviderScope(child:  MyApp()));
}


class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return MaterialApp(
      darkTheme: HybridTheme.darkTheme(),
      theme: HybridTheme.lightTheme(),
      themeMode: ref.watch(themeModeProvider),
      home: HomePage(),
    );
  }
}