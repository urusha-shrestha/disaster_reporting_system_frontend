import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

String globalDateValue;
bool dateVisible = false;

class DatePicker extends StatefulWidget {
  DateTime dateTime;
  String dateVal;
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
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
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: kprimaryColour,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      globalDateValue == null
                          ? 'Date:'
                          : ('Date: $globalDateValue'),
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
                              return Theme(
                                  data: ThemeData.dark(), child: child);
                            },
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(DateTime.now().year - 1),
                            lastDate: DateTime.now())
                        .then((date) {
                      setState(() {
                        widget.dateTime = date;
                        if (date != null) {
                          widget.dateVal =
                              "${widget.dateTime.toLocal()}".split(' ')[0];
                          globalDateValue = widget.dateVal;
                          dateVisible = false;
                        } else {
                          dateVisible = true;
                        }
                      });
                    });
                  }),
            ],
          ),
          Visibility(
            visible: dateVisible,
            child: Text(
              'Please select a date',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
