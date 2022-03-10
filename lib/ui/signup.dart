import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mool/core/models/user_model.dart';
import 'package:mool/shared/colors.dart';
import 'package:mool/shared/custom_button.dart';
import 'package:mool/shared/shared_prefs.dart';
import 'package:mool/shared/widgets/custom_auth.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String name = '';
  String mobileNo = '';
  String countryCode = '91';
  String email = '';
  String password = '';

  Future<void> storeUserData() async {
    User user1 = User(
      nameController.text,
      emailController.text,
      countryCode + mobileNoController.text,
    );

    String user = jsonEncode(user1);
    SharedPrefs().setString('userData', user);
    nameController.value = const TextEditingValue(text: '');
    emailController.value = const TextEditingValue(text: '');
    mobileNoController.value = const TextEditingValue(text: '');
    passwordController.value = const TextEditingValue(text: '');
    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return CustomAuthScreen(
      screenDescription:
          "Please enter your details to get started by creating an account",
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: nameController,
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              decoration: InputDecoration(
                labelText: "Full Name",
                labelStyle: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: primaryColor, fontSize: 16.0),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: secondaryColor),
                ),
              ),
              keyboardType: TextInputType.name,
            ),
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
              controller: mobileNoController,
              maxLength: 10,
              onChanged: (value) {
                setState(() {
                  mobileNo = value;
                });
              },
              decoration: InputDecoration(
                labelText: "Mobile Number",
                labelStyle: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: primaryColor, fontSize: 16.0),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: secondaryColor)),
                prefix: Text("+$countryCode "),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
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
              onPressedButton: () => storeUserData(),
              text: "Signup",
              verticalPadding: 20.0,
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
      footer: TextSpan(
        children: [
          TextSpan(
            text: "Alredy have an account? ",
            style: TextStyle(
              fontSize: 16.0,
              height: 1.4,
              color: primaryColor,
              fontFamily: "Metropolis",
            ),
          ),
          TextSpan(
            text: 'Login',
            style: TextStyle(
              fontSize: 16.0,
              height: 1.4,
              color: tertiaryColor,
              fontFamily: "Metropolis",
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => Navigator.pushNamed(context, '/login'),
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
