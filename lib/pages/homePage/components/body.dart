import 'package:flutter/material.dart';
import 'package:guzellik_salonu/constans.dart';

import '../../../components/build_title.dart';
import 'gallery_view.dart';
import 'headline.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: size.height * 0.01,
          ),
          const HomePageHeadLine(),
          SizedBox(
            height: size.height * 0.03,
          ),
          const BuildTitle(
            title: 'Galeri',
            textColor: primaryColor,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          GalleryView(),
          SizedBox(
            height: size.height * 0.03,
          ),
          Container(
            height: size.height * 0.001,
            color: Colors.black.withOpacity(0.3),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          BuildTitle(
            title: 'İletişim',
            textColor: primaryColor,
          ),
          Container(
            height: size.height * 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Pazartesi - Cuma',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.8)),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        '10 : 00 - 23 : 00',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Pazar',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.8)),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        '12 : 00 - 18 : 00',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Güzelyali Mahallesi 3053.sokak No:1 \nAtakum/Samsun',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      maxLines: 2,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.location_on_outlined),
                      iconSize: 30,
                      color: primaryColor,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '+90 0512 345 67 89',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      maxLines: 2,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.call),
                      iconSize: 30,
                      color: primaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
