import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guzellik_salonu/firebase_options.dart';
import 'package:guzellik_salonu/pages/homePage/home_page.dart';
import 'package:guzellik_salonu/pages/loginPage/login_page.dart';
import 'package:guzellik_salonu/pages/registerPage/register_page.dart';
import 'constans.dart';
import 'pages/onBoardPage/on_board_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: primaryColor,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: primaryColor,
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
        ),
        colorScheme: Theme.of(context).colorScheme.copyWith(
              secondary: secondaryColor,
            ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'HomePage',
      routes: {
        'OnBoardPage': (context) => OnBoardPage(),
        'LoginPage': (context) => LoginPage(),
        'RegisterPage': (context) => RegisterPage(),
        'HomePage': (context) => HomePage(),
      },
    );
  }
}
