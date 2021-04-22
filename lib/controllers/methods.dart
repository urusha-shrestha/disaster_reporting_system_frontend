import 'package:flutter/material.dart';
import 'package:fyp/components/loading.dart';
import 'package:fyp/controllers/databasehelper.dart';
import 'package:fyp/screens/articles/articleList.dart';
import 'package:fyp/stack.dart';

List images = [];
List userImages = [];
getImages(reportData) {
  DatabaseHelper databaseHelper = DatabaseHelper();
  reportData.forEach((element) async {
    var test = await databaseHelper.getCategoryImage(element['disaster_type']);
    var i = test[0]['image'];
    print('test $i');
    images.add(i);
  });
}

getUserImages(reportData) {
  DatabaseHelper databaseHelper = DatabaseHelper();
  reportData.forEach((element) async {
    var test = await databaseHelper.getCategoryImage(element['disaster_type']);
    var i = test[0]['image'];
    print('test $i');
    userImages.add(i);
  });
}

getReport(context) async {
  isLoading = true;
  DatabaseHelper databaseHelper = DatabaseHelper();
  List reportData = await databaseHelper.getReportsData();
  images.clear();
  await getImages(reportData);
  Future.delayed(Duration(seconds: 3), () {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => Stack1(
                  reportsData: reportData,
                  dataLength: reportData.length,
                  categoryImage: images,
                )),
        (Route<dynamic> route) => false);
  });
  isLoading = false;
}

getCategories(context) async {
  isLoading = true;
  DatabaseHelper databaseHelper = DatabaseHelper();
  var categories = await databaseHelper.getCategoriesData();
  Future.delayed(Duration(seconds: 3), () {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => Stack3(
                  categories: categories,
                  dataLength: categories.length,
                )),
        (Route<dynamic> route) => false);
  });

  isLoading = false;
}

List<String> disaster = [];
getUserID(context) async {
  isLoading = true;
  DatabaseHelper databaseHelper = DatabaseHelper();
  var data = await databaseHelper.getUserData();
  List categories = await databaseHelper.getCategoriesData();
  disaster.clear();
  //print(disaster);
  categories.forEach((element) {
    disaster.add(element['category']);
  });
  //print(disaster);
  var userID = (data['user']['id']);
  //print(userID);
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => Stack2(
                userID: userID,
                categories: disaster,
              )),
      (Route<dynamic> route) => false);
  isLoading = false;
}

getUsers(context) async {
  isLoading = true;
  DatabaseHelper databaseHelper = DatabaseHelper();
  var profile = await databaseHelper.getUserData();
  var userReports =
      await databaseHelper.getUserReportsData(profile['user']['id']);
  userImages.clear();
  await getUserImages(userReports);
  Future.delayed(Duration(seconds: 2), () {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => Stack4(
                  userDetails: profile,
                  userReports: userReports,
                  dataLength: userReports.length,
                  categoryImages: userImages,
                )),
        (Route<dynamic> route) => false);
  });
  isLoading = false;
}

getArticles(context, categoryID) async {
  isLoading = true;
  DatabaseHelper databaseHelper = DatabaseHelper();
  var articles = await databaseHelper.getArticlesData(categoryID);
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (BuildContext context) =>
            ArticleList(articleData: articles, dataLength: articles.length)),
  );
  isLoading = false;
}
