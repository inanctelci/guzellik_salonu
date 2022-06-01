import 'package:flutter/material.dart';

import '../../../constans.dart';
import 'search_bar.dart';

class HomePageHeadLine extends StatelessWidget {
  const HomePageHeadLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SearchBar(),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications_none_rounded),
          color: primaryColor,
        ),
      ],
    );
  }
}
