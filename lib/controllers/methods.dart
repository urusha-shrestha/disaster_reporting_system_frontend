import 'package:flutter/material.dart';
import 'package:fyp/controllers/databasehelper.dart';
import 'package:fyp/screens/articles/articleList.dart';
import 'package:fyp/stack.dart';

getReport(context) async {
  DatabaseHelper databaseHelper = DatabaseHelper();
  var reportData = await databaseHelper.getReportsData();
  //print(reportData);
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => Stack1(
                reportsData: reportData,
                dataLength: reportData.length,
              )),
      (Route<dynamic> route) => false);
}

getCategories(context) async {
  DatabaseHelper databaseHelper = DatabaseHelper();
  var categories = await databaseHelper.getCategoriesData();
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => Stack3(
                categories: categories,
                dataLength: categories.length,
              )),
      (Route<dynamic> route) => false);
}

getUserID(context) async {
  DatabaseHelper databaseHelper = DatabaseHelper();
  var data = await databaseHelper.getUserData();
  print(data);
  var userID = (data['user']['id']);
  print(userID.runtimeType);
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => Stack2(
                userID: userID,
              )),
      (Route<dynamic> route) => false);
}

getUsers(context) async {
  DatabaseHelper databaseHelper = DatabaseHelper();
  var profile = await databaseHelper.getUserData();
  //print(profile['user']['id']);
  var userReports =
      await databaseHelper.getUserReportsData(profile['user']['id']);
  //print(userReports);
  //print(userReports.length);
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => Stack4(
                userDetails: profile,
                userReports: userReports,
                dataLength: userReports.length,
              )),
      (Route<dynamic> route) => false);
}

getArticles(context, categoryID) async {
  DatabaseHelper databaseHelper = DatabaseHelper();
  var articles = await databaseHelper.getArticlesData(categoryID);
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (BuildContext context) =>
            ArticleList(articleData: articles, dataLength: articles.length)),
  );
}
