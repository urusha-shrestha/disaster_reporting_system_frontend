import 'package:flutter/material.dart';
import 'package:fyp/screens/reported_disasters/card_view.dart';

class ReportedBody extends StatelessWidget {
  ReportedBody({this.reportData, this.dataLength, this.categoryImage});
  final reportData;
  final int dataLength;
  final categoryImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: ListView.separated(
            reverse: true,
            shrinkWrap: true,
            itemCount: dataLength,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 10,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              print(index);
              return CardView(
                reportData: reportData,
                index: index,
                categoryImage: categoryImage,
              );
              /*Padding(
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
              );*/
            },
          ),
        ),
      ),
    );
  }
}
