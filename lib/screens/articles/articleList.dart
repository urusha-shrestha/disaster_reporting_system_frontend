import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/demo_lists/demoArticleList.dart';
import 'package:fyp/demo_lists/demoDisasterList.dart';
import 'package:fyp/screens/articles/articleDisplay.dart';

class ArticleList extends StatelessWidget {
  ArticleList({this.articleData, this.dataLength});
  final articleData;
  final int dataLength;
  static const String id = 'article';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article List'),
        backgroundColor: kprimaryColour,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
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
              return Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: kprimaryColour,
                          width: 2,
                        )),
                    child: ListTile(
                      onTap: () {
                        print(articleData[index]);
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
                            ),
                          ),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          '${articleData[index]['description']}',
                          style: TextStyle(fontSize: 15),
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
