import 'package:flutter/material.dart';
import '../../constants.dart';

class ReportedBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: ListView.separated(
            itemCount: 10,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                thickness: 8,
                color: Colors.white,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: kprimaryColour,
                      )),
                  child: Column(
                    children: [
                      Text('Reports'),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
