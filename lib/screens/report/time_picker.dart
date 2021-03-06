import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';

bool timeVisible = false;
String globalTimeValue;

class time_picker extends StatefulWidget {
  TimeOfDay timeValue;
  String timeVal;
  @override
  _time_pickerState createState() => _time_pickerState();
}

class _time_pickerState extends State<time_picker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                      globalTimeValue == null
                          ? 'Time:'
                          : ('Time: ${globalTimeValue} '),
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
                              return Theme(
                                  data: ThemeData.dark(), child: child);
                            },
                            context: context,
                            initialTime: TimeOfDay.now())
                        .then((time) {
                      setState(() {
                        widget.timeValue = time;
                        if (time != null) {
                          widget.timeVal =
                              '${(widget.timeValue.hour).toString()}:${(widget.timeValue.minute).toString()}';
                          globalTimeValue = widget.timeVal;
                          timeVisible = false;
                        } else {
                          timeVisible = true;
                        }
                      });
                    });
                  }),
            ],
          ),
          Visibility(
              visible: timeVisible,
              child: Text(
                'Please select a time',
                style: TextStyle(color: Colors.red),
              )),
        ],
      ),
    );
  }
}
