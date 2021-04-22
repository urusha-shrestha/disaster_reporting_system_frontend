import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/screens/profile/delete.dart';
import 'package:fyp/screens/profile/edit_report.dart';
import 'package:fyp/screens/reported_disasters/icon_row.dart';
import 'package:fyp/screens/reported_disasters/text_row.dart';

class ProfileCardView extends StatelessWidget {
  ProfileCardView({this.reportData, this.index, this.categoryImage});
  final reportData;
  final index;
  final categoryImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        child: Card(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 80,
                              child: Image.network(
                                  'http://10.0.2.2:8000/storage/${categoryImage[index]}'),
                              //'https://thumbs.dreamstime.com/b/home-mudslide-disaster-sudden-dirt-rock-falls-towards-small-house-bottom-hill-107753912.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                '${reportData[index]['disaster_type']}',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    child: IconRow(
                                      width: false,
                                      icon: Icons.edit,
                                      dataText: 'Edit',
                                      dataTextStyle: TextStyle(
                                          fontSize: 16, color: kprimaryColour),
                                    ),
                                    onTap: () {
                                      showGeneralDialog(
                                          context: context,
                                          pageBuilder:
                                              (BuildContext buildContext,
                                                  Animation<double> animation,
                                                  Animation<double>
                                                      secondaryAnimation) {
                                            return EditReport(
                                              reportData: reportData[index],
                                            );
                                          });
                                      print('Edit button clicked');
                                    },
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  GestureDetector(
                                    child: IconRow(
                                      width: false,
                                      icon: Icons.delete_forever_rounded,
                                      dataText: 'Delete',
                                      dataTextStyle: TextStyle(
                                          fontSize: 16, color: kprimaryColour),
                                    ),
                                    onTap: () {
                                      showGeneralDialog(
                                          context: context,
                                          pageBuilder:
                                              (BuildContext buildContext,
                                                  Animation<double> animation,
                                                  Animation<double>
                                                      secondaryAnimation) {
                                            return DeleteReport(
                                              reportID: reportData[index]['id'],
                                            );
                                          });
                                    },
                                  ),
                                ],
                              ),
                              IconRow(
                                width: true,
                                icon: Icons.date_range_rounded,
                                dataText: '${reportData[index]['date']}',
                                dataTextStyle: TextStyle(fontSize: 18),
                              ),
                              IconRow(
                                width: true,
                                icon: Icons.access_time_outlined,
                                dataText: '${reportData[index]['time']}',
                                dataTextStyle: TextStyle(fontSize: 18),
                              ),
                              IconRow(
                                width: true,
                                icon: Icons.location_on_outlined,
                                dataText: '${reportData[index]['location']}',
                                dataTextStyle: TextStyle(fontSize: 18),
                              ),
                              IconRow(
                                  width: true,
                                  icon: Icons.phone,
                                  dataText: '${reportData[index]['contact']}',
                                  dataTextStyle: TextStyle(fontSize: 18)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextRow(
                    labelText: 'Description: ',
                    dataText: reportData[index]['description'] == null
                        ? 'No Description'
                        : '${reportData[index]['description']}',
                    labelTextStyle: TextStyle(
                        fontSize: 16, letterSpacing: 0.5, color: Colors.grey),
                    dataTextStyle: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 2.0,
                    width: double.infinity,
                    child: Container(
                      color: kprimaryColour,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextRow(
                    labelText: 'Updates: ',
                    dataText: reportData[index]['updates'] == null
                        ? 'No Updates'
                        : '${reportData[index]['updates']}',
                    labelTextStyle: TextStyle(
                        fontSize: 16, letterSpacing: 0.5, color: Colors.grey),
                    dataTextStyle: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
