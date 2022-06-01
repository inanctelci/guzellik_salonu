import 'package:flutter/material.dart';

import '../../../constans.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.press,
    this.buttonColor = Colors.white,
  }) : super(key: key);

  final String title;
  final VoidCallback press;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                color:
                    buttonColor == Colors.white ? primaryColor : Colors.white,
                fontFamily: 'Sans'),
          ),
        ),
      ),
    );
  }
}
