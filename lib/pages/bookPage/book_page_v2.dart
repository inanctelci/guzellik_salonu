import 'package:flutter/material.dart';

class BookPagePlus extends StatefulWidget {
  BookPagePlus({Key? key}) : super(key: key);

  @override
  State<BookPagePlus> createState() => _BookPagePlusState();
}

class _BookPagePlusState extends State<BookPagePlus> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          ExpansionTile(
            title: Text('saç'),
            children: [
              ListTile(
                title: Text('Kesim'),
                trailing: Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
              ListTile(
                title: Text('Kesim'),
                trailing: Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
