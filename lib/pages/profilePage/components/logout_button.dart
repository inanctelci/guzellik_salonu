import 'package:flutter/material.dart';

import '../../../constans.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    Key? key,
    required this.press,
  }) : super(key: key);

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        height: size.height * 0.06,
        width: size.width * 0.35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: primaryColor,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.power_settings_new_outlined,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Çıkış Yap',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Sans',
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
