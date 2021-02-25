import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.all(15.0),
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
              return ListTile(
                hoverColor: kprimaryColour,
                onTap: () {
                  Navigator.of(context).pushNamed(ArticleList.id);
                },
                title: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: kprimaryColour,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('${categories[index]['category']}'),
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
