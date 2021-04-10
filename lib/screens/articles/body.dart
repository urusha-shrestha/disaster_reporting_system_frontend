import 'package:flutter/material.dart';
import 'package:fyp/controllers/methods.dart';
import '../../constants.dart';

class ArticlesBody extends StatelessWidget {
  ArticlesBody({this.categories, this.dataLength});
  final categories;
  final int dataLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
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
              return ListTile(
                onTap: () {
                  getArticles(context, categories[index]['id']);
                },
                title: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: kprimaryColour, width: 2.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 90,
                              child: Image.network(
                                  'http://10.0.2.2:8000/storage/${categories[index]['image']}'),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                '${categories[index]['category']}'
                                /*'${disasters[index]}'*/,
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Icon(
                              Icons.double_arrow_rounded,
                              color: Colors.grey,
                            ),
                          ),
                        ],
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
