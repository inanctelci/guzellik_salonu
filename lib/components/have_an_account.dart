import 'package:flutter/material.dart';

class HaveOrCreateAccount extends StatelessWidget {
  const HaveOrCreateAccount(
      {Key? key,
      required this.text,
      required this.buttonText,
      required this.buttonRoute})
      : super(key: key);

  final String text;
  final String buttonText;
  final String buttonRoute;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 20,
            fontFamily: 'Sans',
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.popAndPushNamed(context, buttonRoute);
          },
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Sans',
            ),
          ),
        ),
      ],
    );
  }
}
