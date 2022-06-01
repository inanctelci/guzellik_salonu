import 'package:flutter/material.dart';

class ServicesListItem extends StatefulWidget {
  ServicesListItem({
    Key? key,
    required this.label,
    required this.price,
    required this.imgSrc,
  }) : super(key: key);

  final String label;
  final String price;
  final String imgSrc;

  bool isSelected = false;

  @override
  State<ServicesListItem> createState() => _ServicesListItemState();
}

class _ServicesListItemState extends State<ServicesListItem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.18,
      width: size.width * 0.4,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('assets/images/sac_kesimi.png'),
          fit: BoxFit.cover,
          opacity: 0.6,
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black.withOpacity(0.1), Colors.black.withOpacity(1)],
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                widget.label,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Sans',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                widget.price,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Sans',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Checkbox(
              value: widget.isSelected,
              onChanged: (value) {
                setState(() {
                  widget.isSelected = value ?? false;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
