import 'package:flutter/material.dart';
import 'package:guzellik_salonu/constans.dart';
import 'package:guzellik_salonu/pages/loginPage/login_page.dart';
import 'package:guzellik_salonu/pages/registerPage/register_page.dart';

import '../../components/custom_button.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Welcome to, F&G Beauty',
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sans',
                ),
          ),
          Image.asset(
            'assets/images/hairdresser.png',
            width: MediaQuery.of(context).size.height * 0.2,
          ),
          Column(
            children: [
              CustomButton(
                  title: 'Giriş yap',
                  press: () {
                    Navigator.pushNamed(context, 'LoginPage');
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              CustomButton(
                  title: 'Kayıt ol',
                  press: () {
                    Navigator.pushNamed(context, 'RegisterPage');
                  }),
            ],
          )
        ],
      ),
    );
  }
}
