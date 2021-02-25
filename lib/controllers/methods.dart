import 'package:flutter/material.dart';
import 'package:fyp/controllers/databasehelper.dart';
import 'package:fyp/stack.dart';

getReport(context) async {
  DatabaseHelper databaseHelper = DatabaseHelper();
  var reportData = await databaseHelper.getReportsData();
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

getArticles(context) async {
  DatabaseHelper databaseHelper = DatabaseHelper();
  var articles = await databaseHelper.getCategoriesData();
}
