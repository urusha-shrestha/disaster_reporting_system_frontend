import "package:flutter/material.dart";
import 'package:fyp/components/loading.dart';
import 'package:fyp/screens/app_bar.dart';
import 'package:fyp/screens/articles/body.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ArticlesScreen extends StatefulWidget {
  ArticlesScreen({this.categories, this.dataLength});
  final categories;
  final int dataLength;

  static const String id = 'articles_screen';

  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: buildAppBar(
          isDrawerOpen: isDrawerOpen,
          onPressedOpen: () {
            setState(() {
              xOffset = 0;
              yOffset = 0;
              scaleFactor = 1;
              isDrawerOpen = false;
            });
          },
          onPressedClosed: () {
            setState(() {
              xOffset = 230;
              yOffset = 100;
              scaleFactor = 0.8;
              isDrawerOpen = true;
            });
          },
          title: 'Articles',
        ),
        body: ArticlesBody(
          categories: widget.categories,
          dataLength: widget.dataLength,
        ),
      ),
    );
  }
}
