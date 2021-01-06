import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class date_picker extends StatefulWidget {
  @override
  _date_pickerState createState() => _date_pickerState();
}

class _date_pickerState extends State<date_picker> {
  DateTime _dateTime;
  String _date = " ";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                color: kprimaryColour,
              )),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  _dateTime == null ? 'Date:' : ('Date: ${_date}'),
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          RaisedButton(
              child: Text('Pick a Date'),
              onPressed: () {
                showDatePicker(
                        builder: (context, child) {
                          return Theme(data: ThemeData.dark(), child: child);
                        },
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(DateTime.now().year - 1),
                        lastDate: DateTime(DateTime.now().year + 1))
                    .then((date) {
                  setState(() {
                    _dateTime = date;
                    _date = "${_dateTime.toLocal()}".split(' ')[0];
                  });
                });
              }),
        ],
      ),
    );
  }
}
