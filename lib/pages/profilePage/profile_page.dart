import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:guzellik_salonu/components/build_title.dart';
import 'package:guzellik_salonu/constans.dart';
import 'package:guzellik_salonu/pages/profilePage/components/change_password.dart';

import 'components/logout_button.dart';
import 'components/profile_picture.dart';
import 'components/settings_item.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  bool notifications = false;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late FirebaseAuth auth;

  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
  }

  String userName = 'Dua Lipa';
  String imgPath = 'assets/images/person.png';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: ProfilePicture(
                  imgPath: imgPath,
                  changePicture: () {},
                ),
              ),
              Center(
                child: Text(
                  userName,
                  style: const TextStyle(
                    fontFamily: 'Sans',
                    color: primaryColor,
                    fontSize: 30,
                  ),
                ),
              ),
              const BuildTitle(
                title: 'Profil Ayarları',
                textColor: primaryColor,
              ),
              Column(
                children: [
                  ProfileSettingsItem(
                    title: 'Şifreni Değiştir',
                    leading: const Icon(
                      Icons.lock_outline,
                      color: primaryColor,
                    ),
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangePasswordScreen(),
                        ),
                      );
                    },
                  ),
                  ProfileSettingsItem(
                    title: 'Bildirimler',
                    leading: const Icon(
                      Icons.notifications_outlined,
                      color: primaryColor,
                    ),
                    press: null,
                    trailing: Switch(
                      value: widget.notifications,
                      onChanged: (value) {
                        setState(() {
                          widget.notifications = value;
                        });
                      },
                      activeColor: primaryColor,
                    ),
                  ),
                  ProfileSettingsItem(
                    title: 'Gizlilik Kuralları',
                    leading: const Icon(
                      Icons.privacy_tip_outlined,
                      color: primaryColor,
                    ),
                    press: () {},
                  ),
                  ProfileSettingsItem(
                    title: 'Kartlarım',
                    leading: const Icon(
                      Icons.credit_card_outlined,
                      color: primaryColor,
                    ),
                    press: () {},
                  ),
                ],
              ),
              Center(child: LogOutButton(
                press: () {
                  setState(() {
                    singOut();
                    Navigator.pushNamedAndRemoveUntil(
                        context, 'OnBoardPage', (route) => false);
                  });
                },
              )),
            ],
          ),
        ),
      ),
    );
  }

  void singOut() async {
    await auth.signOut();
  }
}
