import 'package:flutter/material.dart';

class CustomAuthScreen extends StatefulWidget {
  const CustomAuthScreen({
    Key? key,
    required this.body,
    required this.screenDescription,
    required this.footer,
  }) : super(key: key);

  final String screenDescription;
  final Widget body;
  final InlineSpan footer;

  @override
  State<CustomAuthScreen> createState() => _CustomAuthScreenState();
}

class _CustomAuthScreenState extends State<CustomAuthScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        height: screenSize.height,
        padding: const EdgeInsets.fromLTRB(25.0, 40.0, 25.0, 20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30.0,
                  ),
                  Image.asset(
                    "assets/images/logo.png",
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: Text(
                      "Welcome to Mool",
                      style: TextStyle(
                          fontFamily: "PlayfairDisplay", fontSize: 26.0),
                    ),
                  ),
                  SizedBox(
                    width: screenSize.width - (screenSize.width * 0.2),
                    child: Text(
                      widget.screenDescription,
                      style: const TextStyle(fontSize: 16.0, height: 1.4),
                    ),
                  ),
                ],
              ),
              widget.body,
              Center(child: RichText(text: widget.footer)),
            ]),
      ),
    );
  }
}
