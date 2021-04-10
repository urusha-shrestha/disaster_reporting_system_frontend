import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/screens/articles/articleDisplay.dart';

class ArticleList extends StatelessWidget {
  ArticleList({this.articleData, this.dataLength});
  final articleData;
  final int dataLength;
  static const String id = 'article';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text('Article List'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        backgroundColor: kprimaryColour,
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          child: ListView.separated(
            itemCount: dataLength,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                thickness: 1,
                color: Colors.grey.shade300,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  elevation: 10,
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
                      child: ListTile(
                        onTap: () {
                          print(articleData[index]['image']);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Display(
                                        articles: articleData[index],
                                      )));
                        },
                        title: Container(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${articleData[index]['title']}',
                                style: TextStyle(fontSize: 25),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            '${articleData[index]['description']}',
                            style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
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
