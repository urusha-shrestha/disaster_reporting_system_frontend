import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/screens/profile/edit.dart';
import 'package:fyp/screens/profile/profile_card_view.dart';
import 'user_details_text.dart';

class ProfileBody extends StatelessWidget {
  ProfileBody(
      {this.userDetails,
      this.userReports,
      this.dataLength,
      this.categoryImages});
  final userDetails;
  final userReports;
  final int dataLength;
  final categoryImages;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0, right: 5),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${userDetails['user']['name']}",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.edit,
                      color: Colors.black38,
                    ),
                    onTap: () {
                      showGeneralDialog(
                          context: context,
                          pageBuilder: (BuildContext buildContext,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation) {
                            return Edit();
                          });
                      print('Edit button clicked');
                    },
                  ),
                ],
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
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                child: ListView.builder(
                                  reverse: true,
                                  shrinkWrap: true,
                                  itemCount: dataLength,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ProfileCardView(
                                      reportData: userReports,
                                      index: index,
                                      categoryImage: categoryImages,
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
