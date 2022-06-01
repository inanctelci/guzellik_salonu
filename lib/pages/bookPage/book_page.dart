import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:guzellik_salonu/constans.dart';
import 'package:guzellik_salonu/components/build_title.dart';

import 'components/service_list.item.dart';

class BookPage extends StatefulWidget {
  BookPage({Key? key}) : super(key: key);
  bool val = true;
  String selectedTime = '';
  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black.withOpacity(0.4),
            ),
            DatePicker(
              DateTime.now(),
              daysCount: 14,
              selectionColor: primaryColor,
              locale: 'tr_Tr',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: timeZones.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buildTimeButton(context, index),
                  );
                },
              ),
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black.withOpacity(0.4),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            BuildTitle(
              title: 'Saç',
              textColor: primaryColor,
            ),
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
      ),
    );
  }

  Container buildTimeButton(BuildContext context, int index) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.04,
      width: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
        color: widget.selectedTime == timeZones[index]
            ? primaryColor
            : Colors.white, //*******/
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: primaryColor),
      ),
      child: Center(
          child: TextButton(
        onPressed: widget.val == true
            ? () {
                setState(() {
                  widget.selectedTime = timeZones[index];
                });
              }
            : null,
        child: Text(
          timeZones[index],
          style: TextStyle(
            color: widget.selectedTime == timeZones[index]
                ? Colors.white
                : primaryColor, //******/
            fontFamily: 'Sans',
            fontWeight: FontWeight.bold,
          ),
        ),
      )),
    );
  }
}
