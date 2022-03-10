import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mool/core/models/user_model.dart';
import 'package:mool/shared/colors.dart';
import 'package:mool/shared/shared_prefs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = '';
  String email = '';
  String phone = '';

  Future<void> getLocalData() async {
    await Future.delayed(const Duration(seconds: 3));
    final String localData = await SharedPrefs().getString("userData") ?? '';
    Map<String, dynamic> jsonData = await jsonDecode(localData);

    var user = User.fromJson(jsonData);
    if (jsonData.isNotEmpty) {
      name = user.name;
      email = user.email;
      phone = user.phone;

      // _name.value =  TextEditingValue(text: user.name);
      // _email.value =  TextEditingValue(text: user.email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: FutureBuilder(
        future: getLocalData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          List<Widget> children;
          if (snapshot.connectionState == ConnectionState.waiting) {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Loading...',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
              )
            ];
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              children = <Widget>[
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                )
              ];
            } else {
              children = [
                Text(
                  "Name: $name",
                  style: const TextStyle(fontSize: 18.0),
                ),
                Text(
                  "Email: $email",
                  style: const TextStyle(fontSize: 18.0),
                ),
                Text(
                  "Phone: $phone",
                  style: const TextStyle(fontSize: 18.0),
                ),
              ];
            }
          } else {
            children = [Text('State: ${snapshot.connectionState}')];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}
