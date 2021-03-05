import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/demo_lists/demoArticleList.dart';

class Display extends StatelessWidget {
  Display({this.articles});
  final articles;
  static const String id = 'articleDisplay';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${articles['title']}'),
        backgroundColor: kprimaryColour,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: kprimaryColour,
                  width: 2,
                )),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: Container(
                      child: Text(
                        '${articles['title']}',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${articles['author']}  ',
                      ),
                      SizedBox(
                        width: 1,
                        height: 20,
                        child: Container(
                          color: Colors.black,
                        ),
                      ),
                      Text('  ${articles['date']}'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 300.0,
                    color: Colors.greenAccent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          '    ${articles['introduction']}',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text('    ${articles['body']}',
                            style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
