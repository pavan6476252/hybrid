import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Hybrid"),
      ),
      body: Form(
        child: Center(
          child: Column(children: [
            TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: "User name",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Invalid user name';
                  }
                  return null;
                }),
            TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email_rounded),
                  hintText: "Email",
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !value.contains('@') ||
                      !value.contains('.')) {
                    return 'Invalid Email';
                  }
                  return null;
                }),
            TextFormField(
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email_rounded),
                  hintText: "password",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return 'Invalid Email';
                  }
                  return null;
                }),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.login_rounded),
                label: const Text("Sign In")),
            const Text("Sign In to Account"),
            const Row(
              children: [
                Card(
                  child: Icon(Ionicons.logo_google),
                ),
                Card(
                  child: Icon(Ionicons.logo_github),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
