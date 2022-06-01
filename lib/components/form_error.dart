import 'package:flutter/material.dart';

class FormError extends StatelessWidget {
  const FormError({Key? key, required this.errors}) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(errors.length,
          (index) => formErrorText(error: errors[index], size: size)),
    );
  }

  Row formErrorText({required String error, required Size size}) {
    return Row(
      children: [
        Icon(
          Icons.error_outline_rounded,
          color: Colors.red,
        ),
        SizedBox(
          width: size.width * 0.01,
        ),
        Text(
          error,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
