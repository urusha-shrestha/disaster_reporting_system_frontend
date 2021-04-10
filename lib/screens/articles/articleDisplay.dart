import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';

class Display extends StatelessWidget {
  Display({this.articles});
  final articles;
  static const String id = 'articleDisplay';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        title: Text('${articles['title']}'),
        backgroundColor: kprimaryColour,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
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
                        textAlign: TextAlign.center,
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
                    color: Colors.greenAccent,
                    child:
                        /*Image.network(
                      */ /*
                      'http://10.0.2.2:8000/storage/articles%5CMarch2021%5CRVsvzY0kkLsA0ZHBg32D.jpg',*/ /*
                      */ /*'http://10.0.2.2:8000/storage/articles/March2021/RVsvzY0kkLsA0ZHBg32D.jpg'*/ /*
                      'http://10.0.2.2:8000/storage/articles\March2021\RVsvzY0kkLsA0ZHBg32D.jpg',
                      height: 300.0,
                    ),*/
                        Image.network(
                      'http://10.0.2.2:8000/storage/${articles['image']}',
                      height: 300.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          '    ${articles['introduction']}',
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '    ${articles['body']}',
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.justify,
                        ),
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
