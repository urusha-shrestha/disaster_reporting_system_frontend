import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';

class time_picker extends StatefulWidget {
  @override
  _time_pickerState createState() => _time_pickerState();
}

class _time_pickerState extends State<time_picker> {
  TimeOfDay _time;
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
                  _time == null
                      ? 'Time:'
                      : ('Time: ${_time.hour}:${_time.minute} '),
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          RaisedButton(
              child: Text('Pick a Time'),
              onPressed: () {
                showTimePicker(
                        builder: (context, child) {
                          return Theme(data: ThemeData.dark(), child: child);
                        },
                        context: context,
                        initialTime: TimeOfDay.now())
                    .then((time) {
                  setState(() {
                    _time = time;
                  });
                });
              }),
        ],
      ),
    );
  }
}
