import 'package:flutter/material.dart';
import 'package:hybrid/constants/ui_constants.dart';
import 'package:hybrid/features/auth/view/login_view.dart';
import 'package:hybrid/theme/app_theme.dart';
import 'package:hybrid/utility/appbar.dart';

import 'features/home_screen/views/stories/stories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.themeData,
      home:  LoginView(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

    //will not rebuild entire thing
    final appBar = UIConstants.customAppBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Column(
            children: [Stories()],
          ),
        ));
  }
}
