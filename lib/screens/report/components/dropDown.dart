import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/controllers/methods.dart';

bool typeVisible = false;
String dropDownValue;

class DropDown extends StatefulWidget {
  DropDown({this.categories});
  final categories;

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
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
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: kprimaryColour,
                )),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButton(
                  isExpanded: true,
                  hint: Text('Select disaster'),
                  value: dropDownValue,
                  items: disaster.map((disaster) {
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
