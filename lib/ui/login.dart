import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mool/core/models/user_model.dart';
import 'package:mool/shared/colors.dart';
import 'package:mool/shared/custom_button.dart';
import 'package:mool/shared/shared_prefs.dart';
import 'package:mool/shared/widgets/custom_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String email = '';
  String password = '';
  bool isError = false;

  Future<dynamic> fetchUserExits() async {
    final String localData = await SharedPrefs().getString("userData") ?? '';
    Map<String, dynamic> jsonData = await jsonDecode(localData);

    var user = User.fromJson(jsonData);
    user.email == emailController.text
        ? Navigator.pushNamed(context, '/')
        : setState(() => isError = true);
  }

  @override
  Widget build(BuildContext context) {
    return CustomAuthScreen(
      screenDescription: "Please enter your login details to get started",
      body: Column(
        children: [
          isError
              ? Row(
                  children: [
                    const Text(
                      "Account doesn't exist!",
                      style: TextStyle(color: Colors.red),
                    ),
                    TextButton(
                      onPressed: () => setState(() {
                        isError = false;
                      }),
                      child: const Text("Ok"),
                    )
                  ],
                )
              : const SizedBox(),
          Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: emailController,
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(color: primaryColor, fontSize: 16.0),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: secondaryColor),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(color: primaryColor, fontSize: 16.0),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: secondaryColor),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 60.0,
                ),
                CustomFilledButton(
                  onPressedButton: () => fetchUserExits(),
                  text: "Login",
                  verticalPadding: 20.0,
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ],
      ),
      footer: TextSpan(
        children: [
          TextSpan(
            text: "Don't have an account? ",
            style: TextStyle(
              fontSize: 16.0,
              height: 1.4,
              color: primaryColor,
              fontFamily: "Metropolis",
            ),
          ),
          TextSpan(
            text: 'Signup',
            style: TextStyle(
              fontSize: 16.0,
              height: 1.4,
              color: tertiaryColor,
              fontFamily: "Metropolis",
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => Navigator.pushNamed(context, '/signup'),
          ),
          TextSpan(
            text: ' here.',
            style: TextStyle(
              fontSize: 16.0,
              height: 1.4,
              color: primaryColor,
              fontFamily: "Metropolis",
            ),
          )
        ],
      ),
    );
  }
}
