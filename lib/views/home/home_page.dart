import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hybrid/providers/theme_provider.dart';
import 'package:hybrid/views/widgets/profile_bar.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = ref.watch(themeModeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hybrid"),
        actions: [
          IconButton(
              onPressed: () =>
                  ref.read(themeModeProvider.notifier).toggleTheme(),
              icon: themeNotifier == ThemeMode.dark
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode)),
          const Icon(Ionicons.settings),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [ProfileBar()],
        ),
      ),
    );
  }
}
