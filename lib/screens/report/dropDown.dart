import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/controllers/methods.dart';
import 'package:fyp/demo_lists/demoDisasterList.dart';

bool typeVisible = false;
String dropDownValue;

class dropDown extends StatefulWidget {
  const dropDown({
    Key key,
  }) : super(key: key);

  @override
  _dropDownState createState() => _dropDownState();
}

class _dropDownState extends State<dropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(
              color: kprimaryColour,
            )),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton(
                  isExpanded: true,
                  hint: Text('Select disaster'),
                  value: dropDownValue,
                  items: disasters.map((disaster) {
                    return DropdownMenuItem(
                      child: new Text(disaster),
                      value: disaster,
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      dropDownValue = newValue;
                      typeVisible = false;
                    });
                  }),
            ),
          ),
          Visibility(
            visible: typeVisible,
            child: Text(
              'Please select a disaster',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
