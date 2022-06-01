import 'package:flutter/material.dart';
import 'package:guzellik_salonu/constans.dart';

class GalleryItem extends StatelessWidget {
  const GalleryItem({
    Key? key,
    required this.size,
    required this.largeImage,
    required this.smallImageTop,
    required this.smallImageBottom,
  }) : super(key: key);

  final Size size;
  final String largeImage;
  final String smallImageTop;
  final String smallImageBottom;

  @override
  Widget build(BuildContext context) {
    double containerWidth = (size.width - (size.width * 0.060 * 2));
    double containerHeight = size.height * 0.3;
    return Container(
      height: size.height * 0.3,
      child: Row(
        children: [
          Container(
            width: (containerWidth / 2) - size.width * 0.010,
            decoration: BoxDecoration(
              color: Colors.amber,
              image: DecorationImage(
                  image: AssetImage(largeImage), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
              border:
                  Border.all(color: primaryColor.withOpacity(0.5), width: 0.5),
            ),
          ),
          SizedBox(
            width: size.width * 0.020,
          ),
          Container(
            width: ((containerWidth) / 2) - size.width * 0.010,
            child: Column(
              children: [
                Container(
                  height: (size.height * 0.15) - (size.height * 0.005),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    image: DecorationImage(
                        image: AssetImage(smallImageTop), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: primaryColor.withOpacity(0.5), width: 0.5),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.010,
                ),
                Container(
                  height: (size.height * 0.15) - (size.height * 0.005),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    image: DecorationImage(
                        image: AssetImage(smallImageBottom), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: primaryColor.withOpacity(0.5), width: 0.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
