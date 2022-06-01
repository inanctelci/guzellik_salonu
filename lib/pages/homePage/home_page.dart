import 'package:flutter/material.dart';
import 'package:guzellik_salonu/constans.dart';
import 'package:guzellik_salonu/pages/bookPage/book_page.dart';
import 'package:guzellik_salonu/pages/bookPage/book_page_v2.dart';
import 'package:guzellik_salonu/pages/profilePage/profile_page.dart';

import 'components/body.dart';
import 'components/gallery_view.dart';
import 'components/headline.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;

  List<Widget> screens = [
    Body(),
    BookPagePlus(),
    ProfilePage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  Widget currentScreen = Body();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('F&G BEAUTY'),
        ),
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Container(
            height: size.height * 0.1,
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = Body();
                      currentTab = 0;
                    });
                  },
                  icon: const Icon(
                    Icons.home,
                  ),
                  iconSize: currentTab == 0 ? 40 : 20,
                  color: currentTab == 0 ? Colors.white : Colors.grey,
                  splashColor: backgroundColor,
                  //highlightColor: Colors.white,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = BookPage();
                      currentTab = 1;
                    });
                  },
                  icon: Icon(
                    Icons.book,
                  ),
                  iconSize: currentTab == 1 ? 40 : 20,
                  color: currentTab == 1 ? Colors.white : Colors.grey,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = ProfilePage();
                      currentTab = 2;
                    });
                  },
                  icon: Icon(
                    Icons.person,
                  ),
                  iconSize: currentTab == 2 ? 40 : 20,
                  color: currentTab == 2 ? Colors.white : Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
