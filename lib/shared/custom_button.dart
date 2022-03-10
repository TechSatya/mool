import 'package:flutter/material.dart';
import 'package:mool/shared/colors.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton(
      {Key? key,
      required this.onPressedButton,
      required this.text,
      required this.verticalPadding})
      : super(key: key);

  final void Function() onPressedButton;
  final String text;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressedButton,
      color: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 25.0, vertical: verticalPadding),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.white,
            fontFamily: "Metropolis",
          ),
        ),
      ),
    );
  }
}