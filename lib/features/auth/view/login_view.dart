import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hybrid/common/rounded_button.dart';
import 'package:hybrid/features/auth/widgets/auth_field.dart';
import 'package:hybrid/theme/color_pallet.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              Image.asset(
                'assets/hybrid_icon.png',
                height: 150,
              ),
              const SizedBox(height: 25),
              AuthField(
                  textEditingController: emailController, hintText: 'Email'),
              const SizedBox(height: 25),
              AuthField(
                textEditingController: passwordController,
                hintText: 'Password',
              ),
              const SizedBox(height: 25),
              Align(
                alignment: Alignment.centerRight,
                child: RoundedsmallButton(ontap: () {}, label: "Login"),
              ),
              const SizedBox(height: 25),
              Text.rich(
                TextSpan(text: "Don't Have Account ? ", children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () => {},
                      text: "Sign Up",
                      style: const TextStyle(color: Colors.amber))
                ]),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
