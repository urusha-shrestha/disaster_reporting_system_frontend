import 'package:flutter/material.dart';
import 'package:fyp/controllers/databasehelper.dart';
import 'package:fyp/demo_lists/report_list.dart';
import 'package:fyp/screens/reported_disasters/text_row.dart';
import '../../constants.dart';

class ReportedBody extends StatelessWidget {
  ReportedBody({this.reportData, this.dataLength});
  final reportData;
  final int dataLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: ListView.separated(
            itemCount: dataLength,
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
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: kprimaryColour,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextRow(
                          labelText: 'Report ID: ',
                          dataText: '${reportData[index]['id']}',
                        ),
                        TextRow(
                            labelText: 'Date: ',
                            dataText: '${reportData[index]['date']}'),
                        TextRow(
                            labelText: 'Time: ',
                            dataText: '${reportData[index]['time']}'),
                        TextRow(
                            labelText: 'Location: ',
                            dataText: '${reportData[index]['location']}'),
                        TextRow(
                            labelText: 'Disaster Type: ',
                            dataText: '${reportData[index]['disaster_type']}'),
                        TextRow(
                            labelText: 'Description: ',
                            dataText: reportData[index]['description'] == null
                                ? 'No Description'
                                : '${reportData[index]['description']}'),
                        SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          height: 2.0,
                          width: double.infinity,
                          child: Container(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextRow(
                            labelText: 'Updates: ',
                            dataText: reportData[index]['updates'] == null
                                ? 'No Updates'
                                : '${reportData[index]['updates']}'),
                      ],
                    ),
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
