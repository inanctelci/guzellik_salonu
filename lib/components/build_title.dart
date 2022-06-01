import 'package:flutter/material.dart';

import '../constans.dart';

class BuildTitle extends StatelessWidget {
  const BuildTitle({
    Key? key,
    required this.title,
    required this.textColor,
  }) : super(key: key);

  final String title;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 25, color: textColor),
    );
  }
}
