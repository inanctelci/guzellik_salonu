import 'package:flutter/material.dart';

import '../../../constans.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
    required this.imgPath,
    required this.changePicture,
  }) : super(key: key);

  final String imgPath;
  final VoidCallback changePicture;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.4,
      child: Stack(children: [
        Positioned(
          child: CircleAvatar(
            backgroundColor: primaryColor,
            minRadius: size.width * 0.21,
            child: CircleAvatar(
              backgroundColor: primaryColor,
              radius: size.width * 0.19,
              backgroundImage: AssetImage(imgPath),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: size.height * 0.05,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: primaryColor,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit_outlined,
                color: Colors.white,
                size: size.height * 0.03,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
