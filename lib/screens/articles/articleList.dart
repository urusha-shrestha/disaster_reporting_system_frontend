import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/demo_lists/demoDisasterList.dart';
import 'package:fyp/screens/articles/articleDisplay.dart';

class ArticleList extends StatelessWidget {
  static const String id = 'article';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article List'),
        backgroundColor: kprimaryColour,
      ),
      body: Container(
        child: ListView.separated(
          itemCount: articles.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              thickness: 8,
              color: Colors.white,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: kprimaryColour,
                    )),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed(Display.id);
                  },
                  title: Container(child: Center(child: Text(articles[index]))),
                  subtitle: Text('short description'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
