import 'package:flutter/material.dart';
import 'package:guzellik_salonu/components/have_an_account.dart';

import 'singin_form.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: (size.width * 0.1), vertical: (size.height * 0.05)),
          child: SizedBox(
            width: size.width,
            child: Column(
              children: [
                Text(
                  'Kayıt Ol',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.1,
                    color: Colors.white,
                    fontFamily: 'Sans',
                  ),
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                SingForm(),
                SizedBox(
                  height: size.height * 0.05,
                ),
                HaveOrCreateAccount(
                    text: 'Hesabın var mı?',
                    buttonText: ' Giriş yap.',
                    buttonRoute: 'LoginPage'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
