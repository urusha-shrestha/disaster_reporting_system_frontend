import 'package:flutter/material.dart';
import 'package:fyp/controllers/methods.dart';
import 'package:fyp/demo_lists/demoDisasterList.dart';
import 'package:fyp/screens/articles/articleList.dart';
import '../../constants.dart';

class ArticlesBody extends StatelessWidget {
  ArticlesBody({this.categories, this.dataLength});
  final categories;
  final int dataLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          child: ListView.separated(
            itemCount: dataLength,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                thickness: 2,
                color: Colors.white,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                hoverColor: kprimaryColour,
                onTap: () {
                  getArticles(context, categories[index]['id']);
                },
                title: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border:
                                Border.all(color: kprimaryColour, width: 2.5),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                '${categories[index]['category']}'
                                /*'${disasters[index]}'*/,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    /*Container(
                      child: Icon(
                        Icons.picture_in_picture_alt_outlined,
                        size: 50.0,
                      ),
                    ),*/
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
