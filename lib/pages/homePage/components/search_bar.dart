import 'package:flutter/material.dart';
import 'package:guzellik_salonu/constans.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for saloons, services...',
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: primaryColor, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: primaryColor),
          ),
          suffixIcon: Icon(
            Icons.search_outlined,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
