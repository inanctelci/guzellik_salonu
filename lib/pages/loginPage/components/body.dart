import 'package:flutter/material.dart';
import 'package:guzellik_salonu/components/have_an_account.dart';
import 'package:guzellik_salonu/pages/loginPage/components/login_form.dart';

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
            horizontal: (size.width * 0.1), vertical: (size.height * 0.1)),
        child: SizedBox(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Hoş Geldiniz',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.1,
                  color: Colors.white,
                  fontFamily: 'Sans',
                ),
              ),
              SizedBox(
                height: size.height * 0.15,
              ),
              LoginForm(),
              SizedBox(
                height: size.height * 0.1,
              ),
              HaveOrCreateAccount(
                text: 'Hesabın yok mu?',
                buttonText: ' Kayıt ol.',
                buttonRoute: 'RegisterPage',
              ),
            ],
          ),
        ),
      )),
    );
  }
}
