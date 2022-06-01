import 'package:flutter/material.dart';
import 'package:guzellik_salonu/pages/homePage/components/gallery_item.dart';

class GalleryView extends StatelessWidget {
  const GalleryView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          GalleryItem(
              size: MediaQuery.of(context).size,
              largeImage: 'assets/images/guzellik_salonu0.png',
              smallImageTop: 'assets/images/guzellik_salonu1.png',
              smallImageBottom: 'assets/images/guzellik_salonu2.png'),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.020,
          ),
          GalleryItem(
              size: MediaQuery.of(context).size,
              largeImage: 'assets/images/guzellik_salonu3.png',
              smallImageTop: 'assets/images/guzellik_salonu4.png',
              smallImageBottom: 'assets/images/guzellik_salonu5.png'),
        ],
      ),
    );
  }
}
