import 'package:flutter/material.dart';
import 'package:fyp/components/custom_button.dart';

import '../../constants.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: kprimaryColour), color: Colors.white54),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Container(
                      child: Text(
                        'Confirm Submission',
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: Icon(Icons.close),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  decoration:
                      BoxDecoration(border: Border.all(color: kprimaryColour)),
                  child: Column(
                    children: [
                      Container(
                        height: 400.0,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(onPressed: () {}, buttonText: 'Confirm'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
