import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/demo_lists/demoReportList.dart';
import 'package:fyp/screens/reported_disasters/text_row.dart';
import 'user_details_text.dart';

class ProfileBody extends StatelessWidget {
  ProfileBody({this.userDetails, this.userReports, this.dataLength});
  final userDetails;
  final userReports;
  final int dataLength;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
              child: Text(
                "${userDetails['user']['name']}",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: kprimaryColour,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserDetails(text: 'User Details:', bold: FontWeight.w800),
                UserDetails(text: 'E-mail: ${userDetails['user']['email']}'),
                UserDetails(text: 'Reports: $dataLength'),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Your reports',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                          SizedBox(
                            height: 2.0,
                            width: 200.0,
                            child: Container(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: double.infinity,
                              /*decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                  color: kprimaryColour,
                                ),
                              ),*/
                              child: SizedBox(
                                height: 320,
                                child: ListView.builder(
                                  itemCount: dataLength,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            border: Border.all(
                                              color: kprimaryColour,
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            children: [
                                              TextRow(
                                                  labelText: 'Report ID: ',
                                                  dataText:
                                                      '${userReports[index]['id']}'),
                                              TextRow(
                                                  labelText: 'Date: ',
                                                  dataText:
                                                      '${userReports[index]['date']}'),
                                              TextRow(
                                                  labelText: 'Time: ',
                                                  dataText:
                                                      '${userReports[index]['time']}'),
                                              TextRow(
                                                  labelText: 'Location: ',
                                                  dataText:
                                                      '${userReports[index]['location']}'),
                                              TextRow(
                                                  labelText: 'Disaster Type: ',
                                                  dataText:
                                                      '${userReports[index]['disaster_type']}'),
                                              TextRow(
                                                  labelText: 'Description: ',
                                                  dataText: userReports[index]
                                                              ['description'] ==
                                                          null
                                                      ? 'No Description'
                                                      : '${userReports[index]['description']}'),
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
                                                  dataText: userReports[index]
                                                              ['updates'] ==
                                                          null
                                                      ? 'No Updates'
                                                      : '${userReports[index]['updates']}'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
