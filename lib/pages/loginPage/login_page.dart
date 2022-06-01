import 'package:flutter/material.dart';
import 'package:guzellik_salonu/components/custom_button.dart';
import 'package:guzellik_salonu/components/form_error.dart';
import 'package:guzellik_salonu/constans.dart';

import 'components/body.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Body(),
    );
  }
}
